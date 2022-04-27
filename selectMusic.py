# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'selectMusic.ui'
#
# Created by: PyQt5 UI code generator 5.15.4
#
# WARNING! All changes made in this file will be lost!

from PyQt5 import QtCore, QtGui, QtWidgets

class Ui_selectMusic(object):
    def setupUi(self, selectMusic):
        selectMusic.setObjectName("selectMusic")
        selectMusic.resize(400, 300)
        self.verticalLayout = QtWidgets.QVBoxLayout(selectMusic)
        self.verticalLayout.setObjectName("verticalLayout")
        self.listView = QtWidgets.QListView(selectMusic)
        self.listView.setObjectName("listView")
        self.verticalLayout.addWidget(self.listView)
        self.buttonBox = QtWidgets.QDialogButtonBox(selectMusic)
        self.buttonBox.setOrientation(QtCore.Qt.Horizontal)
        self.buttonBox.setStandardButtons(QtWidgets.QDialogButtonBox.Cancel|QtWidgets.QDialogButtonBox.Ok)
        self.buttonBox.setObjectName("buttonBox")
        self.verticalLayout.addWidget(self.buttonBox)

        self.retranslateUi(selectMusic)
        self.buttonBox.accepted.connect(selectMusic.accept)
        self.buttonBox.rejected.connect(selectMusic.reject)
        QtCore.QMetaObject.connectSlotsByName(selectMusic)

    def retranslateUi(self, selectMusic):
        _translate = QtCore.QCoreApplication.translate
        selectMusic.setWindowTitle(_translate("selectMusic", "选择音乐"))

