import cv2 as cv
from use_onnx_model_gpu import predict_emotion2
import time
from threading import Thread

def async_fun(f):
    def inner_fun(*args, **kwargs):
        t = Thread(target=f, args=args, kwargs=kwargs)
        t.start()
    return inner_fun


@async_fun
def pre_image(frame):
    pre_result = predict_emotion2(frame)
    return pre_result

cap = cv.VideoCapture(0)
#cap.set(6, cv.VideoWriter.fourcc('M', 'J', 'P', 'G'))
face_detect = cv.CascadeClassifier(
    'haarcascade_frontalface_default.xml')
starttime = time.time()
while True:
    flag, frame = cap.read()
    frame = cv.flip(frame, 1)
    frame = cv.resize(frame, (480, 320))
    endtime = time.time()
    if (endtime - starttime) >= 5:
        preresult = pre_image(frame)
        starttime = endtime
    # if not flag:
    #     break
    # gray = cv.cvtColor(frame, cv.COLOR_BGR2GRAY)
    # gray = cv.equalizeHist(gray)

    # face_zone = face_detect.detectMultiScale(
    #     gray, scaleFactor=1.1, minNeighbors=5)

    # for x, y, w, h in face_zone:
    #     cv.rectangle(frame, pt1=(x, y), pt2=(x + w, y + h),
    #                  color=[0, 0, 255], thickness=2)
        # cv.circle(frame, center=(x + w // 2, y + h // 2), radius=w // 2, color=[0, 255, 0], thickness=2)

    cv.imshow('video', frame)
    if ord('q') == cv.waitKey(1) & 0xFF:
        break

cap.release()
cv.destroyAllWindows()


