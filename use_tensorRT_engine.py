import tensorrt as trt
import pycuda.driver as cuda
import numpy as np
import pycuda.autoinit
# from build_tensorRT_engine import load_engine
import time
import cv2 as cv
# import tensorflow as tf
import os
import common


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
    # images = np.ndarray([1, 3, input_size[0], input_size[1]])
    img = cv.imread(path)
    img = cv.cvtColor(img, cv.COLOR_BGR2RGB)
    img = cv.resize(img, (236, 236))
    if img is None:
        raise RuntimeError('can not read image file:{}'.format(path))
    else:
        img = center_crop(img, (224, 224))
    img = img.astype(np.float32)
    mean, stev = cv.meanStdDev(img)
    img[:, :, 0] = (img[:, :, 0] - mean[0][0]) / stev[0][0]
    img[:, :, 1] = (img[:, :, 1] - mean[1][0]) / stev[1][0]
    img[:, :, 2] = (img[:, :, 2] - mean[2][0]) / stev[2][0]
    # img[0, :, :] = (img[0, :, :] - mean[0][0]) / stev[0][0]
    # img[1, :, :] = (img[1, :, :] - mean[1][0]) / stev[1][0]
    # img[2, :, :] = (img[2, :, :] - mean[2][0]) / stev[2][0]
    print(img.shape)
    
    images[0] = img
    return images

def adj_image2(iimg):
    input_size = (224, 224)
    images = np.ndarray([1, input_size[0], input_size[1], 3])
    img = iimg
    img = cv.cvtColor(img, cv.COLOR_BGR2RGB)
    img = cv.resize(img, (236, 236))
    if img is None:
        raise RuntimeError('can not read image file')
    else:
        img = center_crop(img, (224, 224))
    img = img.astype(np.float32)
    mean, stev = cv.meanStdDev(img)
    img[:, :, 0] = (img[:, :, 0] - mean[0][0]) / stev[0][0]
    img[:, :, 1] = (img[:, :, 1] - mean[1][0]) / stev[1][0]
    img[:, :, 2] = (img[:, :, 2] - mean[2][0]) / stev[2][0]
    images[0] = img
    return images

def load_images_to_buffer(pics, pagelocked_buffer):
   preprocessed = np.asarray(pics).astype(trt.nptype(trt.float32)).ravel()
   np.copyto(pagelocked_buffer, preprocessed)
   return pics

def main():
    engine_file_path = 'model_wa2_fp16.trt'
    TRT_LOGGER = trt.Logger()
    # image_path = "test_image/test.jpg" 
    with open(engine_file_path, "rb") as f, trt.Runtime(TRT_LOGGER) as runtime, runtime.deserialize_cuda_engine(f.read()) as engine, engine.create_execution_context() as context:
        cap = cv.VideoCapture(0)
        while True:
            inputs, outputs, bindings, stream = common.allocate_buffers(engine)
            flag, frame = cap.read()
            frame = cv.flip(frame, 1)
            frame = cv.resize(frame, (800, 600))
            image = adj_image2(frame)
            cv.imshow("video", frame)
            image_nchw = np.transpose(image, [0, 3, 1, 2])
            # print(image_nchw.shape)
            # image_buf = np.empty([1, 3, 224, 224], dtype=np.float32)
            # load_images_to_buffer(image_nchw, image_buf)
            # test_case = load_images_to_buffer(image_nchw, inputs[0].host)
            t_bool = np.array(0)
            np.copyto(t_bool, t_bool)
            # inputs[0].host = image_buf.astype(np.float32)
            load_images_to_buffer(image_nchw, inputs[0].host)
            inputs[1].host = t_bool.astype(np.bool)
            # print("开始推理")
            start = time.time()
            trt_outputs = common.do_inference_v2(context, bindings, inputs, outputs, stream)
            finish = time.time()
            # print('inference time {} sec'.format(finish - start))
            # print(trt_outputs)
            pre_label = np.argmax(trt_outputs, 1)
            label_name = {
                0: 'Neutral',
                1: 'Happy',
                2: 'Sad',
                3: 'Surprise',
                4: 'Fear',
                5: 'Disgust',
                6: 'Anger'
            }
            # print(pre_label)
            pre_result = label_name[pre_label[0]]
            # print("Pre_result: ", pre_result)
            yield pre_result
            if ord('q') == cv.waitKey(1) & 0xFF:
                break
        cap.release()
        cv.destroyAllWindows()

# engine_file_path = 'model_wa2_fp16.trt'
# TRT_LOGGER = trt.Logger()
# image_path = "test_image/test.jpg" 
# with open(engine_file_path, "rb") as f, trt.Runtime(TRT_LOGGER) as runtime, runtime.deserialize_cuda_engine(f.read()) as engine, engine.create_execution_context() as context:
#     inputs, outputs, bindings, stream = common.allocate_buffers(engine)
#     image = adj_image(image_path)
#     image_nchw = np.transpose(image, [0, 3, 1, 2])
#     print(image_nchw.shape)
#     # image_buf = np.empty([1, 3, 224, 224], dtype=np.float32)
#     # load_images_to_buffer(image_nchw, image_buf)
#     # test_case = load_images_to_buffer(image_nchw, inputs[0].host)
#     t_bool = np.array(0)
#     np.copyto(t_bool, t_bool)
#     # inputs[0].host = image_buf.astype(np.float32)
#     load_images_to_buffer(image_nchw, inputs[0].host)
#     inputs[1].host = t_bool.astype(np.bool)
#     print("开始推理")
#     start = time.time()
#     trt_outputs = common.do_inference_v2(context, bindings, inputs, outputs, stream)
#     finish = time.time()
#     print('inference time {} sec'.format(finish - start))
#     print(trt_outputs)
#     pre_label = np.argmax(trt_outputs, 1)
#     label_name = {
#         0: 'Neutral',
#         1: 'Happy',
#         2: 'Sad',
#         3: 'Surprise',
#         4: 'Fear',
#         5: 'Disgust',
#         6: 'Anger'
#     }
#     # print(pre_label)
#     pre_result = label_name[pre_label[0]]
#     print("Pre_result: ", pre_result)
        


if __name__ == "__main__":
    main()


