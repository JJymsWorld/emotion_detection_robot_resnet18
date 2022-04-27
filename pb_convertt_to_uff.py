import tensorflow as tf
import uff
import tensorrt as trt
import pycuda.driver as cuda
import pycuda.autoinit
from tensorrt.tensorrt import UffParser

MODEL_DIR = 'frozen_model.pb'
CHANNEL = 3
HEIGHT = 224
WIDTH = 224
ENGINE_PATH = './tensorRT_enging_model/model_.pb.plan'
INPUT_NODE1 = 'prefix/Placeholder:0'
INPUT_NODE2 = 'prefix/Placeholder_2:0'
OUTPUT_NODE = ['prefix/dense/BiasAdd:0']
INPUT_SIZE = []