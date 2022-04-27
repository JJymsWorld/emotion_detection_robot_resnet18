from PyQt5 import QtCore, QtWidgets, QtGui
from PyQt5.QtCore import *
from PyQt5.QtWidgets import *
import sys
from selectBluetooth import Ui_selectBluetooth
import bluetooth

class SelectBluetooth(Ui_selectBluetooth, QtWidgets.QDialog):
    SelectSignal = pyqtSignal(tuple)
    def __init__(self):
        super(SelectBluetooth, self).__init__()
        self.setupUi(self)
        self.gif = QtGui.QMovie('loading1.gif')
        self.loadingGif.setMovie(self.gif)
        self.gif.start()
        self.slm = QStringListModel()
        self.deviceInfoList = None
        self.nowSelectItem = None
        self.listView.clicked.connect(self.dealClickedSelect)
        self.buttonBox.accepted.connect(self.accpetButtonClicked)
        self.findDeviceProcess = FindDevice()
        self.findDeviceProcess.Signal.connect(self.dealSignal_fun)
        self.findDeviceProcess.start()

    def dealSignal_fun(self, deviceinfolist):
        self.deviceInfoList = deviceinfolist
        if len(self.deviceInfoList) == 0:
            self.loadingGif.setText("未查找到蓝牙设备")
        elif len(self.deviceInfoList) > 0:
            device_name_list = [device[1] for device in self.deviceInfoList]
            self.slm.setStringList(device_name_list)
            self.listView.setModel(self.slm)
            self.loadingGif.setText("查找完成")

    def dealClickedSelect(self, qModelIndex):
        self.nowSelectItem = self.deviceInfoList[qModelIndex.row()]

    def accpetButtonClicked(self):
        self.SelectSignal.emit(self.nowSelectItem)
        self.close()


    # def find_nearby_devices(self):
    #     self.nearby_device_info = bluetooth.discover_devices(lookup_names=True, duration=10)
    #     if len(self.nearby_device_info) == 0:
    #         self.loadingGif.setText("未查找到蓝牙设备")
    #     elif len(self.nearby_device_info) > 0:
    #         device_name_list = [device[1] for device in self.nearby_device_info]
    #         self.slm.setStringList(device_name_list)
    #         self.listView.setModel(self.slm)
    #         self.loadingGif.setText("查找完成")


class FindDevice(QThread):
    Signal = pyqtSignal(list)
    def __init__(self):
        super(FindDevice, self).__init__()

    def run(self):
        nearby_device_list = bluetooth.discover_devices(lookup_names=True, duration=8)
        self.Signal.emit(nearby_device_list)


if __name__ == "__main__":
    app = QtWidgets.QApplication(sys.argv)
    widget = QtWidgets.QDialog()
    ui = SelectBluetooth()
    ui.setupUi(widget)
    widget.show()
    sys.exit(app.exec_())
