from PyQt5 import QtCore, QtWidgets, QtGui
from PyQt5.QtCore import *
from PyQt5.QtWidgets import *
import sys
from selectMusic import Ui_selectMusic
import os

class SelectMusic(Ui_selectMusic, QtWidgets.QDialog):
    Signal_parp = pyqtSignal(str)
    def __init__(self):
        super(SelectMusic, self).__init__()
        self.setupUi(self)
        self.musicFileList = [name for name in os.listdir("audio_and_music") if name.endswith(".mp3")]
        self.musicListPath = []
        for music in self.musicFileList:
            self.musicListPath.append(os.path.join("./audio_and_music", music))
        self.slm = QStringListModel()
        self.listView.clicked.connect(self.AcceptButton_clicked)
        self.slm.setStringList(self.musicFileList)
        self.listView.setModel(self.slm)

    def AcceptButton_clicked(self, qModelIndex):
        # QMessageBox.information(self, 'ListWidget', 'you select the ' + self.musicFileList[qModelIndex.row()])
        musicPath = self.musicListPath[qModelIndex.row()]
        self.Signal_parp.emit(musicPath)
        self.close()


if __name__ == "__main__":
    app = QtWidgets.QApplication(sys.argv)
    widget = QtWidgets.QDialog()
    ui = SelectMusic()
    ui.setupUi(widget)
    widget.show()
    sys.exit(app.exec_())
