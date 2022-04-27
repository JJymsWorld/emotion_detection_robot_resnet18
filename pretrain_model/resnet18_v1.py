import tensorflow as tf
import utils
import numpy as np
import scipy.io as sio
import cv2

class Resnet18:
    def __init__(self, input,classes,Training,keep_prob):
        self.x = input
        self.classes = classes
        self.is_training = Training
        self.keep_prob = keep_prob
        self.inference()

    def branch1(self, x, numOut, s):
        with tf.variable_scope("conv1"):
            conv1 = utils.relu(utils.Bn(utils.conv2d(x, numOut, 3, 3, d_h=s, d_w=s), training=self.is_training))
        with tf.variable_scope("conv2"):
            conv2 = utils.Bn(utils.conv2d(conv1, numOut, 3, 3), training=self.is_training)
        return conv2

    def branch2(self, x, numOut, s):
        with tf.variable_scope("convshortcut"):
            return utils.Bn(utils.conv2d(x, numOut, d_h=s, d_w=s), training=self.is_training)

    def residual(self, x, numOut, stride=1, branch=False, name='res'):
        with tf.variable_scope(name):
            block = self.branch1(x, numOut, stride)
            if x.get_shape().as_list()[3] != numOut or branch:
                skip = self.branch2(x, numOut, stride)
                return utils.relu(tf.add_n([block, skip]))
            else:
                return utils.relu(tf.add_n([x, block]))

    def inference(self):
        with tf.variable_scope("conv0"):
            self.conv1 = utils.relu(utils.Bn(utils.conv2d(self.x, 64, 7, 7, 2, 2, bias=False), training=self.is_training))
        with tf.name_scope("pool1"):
            self.pool1 = utils.max_pool(self.conv1, 3, 3, 2, 2)
        with tf.variable_scope("group0"):
            self.res2a = self.residual(self.pool1, 64, branch=True, name='block0')
            self.res2b = self.residual(self.res2a, 64, name='block1')
        with tf.variable_scope("group1"):
            self.res3a = self.residual(self.res2b, 128, 2, name='block0')
            self.res3b = self.residual(self.res3a, 128, name='block1')
        with tf.variable_scope("group2"):
            self.res4a = self.residual(self.res3b, 256, 2, name='block0')
            self.res4b = self.residual(self.res4a, 256, name='block1')
        with tf.variable_scope("group3"):
            self.res5a = self.residual(self.res4b, 512, 2, name='block0')
            self.res5b = self.residual(self.res5a, 512, name='block1')
        with tf.name_scope("pool5"):
            self.pool5 = utils.global_pool(self.res5b)
        # with tf.variable_scope("linear"):
        #     self.dropout = tf.nn.dropout(self.pool5, keep_prob=self.keep_prob)
        #     self.out = utils.linear(self.dropout, self.classes)
        return self.pool5

class Branch_seven_net:
    def __init__(self, input,classes,Training,branch_num,branch_size,keep_prob):
        self.x = input
        self.classes = classes
        self.is_training = Training
        self.keep_prob = keep_prob
        self.branch_num = branch_num
        self.branch_size = branch_size
        self.inference()

    def branch1(self, x, numOut, s):
        with tf.variable_scope("conv1"):
            conv1 = utils.relu(utils.Bn(utils.conv2d(x, numOut, 3, 3, d_h=s, d_w=s), training=self.is_training))
        with tf.variable_scope("conv2"):
            conv2 = utils.Bn(utils.conv2d(conv1, numOut, 3, 3), training=self.is_training)
        return conv2

    def branch2(self, x, numOut, s):
        with tf.variable_scope("convshortcut"):
            return utils.Bn(utils.conv2d(x, numOut, d_h=s, d_w=s), training=self.is_training)

    def residual(self, x, numOut, stride=1, branch=False, name='res'):
        with tf.variable_scope(name):
            block = self.branch1(x, numOut, stride)
            if x.get_shape().as_list()[3] != numOut or branch:
                skip = self.branch2(x, numOut, stride)
                return utils.relu(tf.add_n([block, skip]))
            else:
                return utils.relu(tf.add_n([x, block]))

    def inference(self):
        with tf.variable_scope("conv0"):
            self.conv1 = utils.relu(utils.Bn(utils.conv2d(self.x, 64, 7, 7, 2, 2, bias=False), training=self.is_training))
        with tf.name_scope("pool1"):
            self.pool1 = utils.max_pool(self.conv1, 3, 3, 2, 2)
        with tf.variable_scope("group0"):
            self.res2a = self.residual(self.pool1, 64, branch=True, name='block0')
            self.res2b = self.residual(self.res2a, 64, name='block1')
        with tf.variable_scope("group1"):
            self.res3a = self.residual(self.res2b, 128, 2, name='block0')
            self.res3b = self.residual(self.res3a, 128, name='block1')
        with tf.variable_scope("group2"):
            self.res4a = self.residual(self.res3b, 256, 2, name='block0')
            self.res4b = self.residual(self.res4a, 256, name='block1')
        with tf.variable_scope("group3"):
            self.res5a = self.residual(self.res4b, 512, 2, name='block0')
            self.res5b = self.residual(self.res5a, 512, name='block1')
        with tf.name_scope("pool5"):
            self.pool5 = utils.global_pool(self.res5b)
            self.flatten = tf.layers.flatten(self.pool5, name='flatten')

            self.features = []
            self.features_relu = []

            for i in range(1, self.branch_num + 1):
                feature_name = 'feature' + str(i)
                self.feature = tf.layers.dense(self.flatten, units=self.branch_size, name=feature_name)
                self.features.append(self.feature)
                self.feature_relu = tf.nn.relu(self.feature)
                self.features_relu.append(self.feature_relu)

            self.concat = tf.concat(self.features_relu, axis=1)
            self.merge = tf.nn.dropout(self.concat, self.keep_prob)
            print(self.merge.get_shape())
            self.softmax = tf.layers.dense(self.merge, units=self.classes, name='softmax')

