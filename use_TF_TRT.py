import tensorflow as tf
from tensorflow.python.compiler.tensorrt import trt_convert as trt
import os
#os.environ['TF_CPP_MIN_LOG_LEVEL'] = '1'
import argparse
import numpy as np
import cv2
from sep_LoadAndTest import Model_test
import time
os.environ["CUDA_VISIBLE_DEVICES"] = "0"


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




X = tf.placeholder(dtype=tf.float32, shape=[None, 224, 224, 3])
# Y_one_hot = graph.get_tensor_by_name('prefix/Placeholder_1:0')
TRAINING = tf.placeholder(dtype=tf.bool)

with tf.Session() as sess:
    with tf.gfile.GFile("frozen_model.pb", 'rb') as f:
        frozen_graph = tf.GraphDef()
        frozen_graph.ParseFromString(f.read())
    
    converter = trt.TrtGraphConverter(
        input_graph_def = frozen_graph,
        nodes_blacklist = ['dense/BiasAdd']
    )
    trt_graph = converter.convert()
    output_node = tf.import_graph_def(
        trt_graph,
        return_elements=['dense/BiasAdd']
    )

    path = "test_image/test1.jpg"
    images = adj_image(path)

    pre_label = sess.run(output_node, feed_dict={"import/Placeholder": images})
    # pre_label = sess.run([predict_label], feed_dict={X: images})
    label_name = {
        0: 'Neutral',
        1: 'Happy',
        2: 'Sad',
        3: 'Surprise',
        4: 'Fear',
        5: 'Disgust',
        6: 'Anger'
    }
    pre_result = label_name[pre_label[0][0]]
    print("预测结果: ", pre_result)