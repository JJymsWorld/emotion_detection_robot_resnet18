import tensorflow as tf
import os
from tensorflow.python.tools import freeze_graph
from res18 import resnet

model_path = "pretrain_model/epoch24"

tf.reset_default_graph()

class_num = 7
X = tf.placeholder(dtype=tf.float32, shape=[None, 224, 224, 3])
Y_one_hot = tf.placeholder(dtype=tf.float32, shape=[None, class_num])
TRAINING = tf.placeholder(dtype=tf.bool)

output_node = resnet(X, class_num, TRAINING).logits

flow = tf.cast(output_node, tf.float32, 'dense/BiasAdd')

saver = tf.train.Saver()
with tf.Session() as sess:
    saver.restore(sess, model_path)
    tf.train.write_graph(sess.graph_def, 'output_model/pb_model', 'model.pb')
    freeze_graph.freeze_graph('output_model/pb_model/model.pb', '', False, model_path, 'dense/BiasAdd', 'save/restore_all',
                              'save/Const:0', 'output_model/pb_model/frozen_model.pb', False, "")

print("done")


