import time

from sep_LoadAndTest import Model_test

tst = Model_test()

def pre_img(path):
    global tst
    if tst.flag == False:
        tst.load("frozen_model.pb")
    tst.predict_image(path)

if __name__ == '__main__':
    startTime = time.time()
    pre_img('test_image/test.jpg')
    endTime = time.time()
    print(endTime - startTime)