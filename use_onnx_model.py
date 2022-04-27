# - - coding: UTF-8 -- 

import os
# os.environ['TF_CPP_MIN_LOG_LEVEL'] = '3'
import numpy
os.environ["CUDA_VISIBLE_DEVICES"] = "-1"
import tensorflow as tf
import argparse
import numpy as np
import cv2
# from sep_LoadAndTest import Model_test
import time
import onnx
import onnxruntime as rt



def center_crop(image, crop_size):
    h, w, _ = image.shape
    top = (h - crop_size[0]) // 2
    left = (w - crop_size[1]) // 2
    bottom = top + crop_size[0]
    right = left + crop_size[1]
    image = image[top:bottom, left:right, :]
    return image

def adj_image(path):
    input_size = (224, 224)
    images = np.ndarray([1, input_size[0], input_size[1], 3])
    img = cv2.imread(path)
    img = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
    img = cv2.resize(img, (236, 236))
    if img is None:
        raise RuntimeError('can not read image file:{}'.format(path))
    else:
        img = center_crop(img, (224, 224))
    img = img.astype(np.float32)
    mean, stev = cv2.meanStdDev(img)
    img[:, :, 0] = (img[:, :, 0] - mean[0][0]) / stev[0][0]
    img[:, :, 1] = (img[:, :, 1] - mean[1][0]) / stev[1][0]
    img[:, :, 2] = (img[:, :, 2] - mean[2][0]) / stev[2][0]
    images[0] = img
    return images


def predict_emotion(image_path):
    # onnx_model = onnx.load_model("model_wa.onnx")
    # onnx.checker.check_model(onnx_model)
    sess = rt.InferenceSession("model_wa.onnx", providers=['CPUExecutionProvider'])
    X = sess.get_inputs()[0].name
    print(sess.get_inputs()[1])
    TRAINING = sess.get_inputs()[1].name
    prelabel = sess.get_outputs()[0].name

    path = image_path
    images = adj_image(path)
    print(images.shape, type(images))
    pre_label = sess.run([prelabel], {X: images.astype(np.float32), TRAINING: numpy.array((0)).astype(numpy.bool)})

    pre_label = tf.argmax(pre_label[0], 1)
    sess2 = tf.InteractiveSession()
    pre_label = sess2.run(pre_label)
    sess2.close()
    label_name = {
        0: 'Neutral',
        1: 'Happy',
        2: 'Sad',
        3: 'Surprise',
        4: 'Fear',
        5: 'Disgust',
        6: 'Anger'
    }
    pre_result = label_name[pre_label[0]]
    print("Pre_result: ", pre_result)
    
    return pre_result



if __name__ == '__main__':
    startTime = time.time()
    result = predict_emotion("test_image/test2.jpg")
    endTime = time.time()
    print((endTime - startTime))


