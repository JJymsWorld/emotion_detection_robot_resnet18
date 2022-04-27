import tensorflow as tf
import os
from res18 import resnet
import time
import shutil
from generate_input_data import Input_generator
import numpy as np
from matplotlib import pyplot as plt
import argparse
import sys

# 灰度图
# sfew
# train_path='/media/zsl/D/yjy/code/PycharmRemoteServerTestPro/baseline1/txt/aug_train_mess.txt'
# val_path='/media/zsl/D/yjy/code/PycharmRemoteServerTestPro/baseline1/txt/aug_val_mess.txt'
# rafdb
# train_path='/media/zsl/D/yjy/code/PycharmRemoteServerTestPro/baseline1/txt/train_RAFDB.txt'
# val_path='/media/zsl/D/yjy/code/PycharmRemoteServerTestPro/baseline1/txt/val_RAFDB.txt'


# 彩色图
# affectnet
# train_path='/media/zsl/D/yjy/FER/basenet/data/train_no_mess.txt'
# val_path='/media/zsl/D/yjy/FER/basenet/data/val_no_mess.txt'
# sfew
# train_path='/media/zsl/D/yjy/data/SFEW/SFEW_COLOR/train_aligment_aug/train_aligment_aug_mess.txt'
# val_path ='/media/zsl/D/yjy/data/SFEW/SFEW_COLOR/val_aligment/val_aligment.txt'
# train_path='/media/zsl/D/yjy/data/SFEW/SFEW_COLOR/train__aug.txt'
# val_path ='/media/zsl/D/yjy/data/SFEW/SFEW_COLOR/val.txt'
# rafdb

# train_path = '/media/zsl/D/yjy/data/RAF/RAF_rgb/train_aug/train_aug_mess.txt'
train_path = '/media/zsl/D/xjw/MNI/resnet18/RAF-DB/train_part.txt'
# val_path = '/media/zsl/D/yjy/code/PycharmRemoteServerTestPro/baseline1/txt/sfew2/val_rgb/val.txt'
val_path = '/media/zsl/D/xjw/MNI/resnet18/RAF-DB/test_ori.txt'
# 创建一个解析器
parser = argparse.ArgumentParser()

# 添加参数
# parser.add_argument("--num",type=str,default='1')
# parser.add_argument("--cuda_device",type=str,default='0')


# 把parser中设置的所有"add_argument"给返回到config子类实例当中， 那么parser中增加的属性内容都会在config实例中
config = parser.parse_args(sys.argv[1:])
# os.environ['CUDA_VISIBLE_DEVICES'] =config.cuda_device
# train_num=config.num

# restore_layer=['conv1','bn_conv1','res2a_branch2b','bn2a_branch2b','res2a_branch2c','bn2a_branch2c','res2b_branch2b','bn2b_branch2b',
#                'res2b_branch2c','bn2b_branch2c','res3a_branch2a','bn3a_branch2a','res3a_branch2b','bn3a_branch2b','res3a_branch1','bn3a_branch1','res3b_branch2b','bn3b_branch2b',
#                'res3b_branch2c','bn3b_branch2c','res4a_branch2a','bn4a_branch2a','res4a_branch2b','res4a_branch2b','bn4a_branch2b','res4a_branch1','bn4a_branch1','res4b_branch2b',
#                'bn4b_branch2b','res4b_branch2c','bn4b_branch2c','res5a_branch2a','bn5a_branch2a','res5a_branch2b','bn5a_branch2b','res5a_branch1','bn5a_branch1','res5b_branch2b',
#                'bn5b_branch2b','res5b_branch2c','bn5b_branch2c']
notrestore_layer = ['dense']
# Learning params
os.environ['CUDA_VISIBLE_DEVICES'] = '2'
learning_rate = 1e-4
epochs = 70
# epochs = 3
batch_size = 80
class_num = 7
train_num = 3

model_path = './models_' + '%d' % train_num
# 是否有文件，没有则创建
if os.path.exists(model_path):
    shutil.rmtree(model_path)
os.mkdir(model_path)

# 进行批次处理
train_data_generator = Input_generator(train_path, class_num, shuffle=True)
train_batch = int(np.floor(train_data_generator.data_size / batch_size))  # np.floor 返回不大于输入参数的最大整数

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
        correct_predict = tf.equal(tf.argmax(net_out, 1), tf.argmax(one_hot_label, 1))  # 记录每一行最大的元素的索引 判断是否正确
        accuracy = tf.reduce_mean(tf.cast(correct_predict, tf.float32))
    tf.summary.scalar('accuracy', accuracy)
    return accuracy


# config=tf.ConfigProto()
# config.gpu_options.allow_growth=True  #动态申请显存


with tf.Session()as sess:
    X = tf.placeholder(dtype=tf.float32, shape=[None, 224, 224, 3])  # [batch, height, width, channels]

    Y_one_hot = tf.placeholder(dtype=tf.float32, shape=[None, class_num])
    TRAINING = tf.placeholder(dtype=tf.bool)
    model = resnet(X, class_num, TRAINING)

    softmax_output = model.logits
    print('#-----------------------')
    print(tf.argmax(softmax_output, 1))
    print(Y_one_hot)
    print('#-----------------------')

    loss = Softmax_loss(softmax_output, Y_one_hot)
    acc = Accuracy(softmax_output, Y_one_hot)

    with tf.name_scope('train'):
        update_ops = tf.get_collection(tf.GraphKeys.UPDATE_OPS)
        with tf.control_dependencies(update_ops):
            optimizer = tf.train.AdamOptimizer(learning_rate)
            train_op = optimizer.minimize(loss)

    merged_summary = tf.summary.merge_all()
    var_restore = [var for var in tf.trainable_variables()]
    print(var_restore)
    model_saver = tf.train.Saver(var_list=tf.global_variables(), max_to_keep=1)  # 每次保留上一次训练的模型
    # restorer = tf.train.Saver(var_restore)
    restorer = tf.train.Saver()
    sess.run(tf.global_variables_initializer())
    # restorer.restore(sess, '/media/zsl/D/yjy/FER/basenet/58.62/epoch24')
    restorer.restore(sess, '/media/zsl/D/xjw/MNI/resnet18/pretrain_model/epoch24')
    # restorer.restore(sess, '/media/zsl/D/yjy/FER/basenet/models_2/epoch27')
    print(learning_rate)
    print("Starting training")
    min_acc = 0
    max_acc = 0
    mval = []
    train_loss_results = []
    train_acc1 = []
    val_loss_results = []
    val_acc1 = []
    for epoch in range(1, epochs + 1):
        # if (epoch == 10 or epoch == 18 or epoch == 25 or epoch == 32):
        #     learning_rate = learning_rate / 10
        #     print(learning_rate)
        # if(epoch %5  == 0):
        #     learning_rate = learning_rate /2
        #     print(learning_rate)

        print("{}      Epoch number : {}".format(time.strftime("%Y-%m-%d %H:%M:%S"), epoch))

        mean_train_loss = 0
        mean_train_acc = 0
        for step in range(1, train_batch + 1):
            train_x, train_y_one_hot, train_y = train_data_generator.next_batch(batch_size, aug_data=True)
            _, train_loss, train_acc, summary_train = sess.run([train_op, loss, acc, merged_summary],
                                                               feed_dict={X: train_x, Y_one_hot: train_y_one_hot,
                                                                          TRAINING: True})

            mean_train_loss += train_loss
            mean_train_acc += train_acc

        mean_train_loss /= train_batch
        mean_train_acc /= train_batch
        train_loss_results.append(mean_train_loss)
        train_acc1.append(mean_train_acc)
        print("Train_loss: {:.4f}       Train_acc :{:.4f}".format(mean_train_loss, mean_train_acc))
        mean_val_acc = 0
        mean_val_loss = 0
        for i in range(1, val_batch + 1):
            val_x, val_y_one_hot, val_y = val_data_generator.next_batch(1, aug_data=False)
            # val_x,val_y_one_hot = minst.train.next_batch(batch_size)
            val_loss, val_acc, summary_test = sess.run([loss, acc, merged_summary],
                                                       feed_dict={X: val_x, Y_one_hot: val_y_one_hot, TRAINING: False})

            mean_val_acc += val_acc
            mean_val_loss += val_loss
        mean_val_acc /= val_batch
        mean_val_loss /= val_batch
        val_loss_results.append(mean_val_loss)
        val_acc1.append(mean_val_acc)
        print("val_loss:{:.4f}           val_acc :{:.4f}".format(mean_val_loss, mean_val_acc))
        if mean_val_acc >= max_acc:
            checkpoint_name = os.path.join(model_path, 'epoch' + str(epoch))
            model_saver.save(sess, checkpoint_name)
            max_acc = mean_val_acc
            follow_train_acc = mean_train_acc
            follow_epoch = epoch

        print(max_acc)
        train_data_generator.reset_pointer()
        val_data_generator.reset_pointer()

sess.close()
print("--------------------------")
plt.title('Train_Loss Function Curve')  # 图片标题
plt.xlabel('Epoch')  # x轴变量名称
plt.ylabel('Loss')  # y轴变量名称
plt.plot(train_loss_results, label="$Loss$")  # 逐点画出trian_loss_results值并连线，连线图标是Loss
plt.legend()  # 画出曲线图标
plt.show()  # 画出图像

plt.title('Val_Loss Function Curve')  # 图片标题
plt.xlabel('Epoch')  # x轴变量名称
plt.ylabel('Loss')  # y轴变量名称
plt.plot(val_loss_results, label="$Loss$")  # 逐点画出trian_loss_results值并连线，连线图标是Loss
plt.legend()  # 画出曲线图标
plt.show()  # 画出图像
# 绘制 Accuracy 曲线
plt.title('Train_Acc Curve')  # 图片标题
plt.xlabel('Epoch')  # x轴变量名称
plt.ylabel('Acc')  # y轴变量名称
plt.plot(train_acc1, label="$Accuracy$")  # 逐点画出test_acc值并连线，连线图标是Accuracy
plt.legend()
plt.show()

plt.title('Val_Acc Curve')  # 图片标题
plt.xlabel('Epoch')  # x轴变量名称
plt.ylabel('Acc')  # y轴变量名称
plt.plot(val_acc1, label="$Accuracy$")  # 逐点画出test_acc值并连线，连线图标是Accuracy
plt.legend()
plt.show()
# print('Training Done')
