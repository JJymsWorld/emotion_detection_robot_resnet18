import glob
import os

val_path1 = '/media/F/xjw/data_set/test/diff_image'
# val_path2 = '/media/F/xjw/data_set/test/original/generate_image_111'
img_list1 = glob.glob(val_path1 + '/*.png')
img_list1.sort()

# for q in img_list1:
#     m = q.split('_')[-1]
#     # f = q.split('_', 1)
#     # c = m.split('.')[-1]
#     e = m.rsplit('.', 1)[0]
#     e = int(e)
#     d = q.rsplit('_', 1)
#     x = os.path.join(d[0] + '_' + '%03d.png' % (e))
#     os.rename(q, x)
a = 1
for q in img_list1:
    x = os.path.join(q.rsplit('_', 1)[0] + '_' + '%03d.png' % (a))
    a += 1
    os.rename(q, x)
