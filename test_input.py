import tensorflow as tf
import os

from torch import dtype
from res18 import resnet
import time
import shutil
from generate_input_data import Input_generator
import numpy as np
import argparse
import sys

os.environ["CUDA_VISIBLE_DEVICES"] = '2'

val_path = '/media/D/xjw/MNI/resnet18/CAER-S/test_crop.txt'
parser = argparse.ArgumentParser()
config = parser.parse_args(sys.argv[1:])
notrestore_layer = ['dense']
class_num = 7
val_data_generator = Input_generator(val_path, class_num, shuffle=False)
val_batch = int(np.floor(val_data_generator.data_size / 1))  # np.floor 返回不大于输入参数的最大整数
print(val_batch)



def Softmax_loss(net_out, gt):
    with tf.name_scope('softmax_loss'):  # 命名空间
        cross_entropy = tf.nn.softmax_cross_entropy_with_logits(logits=net_out, labels=gt)
        softmax_loss = tf.reduce_mean(cross_entropy)
        l2_loss = tf.losses.get_regularization_loss()
        tf.add_to_collection('losses', softmax_loss)  # 将元素softmax_loss添加到列表losses中
        all_loss = tf.add_n(tf.get_collection('losses')) + l2_loss  # 返回名称为losses的列表
        tf.summary.scalar('losses', all_loss)  # 画图

    return all_loss

def Accuracy(net_out, one_hot_label):
    with tf.name_scope('accuracy'):
        pre_label = tf.argmax(net_out, 1)
        correct_predict = tf.equal(tf.argmax(net_out, 1), tf.argmax(one_hot_label, 1))
        accuracy = tf.reduce_mean(tf.cast(correct_predict, tf.float32))
    tf.summary.scalar('accuracy', accuracy)
    return accuracy, pre_label

with tf.Session()as sess:
    X = tf.placeholder(dtype=tf.float32, shape=[None, 224, 224, 3])  # [batch, height, width, channels]

    Y_one_hot = tf.placeholder(dtype=tf.float32, shape=[None, class_num])
    TRAINING = tf.placeholder(dtype=tf.bool)
    model = resnet(X, class_num, TRAINING)

    softmax_output = model.logits
    

    loss = Softmax_loss(softmax_output, Y_one_hot)
    acc, predict_label = Accuracy(softmax_output, Y_one_hot)
    
    restorer = tf.train.Saver()
    sess.run(tf.global_variables_initializer())
    
    restorer.restore(sess, '/media/D/znx/MNI/resnet18/pretrain_model/epoch24')
    
    print("Starting Testing")
    
    mean_val_acc = 0
    mean_val_loss = 0
    y_predict = []
    print('-------------------------------------------------------')
    print(val_batch)
    for i in range(1, val_batch + 1):
        print("{}      Batch number : {}".format(time.strftime("%Y-%m-%d %H:%M:%S"), i))
        val_x, val_y_one_hot, val_y = val_data_generator.next_batch(1, aug_data=False)
        val_loss, val_acc, pre_label = sess.run([loss, acc, predict_label],
                                                feed_dict={X: val_x, Y_one_hot: val_y_one_hot, TRAINING: False})
      
        y_predict.append(pre_label)
        mean_val_acc += val_acc
        mean_val_loss += val_loss
    mean_val_acc /= val_batch
    mean_val_loss /= val_batch
    print("val_loss:{:.4f}           val_acc :{:.4f}".format(mean_val_loss, mean_val_acc))
    print('*************')
    print(val_data_generator.images)
    print(y_predict)
    f = open('/media/D/znx/MNI/resnet18/image/mmm.txt', 'w')
    num = 0
    for i in val_data_generator.images:
        a = int(y_predict[num])
        out = i + ' ' + str(a)
        num += 1
        print(out)
        f.write(out + '\n')
    f.close()
    

sess.close()

print("Training Done")


