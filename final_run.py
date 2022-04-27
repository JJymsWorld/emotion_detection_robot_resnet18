
import os
os.environ['TF_CPP_MIN_LOG_LEVEL'] = '3'
import tensorflow as tf
from res18 import resnet
import time
import shutil
from generate_input_data import Input_generator
import numpy as np
import argparse
import sys
import cv2


os.environ["CUDA_VISIBLE_DEVICES"] = '-1'
parser = argparse.ArgumentParser()
config = parser.parse_args(sys.argv[1:])
notrestore_layer = ['dense']
class_num = 7


# def Softmax_loss(net_out, gt):
#     with tf.name_scope('softmax_loss'):  # 命名空间
#         cross_entropy = tf.nn.softmax_cross_entropy_with_logits(logits=net_out, labels=gt)
#         softmax_loss = tf.reduce_mean(cross_entropy)
#         l2_loss = tf.losses.get_regularization_loss()
#         tf.add_to_collection('losses', softmax_loss)  # 将元素softmax_loss添加到列表losses中
#         all_loss = tf.add_n(tf.get_collection('losses')) + l2_loss  # 返回名称为losses的列表
#         tf.summary.scalar('losses', all_loss)  # 画图
#
#     return all_loss
#
# def Accuracy(net_out, one_hot_label):
#     with tf.name_scope('accuracy'):
#         pre_label = tf.argmax(net_out, 1)
#         correct_predict = tf.equal(tf.argmax(net_out, 1), tf.argmax(one_hot_label, 1))
#         accuracy = tf.reduce_mean(tf.cast(correct_predict, tf.float32))
#     tf.summary.scalar('accuracy', accuracy)
#     return accuracy, pre_label


def center_crop(image, crop_size):
    h, w, _ = image.shape
    top = (h - crop_size[0]) // 2
    left = (w - crop_size[1]) // 2
    bottom = top + crop_size[0]
    right = left + crop_size[1]
    image = image[top:bottom, left:right, :]
    return image



X = tf.placeholder(dtype=tf.float32, shape=[None, 224, 224, 3])
Y_one_hot = tf.placeholder(dtype=tf.float32, shape=[None, class_num])
TRAINING = tf.placeholder(dtype=tf.bool)

startTime = time.time()
with tf.Session()as sess:
    model = resnet(X, class_num, TRAINING)

    softmax_output = model.logits
    print('1', softmax_output)

    # loss = Softmax_loss(softmax_output, Y_one_hot)
    # acc, predict_label = Accuracy(softmax_output, Y_one_hot)
    predict_label = tf.argmax(softmax_output, 1, name="pre_label")

    restorer = tf.train.Saver()
    sess.run(tf.global_variables_initializer())

    restorer.restore(sess, 'pretrain_model/epoch24')

    print("Starting Testing")



    #read image
    input_size = (224, 224)
    images = np.ndarray([1, input_size[0], input_size[1], 3])
    path = 'test_image/test1.jpg'
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

    one_hot_labels = np.zeros((1, class_num))

    pre_label = sess.run([predict_label], feed_dict={X: images, Y_one_hot: one_hot_labels, TRAINING: False})

    label_name = {
        0: 'Neutral',
        1: 'Happy',
        2: 'Sad',
        3: 'Surprise',
        4: 'Fear',
        5: 'Disgust',
        6: 'Anger'
    }

    print("预测结果: ", label_name[pre_label[0][0]])

sess.close()

print("Test Done")
endTime = time.time()
print((endTime - startTime))
