import numpy as np
import os
import pycuda.driver as cuda
import pycuda.autoinit
import tensorrt as trt
import cv2
import tensorflow as tf

TRT_LOGGET = trt.Logger()

engine_file = "Resnet18_emotion.trt"


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

def load_engine(engine_file_path):
    assert os.path.exists(engine_file_path)
    print("Reading engine from file {}".format(engine_file_path))
    with open(engine_file_path, 'rb') as f, trt.Runtime(TRT_LOGGET) as runtime:
        return runtime.deserialize_cuda_engine(f.read())

def infer(engine, image_path):
    image = adj_image(image_path)
    image = tf.transpose(image, [0, 3, 1, 2])
    sess = tf.Session()
    image_nchw = sess.run(image)
    sess.close()
    with engine.create_execution_context() as context:
        # context.set_binding_shape(engine.get_binding_index("Placeholder:0"), (1, 224, 244, 3))
        bindings = []
        for binding in engine:
            print(binding)
            binding_idx = engine.get_binding_index(binding)
            size = trt.volume(context.get_binding_shape(binding_idx))
            dtype = trt.nptype(engine.get_binding_dtype(binding))
            if engine.binding_is_input(binding):
                input_buffer = np.ascontiguousarray(image_nchw)
                input_memory = cuda.mem_alloc(image_nchw.nbytes)
                bindings.append(int(input_memory))
            else:
                output_buffer = cuda.pagelocked_empty(size, dtype)
                output_memory = cuda.mem_alloc(output_buffer.nbytes)
                bindings.append(int(output_memory))
        
        stream = cuda.Stream()
        # Transfer input data to the GPU.
        cuda.memcpy_htod_async(input_memory, input_buffer, stream)
        # Run inference
        context.execute_async_v2(bindings=bindings, stream_handle=stream.handle)
        # Transfer prediction output from the GPU.
        cuda.memcpy_dtoh_async(output_buffer, output_memory, stream)
        # Synchronize the stream
        stream.synchronize()
        print(output_buffer)

engine = load_engine("resnet18_emotion.plan")
image_path = "test_image/test.jpg"
infer(engine, image_path)