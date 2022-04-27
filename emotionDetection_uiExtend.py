import time

import cv2
from PyQt5 import QtCore, QtGui, QtWidgets
from emotionDetection import Ui_emotionDetectWindow
import sys
import cv2 as cv
from PyQt5.QtGui import *
from PyQt5.QtWidgets import *
from PyQt5.QtCore import *
# from PyQt5.QtMultimedia import *
import os
from selectBluetooth_extend import *
from selectMusic_extend import *
from use_tensorRT_engine import *
import tensorrt as trt
import pycuda.driver as cuda
import pycuda.autoinit
import common
import numpy as np
from collections import Counter
import pygame
# import threading
from mutagen.mp3 import MP3
# import inspect
# import ctypes
import bluetooth
import random
from bluetooth import *




class EmotionDetectionQT(Ui_emotionDetectWindow, QWidget):
    tips_signal = pyqtSignal(int)
    def __init__(self):
        super(EmotionDetectionQT, self).__init__()
        self.timer_camera = QTimer() #设置定时器，用于固定时间刷新QLabel用以动态显示摄像头画面
        self.cap = cv.VideoCapture() #获取摄像头捕捉器
        self.CAM_NUM = 0

        self.dialogNum = 0 #蓝牙选择对话框的数量，用于控制蓝牙选择对话框的打开与关闭
        self.MusicDialogNum = 0  #选择音乐对话框的数量 用于控制对话框的打开与关闭
        self.edw = None   #edw为获取的mainwindow句柄
        self.engine_file_path = 'model_wa2_fp16.trt'
        self.TRT_LOGGER = trt.Logger()
        self.f = open(self.engine_file_path, 'rb')  #读取tensorRT engine引擎文件
        self.runtime = trt.Runtime(self.TRT_LOGGER)
        self.engine = self.runtime.deserialize_cuda_engine(self.f.read())  #动态创建tensorRT引擎
        self.context = self.engine.create_execution_context()  #获取tensorRT执行的上下文环境
        self.label_name = {
            0: 'Neutral',
            1: 'Happy',
            2: 'Sad',
            3: 'Surprise',
            4: 'Fear',
            5: 'Disgust',
            6: 'Anger'
        }
        self.nowVolume = 0.6  #当前音量
        self.preVolume = -1.0  #设置静音前的音量 用于取消静音时重设音量
        pygame.mixer.music.set_volume(self.nowVolume)
        # self.player = QMediaPlayer()
        self.isPlaying = False #判断当前是否处于播放状态 没用
        self.isPredicting = False  #判断当前是否处于正在进行表情检测 用于控制启动和关闭
        self.isStart = False
        self.startTime = None #与下面的endtime一起用于设定固定时间执行投票算法
        self.endTime = None
        self.happyStartTime = None #与下面的happyEndtime一起用于计算愉快学习的时间并给予激励和提醒
        self.happyEndtime = None
        self.resultListforVote = []   #投票结果
        self.t = None
        self.incentive1 = False
        self.incentive2 = False
        self.tipsNum = 0
        self.preMusic = None
        self.BluetoochController = Bluetooth_comm()

    def slot_init(self, edw):  #Qt信号槽初始化函数
        self.startButton.clicked.connect(self.button_open_camera_clicked)
        self.timer_camera.timeout.connect(self.show_camera)
        self.stopButton.clicked.connect(self.button_stop_camera)
        self.exitButton.clicked.connect(self.exit_application)
        self.BluetoothConnect.clicked.connect(self.show_select_bluetooth_Dialog)
        self.checkBox.stateChanged.connect(self.set_volume_null_or_renew)
        self.horizontalSlider.valueChanged.connect(self.changeVolume)
        self.StopPlay.clicked.connect(self.stopPlayMusic)
        self.MusicList.clicked.connect(self.show_selectMusic_dialog)
        self.tips_signal.connect(self.deal_tips_signal)
        self.BluetoochController.bluetooth_signal.connect(self.BluetoothFunController)
        self.BluetoochController.start()

    def BluetoothFunController(self, flag):
        if flag == 0:
            self.BluetoothStatusRes.setText("蓝牙已连接")
        if flag == -1:
            self.BluetoothStatusRes.setText("蓝牙未连接")
        if flag == 1:
            self.button_open_camera_clicked()
        if flag == 2:
            self.button_stop_camera()
        if flag == 3:
            musicList = os.listdir('audio_and_music')
            index = random.randint(0, len(musicList))
            musicPath = os.path.join('./audio_and_music', musicList[index])
            self.startPlay(musicPath)
        if flag == 4:
            self.stopPlayMusic()
        if flag == 5:
            self.checkBox.setChecked(True)
        if flag == 6:
            self.checkBox.setChecked(False)


    def exit_application(self):  #设置退出时销毁打开的资源
        # pygame.quit()
        self.f.close()
        if self.timer_camera.isActive():
            self.timer_camera.stop()
        del self.f
        del self.runtime
        del self.context
        del self.TRT_LOGGER
        self.edw.close()

    def setupUi(self, edw):  #配置mainwindow,并初始化信号槽等
        super().setupUi(edw)
        self.slot_init(edw)
        self.edw = edw
        self.stopButton.setDisabled(True)
        self.horizontalSlider.setMaximum(100)
        self.horizontalSlider.setMinimum(0)
        self.horizontalSlider.setValue(self.nowVolume * 100)

    def button_open_camera_clicked(self):
        flag = self.cap.open(self.CAM_NUM)
        if flag == False:
            msg = QtWidgets.QMessageBox.warning(self, 'warning', "请检查相机与电脑连接是否正确", QtWidgets.QMessageBox.Ok)
        else:
            self.timer_camera.start(30)
            self.startTime = time.time()
            self.happyStartTime = time.time()
            self.isPredicting = True
            self.isStart = True
            self.startButton.setDisabled(True)
            self.stopButton.setDisabled(False)

    def button_stop_camera(self):
        self.timer_camera.stop()
        self.cap.release()
        self.DisplayCamera.clear()
        self.startButton.setDisabled(False)
        self.stopButton.setDisabled(True)
        self.isStart = False
        self.isPredicting = False
        self.label.setText("请首先开启识别功能")

    def show_camera(self):
        flag, self.image = self.cap.read()
        show = cv.resize(self.image, (420, 280))
        show = cv.flip(show, 1)
        predict_result = self.predice_emotion(self.image)
        self.resultListforVote.append(predict_result)
        self.endTime = time.time()
        self.happyEndtime = time.time()
        if self.endTime - self.startTime >= 10:
            self.Vote_al(self.resultListforVote)
            self.startTime = time.time()
            self.resultListforVote.clear()
        if self.happyEndtime - self.happyStartTime >= 1800 and self.incentive1 == False:
            self.tips_signal.emit(1)
            self.incentive1 = True
        if self.happyEndtime- self.happyEndtime >= 2700 and self.incentive2 == False:
            self.tips_signal.emit(2)
            self.incentive2 = True
        self.label.setText(predict_result)
        show = cv.cvtColor(show, cv.COLOR_BGR2RGB)
        showImage = QImage(show.data, show.shape[1], show.shape[0], QImage.Format_RGB888)
        self.DisplayCamera.setPixmap(QPixmap.fromImage(showImage))

    def Vote_al(self, seconds_result_list): #投票算法
        counter = Counter(seconds_result_list)
        if counter['Sad'] > 15 or counter['Fear'] > 18:
            self.tips_signal.emit(4)
        elif counter['Anger'] > 40 or counter['Disgust'] > 40:
            self.tips_signal.emit(3)
        # elif counter.most_common(1)[0] == 'Fear':
        #     self.startPlay()
        print(counter)
        print("投票结果：", counter.most_common(1)[0])

    def deal_tips_signal(self, flag):
        if flag == 1:
            self.startPlay("./tips_audio/激励_30分钟.mp3")
            self.textBrowser_2.setText("做的不错哦，已经坚持了30分钟了，继续加油，再接再厉！")
        if flag == 2:
            self.startPlay("./tips_audio/45分钟_放松休息.mp3")
            self.textBrowser_2.setText("太棒了，你已经坚持认真学习45分钟了，稍微活动，放松一下身体吧。")
        if flag == 3:
            if self.tipsNum % 3 == 1:
                self.startPlay('./tips_audio/困扰.mp3')
                self.textBrowser_2.setText("遇到什么困扰了吗，虽然我不清楚是什么问题，但是一定要保持积极的心态哦！")
                self.tipsNum = (self.tipsNum + 1) % 3
                print("tipsNum:", self.tipsNum)
            elif self.tipsNum % 3 == 2:
                self.startPlay('./tips_audio/焦虑_运动.mp3')
                self.textBrowser_2.setText("看的出来你有点焦虑，要不要站起来，深呼吸然后做一些运动放松一下身体呢。")
                self.tipsNum = (self.tipsNum + 1) % 3
                print("tipsNum:", self.tipsNum)
            elif self.tipsNum % 3 == 0:
                self.startPlay('./tips_audio/焦虑_音乐.mp3')
                self.textBrowser_2.setText("看的出来你有点焦虑，要不要听首音乐，让自己放松一下呢。")
                self.tipsNum = (self.tipsNum + 1) % 3
                print("tipsNum:", self.tipsNum)
                reply = QMessageBox.information(self, '播放音乐', '是否播放音乐?', QMessageBox.Yes, QMessageBox.No)
                if reply == QMessageBox.Yes:
                    musicList = os.listdir('audio_and_music')
                    index = random.randint(0, len(musicList))
                    musicPath = os.path.join('./audio_and_music', musicList[index])
                    self.startPlay(musicPath)

        if flag == 4:
            self.startPlay('./tips_audio/沮丧.mp3')
            self.textBrowser_2.setText("不要沮丧，你已经做的很棒了，要相信自己，坚持一定会有收获的！")



    def show_select_bluetooth_Dialog(self):
        if self.dialogNum == 0:
            select_blue_dia = SelectBluetooth()
            self.dialogNum += 1
            select_blue_dia.SelectSignal.connect(self.deal_selectBluetooth_signal)
            select_blue_dia.show()
            select_blue_dia.exec_()
            self.dialogNum -= 1

    def deal_selectBluetooth_signal(self, deviceinfo):
        print("蓝牙请求设备信息: ", deviceinfo)

    def show_selectMusic_dialog(self):
        if self.MusicDialogNum == 0:
            select_Music_dia = SelectMusic()
            self.MusicDialogNum += 1
            select_Music_dia.Signal_parp.connect(self.deal_selectMusic_signal)
            select_Music_dia.show()
            select_Music_dia.exec_()
            self.MusicDialogNum -= 1
    def deal_selectMusic_signal(self, MusicPath):
        self.startPlay(MusicPath)

    def predice_emotion(self, image):
        inputs, outputs, bindings, stream = common.allocate_buffers(self.engine)
        image = adj_image2(image)
        image = np.transpose(image, [0, 3, 1, 2])
        t_bool = np.array(0)
        np.copyto(t_bool, t_bool)
        load_images_to_buffer(image, inputs[0].host)
        inputs[1].host = t_bool.astype(np.bool)
        trt_outputs = common.do_inference_v2(self.context, bindings, inputs, outputs, stream)
        pre_label = np.argmax(trt_outputs, 1)
        pre_result = self.label_name[pre_label[0]]
        return pre_result

    def set_volume_null_or_renew(self):
        if self.checkBox.isChecked() == True:
            self.checkBox.setText("on")
            if self.horizontalSlider.value() > 0:
                self.preVolume = self.horizontalSlider.value() / 100.0
            self.horizontalSlider.setValue(0)
            print("静音")
        if self.checkBox.isChecked() == False:
            self.checkBox.setText("off")
            if self.preVolume != -1.0:
                self.horizontalSlider.setValue(self.preVolume * 100)
            else:
                self.horizontalSlider.setValue(self.nowVolume * 100)
            print("恢复音量")

    def changeVolume(self):
        value = self.horizontalSlider.value()
        self.nowVolume = value / 100.0
        if self.nowVolume == 0.0:
            self.checkBox.setChecked(True)
        elif self.checkBox.isChecked() == True:
            self.checkBox.setChecked(False)

        pygame.mixer.music.set_volume(self.nowVolume)
        # self.player.setVolume(self.nowVolume)
        print("设置音量为%f" % value)

    def stopPlayMusic(self):
        if pygame.mixer.music.get_busy() == True:
            pygame.mixer.music.stop()
        print("Stop Play Music")
        # self.isPlaying = False

    def startPlay(self, musicPath):
        # self.PlayMusic(musicPath)
        # if self.isPlaying == False:
            # self.isPlaying = True
            # self.t = threading.Thread(target=self.PlayMusic, args=(musicPath,))
            # self.t.setDaemon(True)
            # self.t.start()

            # self.PlayMusic(musicPath)
        if pygame.mixer.music.get_busy() == False:
            self.preMusic = musicPath
            self.PlayMusic(musicPath)
        else:
            if self.preMusic != musicPath:
                pygame.mixer.music.stop()
                self.preMusic = musicPath
                self.PlayMusic(musicPath)



    def PlayMusic(self, musicPath):
        # url = QUrl.fromLocalFile(musicPath)
        # content = QMediaContent(url)
        # self.player.setMedia(content)
        # self.player.play()

        track = pygame.mixer.music.load(musicPath)
        audio = MP3(musicPath)
        pygame.mixer.music.play()
        print("时长：", audio.info.length)
        # time.sleep(int(audio.info.length))
        # pygame.mixer.music.stop()
        # self.isPlaying = False


class Bluetooth_comm(QThread):
    bluetooth_signal = pyqtSignal(int)
    def __init__(self):
        super(Bluetooth_comm, self).__init__()

    def run(self):
        server_sock = BluetoothSocket(RFCOMM)
        server_sock.bind(("", PORT_ANY))
        server_sock.listen(1)
        port = server_sock.getsockname()[1]
        uuid = "94f39d29-7d6d-437d-973b-fba39e49d4ee"
        advertise_service(server_sock, "BlueToothServer", service_id=uuid,
                          service_classes=[uuid, SERIAL_PORT_CLASS],
                          profiles=[SERIAL_PORT_PROFILE])
        print("Waiting for connection on RFCOMM channel %d" % port)
        client_sock, client_intfo = server_sock.accept()
        print("Accept connection from", client_intfo)
        self.bluetooth_signal.emit(0)
        client_sock.send("已连接成功")
        try:
            while True:
                data = client_sock.recv(1024)
                if str(data.decode()) == '1': #开启表情检测功能
                    self.bluetooth_signal.emit(1)
                    client_sock.send("开启表情检测")
                if str(data.decode()) == '2':
                    self.bluetooth_signal.emit(2)
                    client_sock.send("关闭表情检测")
                if str(data.decode()) == '3':
                    self.bluetooth_signal.emit(3)
                    client_sock.send("播放音乐")
                if str(data.decode()) == '4':
                    self.bluetooth_signal.emit(4)
                    client_sock.send("停止播放")
                if str(data.decode()) == '5':
                    self.bluetooth_signal.emit(5)
                    client_sock.send("静音")
                if str(data.decode()) == '6':
                    self.bluetooth_signal.emit(6)
                    client_sock.send("取消静音")
                # if len(data) == 0: break
                if str(data.decode()) == ' ': break
                # print("received [%s]" %data.decode())
        except IOError:
            print("disconnected")
        print("disconnected")
        self.bluetooth_signal.emit(-1)
        client_sock.send("已断开连接")
        client_sock.close()
        server_sock.close()



if __name__ == "__main__":
    app = QtWidgets.QApplication(sys.argv)
    widget = QtWidgets.QMainWindow()
    pygame.mixer.init()
    ui = EmotionDetectionQT()
    ui.setupUi(widget)
    widget.show()
    sys.exit(app.exec_())
