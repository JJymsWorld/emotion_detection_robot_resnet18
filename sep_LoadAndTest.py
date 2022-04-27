import tensorflow as tf
from res18 import resnet
import numpy as np
import cv2


class Model_test():
    def __init__(self):
        self.flag = False


    def load(self, model_path):
        with tf.gfile.GFile(model_path, 'rb') as f:
            graph_def = tf.GraphDef()
            graph_def.ParseFromString(f.read())

        with tf.Graph().as_default() as graph:
            tf.import_graph_def(graph_def, name='prefix')
        self.graph = graph
        self.sess =tf.Session(graph=self.graph)
        self.flag = True

    def center_crop(self, image, crop_size):
        h, w, _ = image.shape
        top = (h - crop_size[0]) // 2
        left = (w - crop_size[1]) // 2
        bottom = top + crop_size[0]
        right = left + crop_size[1]
        image = image[top:bottom, left:right, :]
        return image

    def adj_image(self, path):
        input_size = (224, 224)
        images = np.ndarray([1, input_size[0], input_size[1], 3])
        img = cv2.imread(path)
        img = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
        img = cv2.resize(img, (236, 236))
        if img is None:
            raise RuntimeError('can not read image file:{}'.format(path))
        else:
            img = self.center_crop(img, (224, 224))
        img = img.astype(np.float32)
        mean, stev = cv2.meanStdDev(img)
        img[:, :, 0] = (img[:, :, 0] - mean[0][0]) / stev[0][0]
        img[:, :, 1] = (img[:, :, 1] - mean[1][0]) / stev[1][0]
        img[:, :, 2] = (img[:, :, 2] - mean[2][0]) / stev[2][0]
        images[0] = img
        return images

    def predict_image(self, image_path):
        X = self.graph.get_tensor_by_name('prefix/Placeholder:0')
        TRAINING = self.graph.get_tensor_by_name('prefix/Placeholder_2:0')
        logit = self.graph.get_tensor_by_name('prefix/dense/BiasAdd:0')
        predict_label = tf.argmax(logit, 1)
        images = self.adj_image(image_path)
        pre_label = self.sess.run([predict_label], feed_dict={X: images, TRAINING: False})
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
        return pre_result