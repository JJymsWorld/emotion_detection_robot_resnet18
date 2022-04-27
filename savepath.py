import os

# 图片文件夹路径
# pic_paths = "/media/zsl/D/xjw/MNI/resnet18/SFEW-val"
pic_paths = "/media/zsl/D/xjw/MNI/resnet18/RAF-DB/val_part"
# f = open('/media/zsl/D/xjw/MNI/resnet18/RAF-DB/test_ori.txt', 'w')
filenames = os.listdir(pic_paths)
filenames.sort()
# index = 0
cla_name = ["Neutral", "Happy", "Sad", "Surprise", "Fear", "Disgust", "Anger"]
for filename in filenames:
    # 图片绝对路径
    f = open('/media/zsl/D/xjw/MNI/resnet18/RAF-DB/' + filename + '.txt', 'w')
    index1 = cla_name.index(filename)
    out_path = "/media/zsl/D/xjw/MNI/resnet18/RAF-DB/val_part/" + filename
    out_path1 = os.listdir(out_path)
    out_path1.sort()
    for i in out_path1:
        out = out_path + "/" + i + ' ' + str(index1)
        # out = out_path + "/" + i + ' ' + str(index)
        print(out)
        f.write(out + '\n')
        # f.close()
    # index += 1
    # print(out_path)
    # f.write(out_path + '\n')
f.close()
