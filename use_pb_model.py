import os
#os.environ['TF_CPP_MIN_LOG_LEVEL'] = '1'
import tensorflow as tf
import argparse
import numpy as np
import cv2
from sep_LoadAndTest import Model_test
import time
os.environ["CUDA_VISIBLE_DEVICES"] = "-1"
#os.environ["TF_GPU_ALLOCATOR"] = "cuda_malloc_async"
def load_graph(frozen_graph_file):
    with tf.gfile.GFile(frozen_graph_file, 'rb') as f:
        graph_def = tf.GraphDef()
        graph_def.ParseFromString(f.read())

    with tf.Graph().as_default() as graph:
        tf.import_graph_def(graph_def, name='prefix')
    return graph



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
    graph = load_graph("./frozen_model.pb")
    X = graph.get_tensor_by_name('prefix/Placeholder:0')
    # Y_one_hot = graph.get_tensor_by_name('prefix/Placeholder_1:0')
    TRAINING = graph.get_tensor_by_name('prefix/Placeholder_2:0')

    logit = graph.get_tensor_by_name('prefix/dense/BiasAdd:0')

    predict_label = tf.argmax(logit, 1)
    with tf.Session(graph=graph) as sess:

        # read image

        path = image_path
        images = adj_image(path)

        one_hot_labels = np.zeros((1, 7))

        pre_label = sess.run([predict_label], feed_dict={X: images, TRAINING: False})
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
    sess.close()
    return pre_result



if __name__ == '__main__':
    startTime = time.time()
    result = predict_emotion("test_image/test2.jpg")
    endTime = time.time()
    print((endTime - startTime))

