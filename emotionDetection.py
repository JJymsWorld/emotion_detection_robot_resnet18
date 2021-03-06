# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'emotionDetection.ui'
#
# Created by: PyQt5 UI code generator 5.15.4
#
# WARNING! All changes made in this file will be lost!

from PyQt5 import QtCore, QtGui, QtWidgets

class Ui_emotionDetectWindow(object):
    def setupUi(self, emotionDetectWindow):
        emotionDetectWindow.setObjectName("emotionDetectWindow")
        emotionDetectWindow.resize(800, 480)
        self.centralwidget = QtWidgets.QWidget(emotionDetectWindow)
        self.centralwidget.setObjectName("centralwidget")
        self.gridLayout = QtWidgets.QGridLayout(self.centralwidget)
        self.gridLayout.setObjectName("gridLayout")
        self.horizontalLayout = QtWidgets.QHBoxLayout()
        self.horizontalLayout.setObjectName("horizontalLayout")
        self.DisplayCamera = QtWidgets.QLabel(self.centralwidget)
        sizePolicy = QtWidgets.QSizePolicy(QtWidgets.QSizePolicy.Expanding, QtWidgets.QSizePolicy.Expanding)
        sizePolicy.setHorizontalStretch(1)
        sizePolicy.setVerticalStretch(0)
        sizePolicy.setHeightForWidth(self.DisplayCamera.sizePolicy().hasHeightForWidth())
        self.DisplayCamera.setSizePolicy(sizePolicy)
        self.DisplayCamera.setCursor(QtGui.QCursor(QtCore.Qt.ArrowCursor))
        self.DisplayCamera.setAlignment(QtCore.Qt.AlignCenter)
        self.DisplayCamera.setObjectName("DisplayCamera")
        self.horizontalLayout.addWidget(self.DisplayCamera)
        self.verticalLayout = QtWidgets.QVBoxLayout()
        self.verticalLayout.setObjectName("verticalLayout")
        self.formLayout = QtWidgets.QFormLayout()
        self.formLayout.setObjectName("formLayout")
        self.nowPreResult = QtWidgets.QLabel(self.centralwidget)
        font = QtGui.QFont()
        font.setPointSize(10)
        self.nowPreResult.setFont(font)
        self.nowPreResult.setObjectName("nowPreResult")
        self.formLayout.setWidget(0, QtWidgets.QFormLayout.LabelRole, self.nowPreResult)
        self.label = QtWidgets.QLabel(self.centralwidget)
        font = QtGui.QFont()
        font.setPointSize(10)
        self.label.setFont(font)
        self.label.setObjectName("label")
        self.formLayout.setWidget(0, QtWidgets.QFormLayout.FieldRole, self.label)
        self.volumeAdjust = QtWidgets.QLabel(self.centralwidget)
        self.volumeAdjust.setObjectName("volumeAdjust")
        self.formLayout.setWidget(1, QtWidgets.QFormLayout.LabelRole, self.volumeAdjust)
        self.horizontalSlider = QtWidgets.QSlider(self.centralwidget)
        self.horizontalSlider.setOrientation(QtCore.Qt.Horizontal)
        self.horizontalSlider.setObjectName("horizontalSlider")
        self.formLayout.setWidget(1, QtWidgets.QFormLayout.FieldRole, self.horizontalSlider)
        self.noVolume = QtWidgets.QLabel(self.centralwidget)
        self.noVolume.setObjectName("noVolume")
        self.formLayout.setWidget(2, QtWidgets.QFormLayout.LabelRole, self.noVolume)
        self.checkBox = QtWidgets.QCheckBox(self.centralwidget)
        self.checkBox.setObjectName("checkBox")
        self.formLayout.setWidget(2, QtWidgets.QFormLayout.FieldRole, self.checkBox)
        self.BlueToothStatus = QtWidgets.QLabel(self.centralwidget)
        self.BlueToothStatus.setObjectName("BlueToothStatus")
        self.formLayout.setWidget(3, QtWidgets.QFormLayout.LabelRole, self.BlueToothStatus)
        self.BluetoothStatusRes = QtWidgets.QLabel(self.centralwidget)
        self.BluetoothStatusRes.setObjectName("BluetoothStatusRes")
        self.formLayout.setWidget(3, QtWidgets.QFormLayout.FieldRole, self.BluetoothStatusRes)
        self.remind = QtWidgets.QLabel(self.centralwidget)
        self.remind.setObjectName("remind")
        self.formLayout.setWidget(4, QtWidgets.QFormLayout.LabelRole, self.remind)
        self.textBrowser_2 = QtWidgets.QTextBrowser(self.centralwidget)
        self.textBrowser_2.setObjectName("textBrowser_2")
        self.formLayout.setWidget(4, QtWidgets.QFormLayout.FieldRole, self.textBrowser_2)
        self.verticalLayout.addLayout(self.formLayout)
        self.horizontalLayout.addLayout(self.verticalLayout)
        self.gridLayout.addLayout(self.horizontalLayout, 0, 0, 1, 1)
        self.horizontalLayout_2 = QtWidgets.QHBoxLayout()
        self.horizontalLayout_2.setContentsMargins(-1, 0, -1, -1)
        self.horizontalLayout_2.setSpacing(6)
        self.horizontalLayout_2.setObjectName("horizontalLayout_2")
        self.startButton = QtWidgets.QPushButton(self.centralwidget)
        self.startButton.setObjectName("startButton")
        self.horizontalLayout_2.addWidget(self.startButton)
        self.stopButton = QtWidgets.QPushButton(self.centralwidget)
        self.stopButton.setObjectName("stopButton")
        self.horizontalLayout_2.addWidget(self.stopButton)
        self.MusicList = QtWidgets.QPushButton(self.centralwidget)
        self.MusicList.setObjectName("MusicList")
        self.horizontalLayout_2.addWidget(self.MusicList)
        spacerItem = QtWidgets.QSpacerItem(40, 20, QtWidgets.QSizePolicy.Expanding, QtWidgets.QSizePolicy.Minimum)
        self.horizontalLayout_2.addItem(spacerItem)
        self.StopPlay = QtWidgets.QPushButton(self.centralwidget)
        self.StopPlay.setObjectName("StopPlay")
        self.horizontalLayout_2.addWidget(self.StopPlay)
        self.BluetoothConnect = QtWidgets.QPushButton(self.centralwidget)
        self.BluetoothConnect.setObjectName("BluetoothConnect")
        self.horizontalLayout_2.addWidget(self.BluetoothConnect)
        self.exitButton = QtWidgets.QPushButton(self.centralwidget)
        self.exitButton.setObjectName("exitButton")
        self.horizontalLayout_2.addWidget(self.exitButton)
        self.gridLayout.addLayout(self.horizontalLayout_2, 1, 0, 1, 1)
        emotionDetectWindow.setCentralWidget(self.centralwidget)
        self.menubar = QtWidgets.QMenuBar(emotionDetectWindow)
        self.menubar.setGeometry(QtCore.QRect(0, 0, 800, 30))
        self.menubar.setObjectName("menubar")
        emotionDetectWindow.setMenuBar(self.menubar)
        self.statusbar = QtWidgets.QStatusBar(emotionDetectWindow)
        self.statusbar.setObjectName("statusbar")
        emotionDetectWindow.setStatusBar(self.statusbar)

        self.retranslateUi(emotionDetectWindow)
        QtCore.QMetaObject.connectSlotsByName(emotionDetectWindow)

    def retranslateUi(self, emotionDetectWindow):
        _translate = QtCore.QCoreApplication.translate
        emotionDetectWindow.setWindowTitle(_translate("emotionDetectWindow", "EmotionDetection"))
        self.DisplayCamera.setText(_translate("emotionDetectWindow", "???????????????????????????????????????"))
        self.nowPreResult.setText(_translate("emotionDetectWindow", "??????????????????: "))
        self.label.setText(_translate("emotionDetectWindow", "???????????????????????????"))
        self.volumeAdjust.setText(_translate("emotionDetectWindow", "????????????"))
        self.noVolume.setText(_translate("emotionDetectWindow", "??????"))
        self.checkBox.setText(_translate("emotionDetectWindow", "off"))
        self.BlueToothStatus.setText(_translate("emotionDetectWindow", "????????????"))
        self.BluetoothStatusRes.setText(_translate("emotionDetectWindow", "???????????????"))
        self.remind.setText(_translate("emotionDetectWindow", "??????: "))
        self.startButton.setText(_translate("emotionDetectWindow", "??????"))
        self.stopButton.setText(_translate("emotionDetectWindow", "??????"))
        self.MusicList.setText(_translate("emotionDetectWindow", "????????????"))
        self.StopPlay.setText(_translate("emotionDetectWindow", "????????????"))
        self.BluetoothConnect.setText(_translate("emotionDetectWindow", "??????"))
        self.exitButton.setText(_translate("emotionDetectWindow", "????????????"))

