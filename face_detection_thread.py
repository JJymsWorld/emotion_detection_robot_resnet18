import cv2 as cv
import numpy as np
import threading
import ctypes
import inspect

cap = cv.VideoCapture(0)

face_detect = cv.CascadeClassifier('haarcascade_frontalface_default.xml')

def _async_raise(tid, exctype):
    tid = ctypes.c_long(tid)
    if not inspect.isclass(exctype):
        exctype = type(exctype)
    res = ctypes.pythonapi.PyThreadState_SetAsyncExc(tid, ctypes.py_object(exctype))
    if res == 0:
        raise ValueError('invalid thread id')
    elif res != 1:
        ctypes.pythonapi.PyThreadState_SetAsyncExc(tid, None)
        raise SystemError("PyThreadState_SetAsyncExc failed")

def stop_thread(thread):
    _async_raise(thread.ident, SystemExit)



def Video_display():
    dispW = 480
    dispH = 320
    while True:
        flag, frame = cap.read()
        frame = cv.resize(frame, (dispW, dispH))
        frame = cv.flip(frame, 1)
        if not flag:
            break
        gray = cv.cvtColor(frame, cv.COLOR_BGR2GRAY)
        gray = cv.equalizeHist(gray)
        face_zone = face_detect.detectMultiScale(
            gray, scaleFactor=1.1, minNeighbors=5)
        for x, y, w, h in face_zone:
            cv.rectangle(frame, pt1=(x, y), pt2=(x + w, y + h),
                         color=[0, 0, 255], thickness=2)
        cv.imshow('video', frame)
        if ord('q') == cv.waitKey(1) & 0xFF:
            break
    cap.release()
    cv.destroyAllWindows()

if __name__ == '__main__':
    t = threading.Thread(target=Video_display())
    t.setDaemon(True)
    t.start()
