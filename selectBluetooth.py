# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'selectBluetooth.ui'
#
# Created by: PyQt5 UI code generator 5.15.4
#
# WARNING! All changes made in this file will be lost!

from PyQt5 import QtCore, QtGui, QtWidgets

class Ui_selectBluetooth(object):
    def setupUi(self, selectBluetooth):
        selectBluetooth.setObjectName("selectBluetooth")
        selectBluetooth.resize(400, 300)
        self.verticalLayout_2 = QtWidgets.QVBoxLayout(selectBluetooth)
        self.verticalLayout_2.setObjectName("verticalLayout_2")
        self.verticalLayout = QtWidgets.QVBoxLayout()
        self.verticalLayout.setObjectName("verticalLayout")
        self.loadingGif = QtWidgets.QLabel(selectBluetooth)
        sizePolicy = QtWidgets.QSizePolicy(QtWidgets.QSizePolicy.Preferred, QtWidgets.QSizePolicy.Expanding)
        sizePolicy.setHorizontalStretch(0)
        sizePolicy.setVerticalStretch(0)
        sizePolicy.setHeightForWidth(self.loadingGif.sizePolicy().hasHeightForWidth())
        self.loadingGif.setSizePolicy(sizePolicy)
        self.loadingGif.setAlignment(QtCore.Qt.AlignCenter)
        self.loadingGif.setObjectName("loadingGif")
        self.verticalLayout.addWidget(self.loadingGif)
        self.verticalLayout_2.addLayout(self.verticalLayout)
        self.listView = QtWidgets.QListView(selectBluetooth)
        self.listView.setObjectName("listView")
        self.verticalLayout_2.addWidget(self.listView)
        self.buttonBox = QtWidgets.QDialogButtonBox(selectBluetooth)
        self.buttonBox.setOrientation(QtCore.Qt.Horizontal)
        self.buttonBox.setStandardButtons(QtWidgets.QDialogButtonBox.Cancel|QtWidgets.QDialogButtonBox.Ok)
        self.buttonBox.setObjectName("buttonBox")
        self.verticalLayout_2.addWidget(self.buttonBox)

        self.retranslateUi(selectBluetooth)
        # self.buttonBox.accepted.connect(selectBluetooth.accept)
        self.buttonBox.rejected.connect(selectBluetooth.reject)
        QtCore.QMetaObject.connectSlotsByName(selectBluetooth)

    def retranslateUi(self, selectBluetooth):
        _translate = QtCore.QCoreApplication.translate
        selectBluetooth.setWindowTitle(_translate("selectBluetooth", "蓝牙连接"))
        self.loadingGif.setText(_translate("selectBluetooth", "loading"))

