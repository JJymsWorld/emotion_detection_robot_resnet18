node {
  name: "Placeholder"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: -1
        }
        dim {
          size: 224
        }
        dim {
          size: 224
        }
        dim {
          size: 3
        }
      }
    }
  }
}
node {
  name: "Placeholder_1"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: -1
        }
        dim {
          size: 7
        }
      }
    }
  }
}
node {
  name: "Placeholder_2"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_BOOL
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        unknown_rank: true
      }
    }
  }
}
node {
  name: "conv1/kernel/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\007\000\000\000\007\000\000\000\003\000\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "conv1/kernel/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.04275039955973625
      }
    }
  }
}
node {
  name: "conv1/kernel/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.04275039955973625
      }
    }
  }
}
node {
  name: "conv1/kernel/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "conv1/kernel/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "conv1/kernel/Initializer/random_uniform/sub"
  op: "Sub"
  input: "conv1/kernel/Initializer/random_uniform/max"
  input: "conv1/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/kernel"
      }
    }
  }
}
node {
  name: "conv1/kernel/Initializer/random_uniform/mul"
  op: "Mul"
  input: "conv1/kernel/Initializer/random_uniform/RandomUniform"
  input: "conv1/kernel/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/kernel"
      }
    }
  }
}
node {
  name: "conv1/kernel/Initializer/random_uniform"
  op: "Add"
  input: "conv1/kernel/Initializer/random_uniform/mul"
  input: "conv1/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/kernel"
      }
    }
  }
}
node {
  name: "conv1/kernel"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 7
        }
        dim {
          size: 7
        }
        dim {
          size: 3
        }
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv1/kernel/Assign"
  op: "Assign"
  input: "conv1/kernel"
  input: "conv1/kernel/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv1/kernel/read"
  op: "Identity"
  input: "conv1/kernel"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/kernel"
      }
    }
  }
}
node {
  name: "conv1/bias/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv1/bias"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv1/bias/Assign"
  op: "Assign"
  input: "conv1/bias"
  input: "conv1/bias/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv1/bias/read"
  op: "Identity"
  input: "conv1/bias"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/bias"
      }
    }
  }
}
node {
  name: "conv1/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "conv1/Conv2D"
  op: "Conv2D"
  input: "Placeholder"
  input: "conv1/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "conv1/BiasAdd"
  op: "BiasAdd"
  input: "conv1/Conv2D"
  input: "conv1/bias/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "bn_conv1/gamma/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_conv1/gamma"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "bn_conv1/gamma"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_conv1/gamma"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn_conv1/gamma/Assign"
  op: "Assign"
  input: "bn_conv1/gamma"
  input: "bn_conv1/gamma/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_conv1/gamma"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn_conv1/gamma/read"
  op: "Identity"
  input: "bn_conv1/gamma"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_conv1/gamma"
      }
    }
  }
}
node {
  name: "bn_conv1/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_conv1/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "bn_conv1/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_conv1/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn_conv1/beta/Assign"
  op: "Assign"
  input: "bn_conv1/beta"
  input: "bn_conv1/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_conv1/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn_conv1/beta/read"
  op: "Identity"
  input: "bn_conv1/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_conv1/beta"
      }
    }
  }
}
node {
  name: "bn_conv1/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_conv1/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "bn_conv1/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_conv1/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn_conv1/moving_mean/Assign"
  op: "Assign"
  input: "bn_conv1/moving_mean"
  input: "bn_conv1/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_conv1/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn_conv1/moving_mean/read"
  op: "Identity"
  input: "bn_conv1/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_conv1/moving_mean"
      }
    }
  }
}
node {
  name: "bn_conv1/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_conv1/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "bn_conv1/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_conv1/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn_conv1/moving_variance/Assign"
  op: "Assign"
  input: "bn_conv1/moving_variance"
  input: "bn_conv1/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_conv1/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn_conv1/moving_variance/read"
  op: "Identity"
  input: "bn_conv1/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_conv1/moving_variance"
      }
    }
  }
}
node {
  name: "bn_conv1/cond/Switch"
  op: "Switch"
  input: "Placeholder_2"
  input: "Placeholder_2"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "bn_conv1/cond/switch_t"
  op: "Identity"
  input: "bn_conv1/cond/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "bn_conv1/cond/switch_f"
  op: "Identity"
  input: "bn_conv1/cond/Switch"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "bn_conv1/cond/pred_id"
  op: "Identity"
  input: "Placeholder_2"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "bn_conv1/cond/Const"
  op: "Const"
  input: "^bn_conv1/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "bn_conv1/cond/Const_1"
  op: "Const"
  input: "^bn_conv1/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "bn_conv1/cond/FusedBatchNormV3"
  op: "FusedBatchNormV3"
  input: "bn_conv1/cond/FusedBatchNormV3/Switch:1"
  input: "bn_conv1/cond/FusedBatchNormV3/Switch_1:1"
  input: "bn_conv1/cond/FusedBatchNormV3/Switch_2:1"
  input: "bn_conv1/cond/Const"
  input: "bn_conv1/cond/Const_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "U"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.0010000000474974513
    }
  }
  attr {
    key: "is_training"
    value {
      b: true
    }
  }
}
node {
  name: "bn_conv1/cond/FusedBatchNormV3/Switch"
  op: "Switch"
  input: "conv1/BiasAdd"
  input: "bn_conv1/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/BiasAdd"
      }
    }
  }
}
node {
  name: "bn_conv1/cond/FusedBatchNormV3/Switch_1"
  op: "Switch"
  input: "bn_conv1/gamma/read"
  input: "bn_conv1/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_conv1/gamma"
      }
    }
  }
}
node {
  name: "bn_conv1/cond/FusedBatchNormV3/Switch_2"
  op: "Switch"
  input: "bn_conv1/beta/read"
  input: "bn_conv1/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_conv1/beta"
      }
    }
  }
}
node {
  name: "bn_conv1/cond/FusedBatchNormV3_1"
  op: "FusedBatchNormV3"
  input: "bn_conv1/cond/FusedBatchNormV3_1/Switch"
  input: "bn_conv1/cond/FusedBatchNormV3_1/Switch_1"
  input: "bn_conv1/cond/FusedBatchNormV3_1/Switch_2"
  input: "bn_conv1/cond/FusedBatchNormV3_1/Switch_3"
  input: "bn_conv1/cond/FusedBatchNormV3_1/Switch_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "U"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.0010000000474974513
    }
  }
  attr {
    key: "is_training"
    value {
      b: false
    }
  }
}
node {
  name: "bn_conv1/cond/FusedBatchNormV3_1/Switch"
  op: "Switch"
  input: "conv1/BiasAdd"
  input: "bn_conv1/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/BiasAdd"
      }
    }
  }
}
node {
  name: "bn_conv1/cond/FusedBatchNormV3_1/Switch_1"
  op: "Switch"
  input: "bn_conv1/gamma/read"
  input: "bn_conv1/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_conv1/gamma"
      }
    }
  }
}
node {
  name: "bn_conv1/cond/FusedBatchNormV3_1/Switch_2"
  op: "Switch"
  input: "bn_conv1/beta/read"
  input: "bn_conv1/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_conv1/beta"
      }
    }
  }
}
node {
  name: "bn_conv1/cond/FusedBatchNormV3_1/Switch_3"
  op: "Switch"
  input: "bn_conv1/moving_mean/read"
  input: "bn_conv1/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_conv1/moving_mean"
      }
    }
  }
}
node {
  name: "bn_conv1/cond/FusedBatchNormV3_1/Switch_4"
  op: "Switch"
  input: "bn_conv1/moving_variance/read"
  input: "bn_conv1/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_conv1/moving_variance"
      }
    }
  }
}
node {
  name: "bn_conv1/cond/Merge"
  op: "Merge"
  input: "bn_conv1/cond/FusedBatchNormV3_1"
  input: "bn_conv1/cond/FusedBatchNormV3"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn_conv1/cond/Merge_1"
  op: "Merge"
  input: "bn_conv1/cond/FusedBatchNormV3_1:1"
  input: "bn_conv1/cond/FusedBatchNormV3:1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn_conv1/cond/Merge_2"
  op: "Merge"
  input: "bn_conv1/cond/FusedBatchNormV3_1:2"
  input: "bn_conv1/cond/FusedBatchNormV3:2"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn_conv1/cond_1/Switch"
  op: "Switch"
  input: "Placeholder_2"
  input: "Placeholder_2"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "bn_conv1/cond_1/switch_t"
  op: "Identity"
  input: "bn_conv1/cond_1/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "bn_conv1/cond_1/switch_f"
  op: "Identity"
  input: "bn_conv1/cond_1/Switch"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "bn_conv1/cond_1/pred_id"
  op: "Identity"
  input: "Placeholder_2"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "bn_conv1/cond_1/Const"
  op: "Const"
  input: "^bn_conv1/cond_1/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.9900000095367432
      }
    }
  }
}
node {
  name: "bn_conv1/cond_1/Const_1"
  op: "Const"
  input: "^bn_conv1/cond_1/switch_f"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "bn_conv1/cond_1/Merge"
  op: "Merge"
  input: "bn_conv1/cond_1/Const_1"
  input: "bn_conv1/cond_1/Const"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn_conv1/AssignMovingAvg/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_conv1/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "bn_conv1/AssignMovingAvg/sub"
  op: "Sub"
  input: "bn_conv1/AssignMovingAvg/sub/x"
  input: "bn_conv1/cond_1/Merge"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_conv1/moving_mean"
      }
    }
  }
}
node {
  name: "bn_conv1/AssignMovingAvg/sub_1"
  op: "Sub"
  input: "bn_conv1/moving_mean/read"
  input: "bn_conv1/cond/Merge_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_conv1/moving_mean"
      }
    }
  }
}
node {
  name: "bn_conv1/AssignMovingAvg/mul"
  op: "Mul"
  input: "bn_conv1/AssignMovingAvg/sub_1"
  input: "bn_conv1/AssignMovingAvg/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_conv1/moving_mean"
      }
    }
  }
}
node {
  name: "bn_conv1/AssignMovingAvg"
  op: "AssignSub"
  input: "bn_conv1/moving_mean"
  input: "bn_conv1/AssignMovingAvg/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_conv1/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "bn_conv1/AssignMovingAvg_1/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_conv1/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "bn_conv1/AssignMovingAvg_1/sub"
  op: "Sub"
  input: "bn_conv1/AssignMovingAvg_1/sub/x"
  input: "bn_conv1/cond_1/Merge"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_conv1/moving_variance"
      }
    }
  }
}
node {
  name: "bn_conv1/AssignMovingAvg_1/sub_1"
  op: "Sub"
  input: "bn_conv1/moving_variance/read"
  input: "bn_conv1/cond/Merge_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_conv1/moving_variance"
      }
    }
  }
}
node {
  name: "bn_conv1/AssignMovingAvg_1/mul"
  op: "Mul"
  input: "bn_conv1/AssignMovingAvg_1/sub_1"
  input: "bn_conv1/AssignMovingAvg_1/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_conv1/moving_variance"
      }
    }
  }
}
node {
  name: "bn_conv1/AssignMovingAvg_1"
  op: "AssignSub"
  input: "bn_conv1/moving_variance"
  input: "bn_conv1/AssignMovingAvg_1/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_conv1/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "Relu"
  op: "Relu"
  input: "bn_conv1/cond/Merge"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "max_pooling2d/MaxPool"
  op: "MaxPool"
  input: "Relu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "ksize"
    value {
      list {
        i: 1
        i: 3
        i: 3
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
}
node {
  name: "res2a_branch2b/kernel/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res2a_branch2b/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000@\000\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "res2a_branch2b/kernel/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res2a_branch2b/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.07216878235340118
      }
    }
  }
}
node {
  name: "res2a_branch2b/kernel/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res2a_branch2b/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.07216878235340118
      }
    }
  }
}
node {
  name: "res2a_branch2b/kernel/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "res2a_branch2b/kernel/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res2a_branch2b/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "res2a_branch2b/kernel/Initializer/random_uniform/sub"
  op: "Sub"
  input: "res2a_branch2b/kernel/Initializer/random_uniform/max"
  input: "res2a_branch2b/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res2a_branch2b/kernel"
      }
    }
  }
}
node {
  name: "res2a_branch2b/kernel/Initializer/random_uniform/mul"
  op: "Mul"
  input: "res2a_branch2b/kernel/Initializer/random_uniform/RandomUniform"
  input: "res2a_branch2b/kernel/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res2a_branch2b/kernel"
      }
    }
  }
}
node {
  name: "res2a_branch2b/kernel/Initializer/random_uniform"
  op: "Add"
  input: "res2a_branch2b/kernel/Initializer/random_uniform/mul"
  input: "res2a_branch2b/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res2a_branch2b/kernel"
      }
    }
  }
}
node {
  name: "res2a_branch2b/kernel"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res2a_branch2b/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 64
        }
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "res2a_branch2b/kernel/Assign"
  op: "Assign"
  input: "res2a_branch2b/kernel"
  input: "res2a_branch2b/kernel/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res2a_branch2b/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "res2a_branch2b/kernel/read"
  op: "Identity"
  input: "res2a_branch2b/kernel"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res2a_branch2b/kernel"
      }
    }
  }
}
node {
  name: "id_block_stage2/res2a_branch2b/kernel/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0005000000237487257
      }
    }
  }
}
node {
  name: "id_block_stage2/res2a_branch2b/kernel/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "res2a_branch2b/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "id_block_stage2/res2a_branch2b/kernel/Regularizer/l2_regularizer"
  op: "Mul"
  input: "id_block_stage2/res2a_branch2b/kernel/Regularizer/l2_regularizer/scale"
  input: "id_block_stage2/res2a_branch2b/kernel/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "res2a_branch2b/bias/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res2a_branch2b/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "res2a_branch2b/bias"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res2a_branch2b/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "res2a_branch2b/bias/Assign"
  op: "Assign"
  input: "res2a_branch2b/bias"
  input: "res2a_branch2b/bias/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res2a_branch2b/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "res2a_branch2b/bias/read"
  op: "Identity"
  input: "res2a_branch2b/bias"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res2a_branch2b/bias"
      }
    }
  }
}
node {
  name: "id_block_stage2/res2a_branch2b/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "id_block_stage2/res2a_branch2b/Conv2D"
  op: "Conv2D"
  input: "max_pooling2d/MaxPool"
  input: "res2a_branch2b/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "id_block_stage2/res2a_branch2b/BiasAdd"
  op: "BiasAdd"
  input: "id_block_stage2/res2a_branch2b/Conv2D"
  input: "res2a_branch2b/bias/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "bn2a_branch2b/gamma/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2a_branch2b/gamma"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "bn2a_branch2b/gamma"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2a_branch2b/gamma"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn2a_branch2b/gamma/Assign"
  op: "Assign"
  input: "bn2a_branch2b/gamma"
  input: "bn2a_branch2b/gamma/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2a_branch2b/gamma"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn2a_branch2b/gamma/read"
  op: "Identity"
  input: "bn2a_branch2b/gamma"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2a_branch2b/gamma"
      }
    }
  }
}
node {
  name: "bn2a_branch2b/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2a_branch2b/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "bn2a_branch2b/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2a_branch2b/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn2a_branch2b/beta/Assign"
  op: "Assign"
  input: "bn2a_branch2b/beta"
  input: "bn2a_branch2b/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2a_branch2b/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn2a_branch2b/beta/read"
  op: "Identity"
  input: "bn2a_branch2b/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2a_branch2b/beta"
      }
    }
  }
}
node {
  name: "bn2a_branch2b/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2a_branch2b/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "bn2a_branch2b/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2a_branch2b/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn2a_branch2b/moving_mean/Assign"
  op: "Assign"
  input: "bn2a_branch2b/moving_mean"
  input: "bn2a_branch2b/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2a_branch2b/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn2a_branch2b/moving_mean/read"
  op: "Identity"
  input: "bn2a_branch2b/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2a_branch2b/moving_mean"
      }
    }
  }
}
node {
  name: "bn2a_branch2b/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2a_branch2b/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "bn2a_branch2b/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2a_branch2b/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn2a_branch2b/moving_variance/Assign"
  op: "Assign"
  input: "bn2a_branch2b/moving_variance"
  input: "bn2a_branch2b/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2a_branch2b/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn2a_branch2b/moving_variance/read"
  op: "Identity"
  input: "bn2a_branch2b/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2a_branch2b/moving_variance"
      }
    }
  }
}
node {
  name: "id_block_stage2/bn2a_branch2b/cond/Switch"
  op: "Switch"
  input: "Placeholder_2"
  input: "Placeholder_2"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "id_block_stage2/bn2a_branch2b/cond/switch_t"
  op: "Identity"
  input: "id_block_stage2/bn2a_branch2b/cond/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "id_block_stage2/bn2a_branch2b/cond/switch_f"
  op: "Identity"
  input: "id_block_stage2/bn2a_branch2b/cond/Switch"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "id_block_stage2/bn2a_branch2b/cond/pred_id"
  op: "Identity"
  input: "Placeholder_2"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "id_block_stage2/bn2a_branch2b/cond/Const"
  op: "Const"
  input: "^id_block_stage2/bn2a_branch2b/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "id_block_stage2/bn2a_branch2b/cond/Const_1"
  op: "Const"
  input: "^id_block_stage2/bn2a_branch2b/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "id_block_stage2/bn2a_branch2b/cond/FusedBatchNormV3"
  op: "FusedBatchNormV3"
  input: "id_block_stage2/bn2a_branch2b/cond/FusedBatchNormV3/Switch:1"
  input: "id_block_stage2/bn2a_branch2b/cond/FusedBatchNormV3/Switch_1:1"
  input: "id_block_stage2/bn2a_branch2b/cond/FusedBatchNormV3/Switch_2:1"
  input: "id_block_stage2/bn2a_branch2b/cond/Const"
  input: "id_block_stage2/bn2a_branch2b/cond/Const_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "U"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.0010000000474974513
    }
  }
  attr {
    key: "is_training"
    value {
      b: true
    }
  }
}
node {
  name: "id_block_stage2/bn2a_branch2b/cond/FusedBatchNormV3/Switch"
  op: "Switch"
  input: "id_block_stage2/res2a_branch2b/BiasAdd"
  input: "id_block_stage2/bn2a_branch2b/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@id_block_stage2/res2a_branch2b/BiasAdd"
      }
    }
  }
}
node {
  name: "id_block_stage2/bn2a_branch2b/cond/FusedBatchNormV3/Switch_1"
  op: "Switch"
  input: "bn2a_branch2b/gamma/read"
  input: "id_block_stage2/bn2a_branch2b/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2a_branch2b/gamma"
      }
    }
  }
}
node {
  name: "id_block_stage2/bn2a_branch2b/cond/FusedBatchNormV3/Switch_2"
  op: "Switch"
  input: "bn2a_branch2b/beta/read"
  input: "id_block_stage2/bn2a_branch2b/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2a_branch2b/beta"
      }
    }
  }
}
node {
  name: "id_block_stage2/bn2a_branch2b/cond/FusedBatchNormV3_1"
  op: "FusedBatchNormV3"
  input: "id_block_stage2/bn2a_branch2b/cond/FusedBatchNormV3_1/Switch"
  input: "id_block_stage2/bn2a_branch2b/cond/FusedBatchNormV3_1/Switch_1"
  input: "id_block_stage2/bn2a_branch2b/cond/FusedBatchNormV3_1/Switch_2"
  input: "id_block_stage2/bn2a_branch2b/cond/FusedBatchNormV3_1/Switch_3"
  input: "id_block_stage2/bn2a_branch2b/cond/FusedBatchNormV3_1/Switch_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "U"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.0010000000474974513
    }
  }
  attr {
    key: "is_training"
    value {
      b: false
    }
  }
}
node {
  name: "id_block_stage2/bn2a_branch2b/cond/FusedBatchNormV3_1/Switch"
  op: "Switch"
  input: "id_block_stage2/res2a_branch2b/BiasAdd"
  input: "id_block_stage2/bn2a_branch2b/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@id_block_stage2/res2a_branch2b/BiasAdd"
      }
    }
  }
}
node {
  name: "id_block_stage2/bn2a_branch2b/cond/FusedBatchNormV3_1/Switch_1"
  op: "Switch"
  input: "bn2a_branch2b/gamma/read"
  input: "id_block_stage2/bn2a_branch2b/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2a_branch2b/gamma"
      }
    }
  }
}
node {
  name: "id_block_stage2/bn2a_branch2b/cond/FusedBatchNormV3_1/Switch_2"
  op: "Switch"
  input: "bn2a_branch2b/beta/read"
  input: "id_block_stage2/bn2a_branch2b/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2a_branch2b/beta"
      }
    }
  }
}
node {
  name: "id_block_stage2/bn2a_branch2b/cond/FusedBatchNormV3_1/Switch_3"
  op: "Switch"
  input: "bn2a_branch2b/moving_mean/read"
  input: "id_block_stage2/bn2a_branch2b/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2a_branch2b/moving_mean"
      }
    }
  }
}
node {
  name: "id_block_stage2/bn2a_branch2b/cond/FusedBatchNormV3_1/Switch_4"
  op: "Switch"
  input: "bn2a_branch2b/moving_variance/read"
  input: "id_block_stage2/bn2a_branch2b/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2a_branch2b/moving_variance"
      }
    }
  }
}
node {
  name: "id_block_stage2/bn2a_branch2b/cond/Merge"
  op: "Merge"
  input: "id_block_stage2/bn2a_branch2b/cond/FusedBatchNormV3_1"
  input: "id_block_stage2/bn2a_branch2b/cond/FusedBatchNormV3"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "id_block_stage2/bn2a_branch2b/cond/Merge_1"
  op: "Merge"
  input: "id_block_stage2/bn2a_branch2b/cond/FusedBatchNormV3_1:1"
  input: "id_block_stage2/bn2a_branch2b/cond/FusedBatchNormV3:1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "id_block_stage2/bn2a_branch2b/cond/Merge_2"
  op: "Merge"
  input: "id_block_stage2/bn2a_branch2b/cond/FusedBatchNormV3_1:2"
  input: "id_block_stage2/bn2a_branch2b/cond/FusedBatchNormV3:2"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "id_block_stage2/bn2a_branch2b/cond_1/Switch"
  op: "Switch"
  input: "Placeholder_2"
  input: "Placeholder_2"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "id_block_stage2/bn2a_branch2b/cond_1/switch_t"
  op: "Identity"
  input: "id_block_stage2/bn2a_branch2b/cond_1/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "id_block_stage2/bn2a_branch2b/cond_1/switch_f"
  op: "Identity"
  input: "id_block_stage2/bn2a_branch2b/cond_1/Switch"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "id_block_stage2/bn2a_branch2b/cond_1/pred_id"
  op: "Identity"
  input: "Placeholder_2"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "id_block_stage2/bn2a_branch2b/cond_1/Const"
  op: "Const"
  input: "^id_block_stage2/bn2a_branch2b/cond_1/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.9900000095367432
      }
    }
  }
}
node {
  name: "id_block_stage2/bn2a_branch2b/cond_1/Const_1"
  op: "Const"
  input: "^id_block_stage2/bn2a_branch2b/cond_1/switch_f"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "id_block_stage2/bn2a_branch2b/cond_1/Merge"
  op: "Merge"
  input: "id_block_stage2/bn2a_branch2b/cond_1/Const_1"
  input: "id_block_stage2/bn2a_branch2b/cond_1/Const"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "id_block_stage2/bn2a_branch2b/AssignMovingAvg/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2a_branch2b/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "id_block_stage2/bn2a_branch2b/AssignMovingAvg/sub"
  op: "Sub"
  input: "id_block_stage2/bn2a_branch2b/AssignMovingAvg/sub/x"
  input: "id_block_stage2/bn2a_branch2b/cond_1/Merge"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2a_branch2b/moving_mean"
      }
    }
  }
}
node {
  name: "id_block_stage2/bn2a_branch2b/AssignMovingAvg/sub_1"
  op: "Sub"
  input: "bn2a_branch2b/moving_mean/read"
  input: "id_block_stage2/bn2a_branch2b/cond/Merge_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2a_branch2b/moving_mean"
      }
    }
  }
}
node {
  name: "id_block_stage2/bn2a_branch2b/AssignMovingAvg/mul"
  op: "Mul"
  input: "id_block_stage2/bn2a_branch2b/AssignMovingAvg/sub_1"
  input: "id_block_stage2/bn2a_branch2b/AssignMovingAvg/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2a_branch2b/moving_mean"
      }
    }
  }
}
node {
  name: "id_block_stage2/bn2a_branch2b/AssignMovingAvg"
  op: "AssignSub"
  input: "bn2a_branch2b/moving_mean"
  input: "id_block_stage2/bn2a_branch2b/AssignMovingAvg/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2a_branch2b/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "id_block_stage2/bn2a_branch2b/AssignMovingAvg_1/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2a_branch2b/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "id_block_stage2/bn2a_branch2b/AssignMovingAvg_1/sub"
  op: "Sub"
  input: "id_block_stage2/bn2a_branch2b/AssignMovingAvg_1/sub/x"
  input: "id_block_stage2/bn2a_branch2b/cond_1/Merge"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2a_branch2b/moving_variance"
      }
    }
  }
}
node {
  name: "id_block_stage2/bn2a_branch2b/AssignMovingAvg_1/sub_1"
  op: "Sub"
  input: "bn2a_branch2b/moving_variance/read"
  input: "id_block_stage2/bn2a_branch2b/cond/Merge_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2a_branch2b/moving_variance"
      }
    }
  }
}
node {
  name: "id_block_stage2/bn2a_branch2b/AssignMovingAvg_1/mul"
  op: "Mul"
  input: "id_block_stage2/bn2a_branch2b/AssignMovingAvg_1/sub_1"
  input: "id_block_stage2/bn2a_branch2b/AssignMovingAvg_1/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2a_branch2b/moving_variance"
      }
    }
  }
}
node {
  name: "id_block_stage2/bn2a_branch2b/AssignMovingAvg_1"
  op: "AssignSub"
  input: "bn2a_branch2b/moving_variance"
  input: "id_block_stage2/bn2a_branch2b/AssignMovingAvg_1/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2a_branch2b/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "id_block_stage2/Relu"
  op: "Relu"
  input: "id_block_stage2/bn2a_branch2b/cond/Merge"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "res2a_branch2c/kernel/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res2a_branch2c/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000@\000\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "res2a_branch2c/kernel/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res2a_branch2c/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.07216878235340118
      }
    }
  }
}
node {
  name: "res2a_branch2c/kernel/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res2a_branch2c/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.07216878235340118
      }
    }
  }
}
node {
  name: "res2a_branch2c/kernel/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "res2a_branch2c/kernel/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res2a_branch2c/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "res2a_branch2c/kernel/Initializer/random_uniform/sub"
  op: "Sub"
  input: "res2a_branch2c/kernel/Initializer/random_uniform/max"
  input: "res2a_branch2c/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res2a_branch2c/kernel"
      }
    }
  }
}
node {
  name: "res2a_branch2c/kernel/Initializer/random_uniform/mul"
  op: "Mul"
  input: "res2a_branch2c/kernel/Initializer/random_uniform/RandomUniform"
  input: "res2a_branch2c/kernel/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res2a_branch2c/kernel"
      }
    }
  }
}
node {
  name: "res2a_branch2c/kernel/Initializer/random_uniform"
  op: "Add"
  input: "res2a_branch2c/kernel/Initializer/random_uniform/mul"
  input: "res2a_branch2c/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res2a_branch2c/kernel"
      }
    }
  }
}
node {
  name: "res2a_branch2c/kernel"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res2a_branch2c/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 64
        }
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "res2a_branch2c/kernel/Assign"
  op: "Assign"
  input: "res2a_branch2c/kernel"
  input: "res2a_branch2c/kernel/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res2a_branch2c/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "res2a_branch2c/kernel/read"
  op: "Identity"
  input: "res2a_branch2c/kernel"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res2a_branch2c/kernel"
      }
    }
  }
}
node {
  name: "id_block_stage2/res2a_branch2c/kernel/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0005000000237487257
      }
    }
  }
}
node {
  name: "id_block_stage2/res2a_branch2c/kernel/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "res2a_branch2c/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "id_block_stage2/res2a_branch2c/kernel/Regularizer/l2_regularizer"
  op: "Mul"
  input: "id_block_stage2/res2a_branch2c/kernel/Regularizer/l2_regularizer/scale"
  input: "id_block_stage2/res2a_branch2c/kernel/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "res2a_branch2c/bias/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res2a_branch2c/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "res2a_branch2c/bias"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res2a_branch2c/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "res2a_branch2c/bias/Assign"
  op: "Assign"
  input: "res2a_branch2c/bias"
  input: "res2a_branch2c/bias/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res2a_branch2c/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "res2a_branch2c/bias/read"
  op: "Identity"
  input: "res2a_branch2c/bias"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res2a_branch2c/bias"
      }
    }
  }
}
node {
  name: "id_block_stage2/res2a_branch2c/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "id_block_stage2/res2a_branch2c/Conv2D"
  op: "Conv2D"
  input: "id_block_stage2/Relu"
  input: "res2a_branch2c/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "id_block_stage2/res2a_branch2c/BiasAdd"
  op: "BiasAdd"
  input: "id_block_stage2/res2a_branch2c/Conv2D"
  input: "res2a_branch2c/bias/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "bn2a_branch2c/gamma/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2a_branch2c/gamma"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "bn2a_branch2c/gamma"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2a_branch2c/gamma"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn2a_branch2c/gamma/Assign"
  op: "Assign"
  input: "bn2a_branch2c/gamma"
  input: "bn2a_branch2c/gamma/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2a_branch2c/gamma"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn2a_branch2c/gamma/read"
  op: "Identity"
  input: "bn2a_branch2c/gamma"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2a_branch2c/gamma"
      }
    }
  }
}
node {
  name: "bn2a_branch2c/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2a_branch2c/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "bn2a_branch2c/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2a_branch2c/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn2a_branch2c/beta/Assign"
  op: "Assign"
  input: "bn2a_branch2c/beta"
  input: "bn2a_branch2c/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2a_branch2c/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn2a_branch2c/beta/read"
  op: "Identity"
  input: "bn2a_branch2c/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2a_branch2c/beta"
      }
    }
  }
}
node {
  name: "bn2a_branch2c/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2a_branch2c/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "bn2a_branch2c/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2a_branch2c/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn2a_branch2c/moving_mean/Assign"
  op: "Assign"
  input: "bn2a_branch2c/moving_mean"
  input: "bn2a_branch2c/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2a_branch2c/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn2a_branch2c/moving_mean/read"
  op: "Identity"
  input: "bn2a_branch2c/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2a_branch2c/moving_mean"
      }
    }
  }
}
node {
  name: "bn2a_branch2c/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2a_branch2c/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "bn2a_branch2c/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2a_branch2c/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn2a_branch2c/moving_variance/Assign"
  op: "Assign"
  input: "bn2a_branch2c/moving_variance"
  input: "bn2a_branch2c/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2a_branch2c/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn2a_branch2c/moving_variance/read"
  op: "Identity"
  input: "bn2a_branch2c/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2a_branch2c/moving_variance"
      }
    }
  }
}
node {
  name: "id_block_stage2/bn2a_branch2c/cond/Switch"
  op: "Switch"
  input: "Placeholder_2"
  input: "Placeholder_2"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "id_block_stage2/bn2a_branch2c/cond/switch_t"
  op: "Identity"
  input: "id_block_stage2/bn2a_branch2c/cond/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "id_block_stage2/bn2a_branch2c/cond/switch_f"
  op: "Identity"
  input: "id_block_stage2/bn2a_branch2c/cond/Switch"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "id_block_stage2/bn2a_branch2c/cond/pred_id"
  op: "Identity"
  input: "Placeholder_2"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "id_block_stage2/bn2a_branch2c/cond/Const"
  op: "Const"
  input: "^id_block_stage2/bn2a_branch2c/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "id_block_stage2/bn2a_branch2c/cond/Const_1"
  op: "Const"
  input: "^id_block_stage2/bn2a_branch2c/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "id_block_stage2/bn2a_branch2c/cond/FusedBatchNormV3"
  op: "FusedBatchNormV3"
  input: "id_block_stage2/bn2a_branch2c/cond/FusedBatchNormV3/Switch:1"
  input: "id_block_stage2/bn2a_branch2c/cond/FusedBatchNormV3/Switch_1:1"
  input: "id_block_stage2/bn2a_branch2c/cond/FusedBatchNormV3/Switch_2:1"
  input: "id_block_stage2/bn2a_branch2c/cond/Const"
  input: "id_block_stage2/bn2a_branch2c/cond/Const_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "U"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.0010000000474974513
    }
  }
  attr {
    key: "is_training"
    value {
      b: true
    }
  }
}
node {
  name: "id_block_stage2/bn2a_branch2c/cond/FusedBatchNormV3/Switch"
  op: "Switch"
  input: "id_block_stage2/res2a_branch2c/BiasAdd"
  input: "id_block_stage2/bn2a_branch2c/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@id_block_stage2/res2a_branch2c/BiasAdd"
      }
    }
  }
}
node {
  name: "id_block_stage2/bn2a_branch2c/cond/FusedBatchNormV3/Switch_1"
  op: "Switch"
  input: "bn2a_branch2c/gamma/read"
  input: "id_block_stage2/bn2a_branch2c/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2a_branch2c/gamma"
      }
    }
  }
}
node {
  name: "id_block_stage2/bn2a_branch2c/cond/FusedBatchNormV3/Switch_2"
  op: "Switch"
  input: "bn2a_branch2c/beta/read"
  input: "id_block_stage2/bn2a_branch2c/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2a_branch2c/beta"
      }
    }
  }
}
node {
  name: "id_block_stage2/bn2a_branch2c/cond/FusedBatchNormV3_1"
  op: "FusedBatchNormV3"
  input: "id_block_stage2/bn2a_branch2c/cond/FusedBatchNormV3_1/Switch"
  input: "id_block_stage2/bn2a_branch2c/cond/FusedBatchNormV3_1/Switch_1"
  input: "id_block_stage2/bn2a_branch2c/cond/FusedBatchNormV3_1/Switch_2"
  input: "id_block_stage2/bn2a_branch2c/cond/FusedBatchNormV3_1/Switch_3"
  input: "id_block_stage2/bn2a_branch2c/cond/FusedBatchNormV3_1/Switch_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "U"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.0010000000474974513
    }
  }
  attr {
    key: "is_training"
    value {
      b: false
    }
  }
}
node {
  name: "id_block_stage2/bn2a_branch2c/cond/FusedBatchNormV3_1/Switch"
  op: "Switch"
  input: "id_block_stage2/res2a_branch2c/BiasAdd"
  input: "id_block_stage2/bn2a_branch2c/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@id_block_stage2/res2a_branch2c/BiasAdd"
      }
    }
  }
}
node {
  name: "id_block_stage2/bn2a_branch2c/cond/FusedBatchNormV3_1/Switch_1"
  op: "Switch"
  input: "bn2a_branch2c/gamma/read"
  input: "id_block_stage2/bn2a_branch2c/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2a_branch2c/gamma"
      }
    }
  }
}
node {
  name: "id_block_stage2/bn2a_branch2c/cond/FusedBatchNormV3_1/Switch_2"
  op: "Switch"
  input: "bn2a_branch2c/beta/read"
  input: "id_block_stage2/bn2a_branch2c/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2a_branch2c/beta"
      }
    }
  }
}
node {
  name: "id_block_stage2/bn2a_branch2c/cond/FusedBatchNormV3_1/Switch_3"
  op: "Switch"
  input: "bn2a_branch2c/moving_mean/read"
  input: "id_block_stage2/bn2a_branch2c/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2a_branch2c/moving_mean"
      }
    }
  }
}
node {
  name: "id_block_stage2/bn2a_branch2c/cond/FusedBatchNormV3_1/Switch_4"
  op: "Switch"
  input: "bn2a_branch2c/moving_variance/read"
  input: "id_block_stage2/bn2a_branch2c/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2a_branch2c/moving_variance"
      }
    }
  }
}
node {
  name: "id_block_stage2/bn2a_branch2c/cond/Merge"
  op: "Merge"
  input: "id_block_stage2/bn2a_branch2c/cond/FusedBatchNormV3_1"
  input: "id_block_stage2/bn2a_branch2c/cond/FusedBatchNormV3"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "id_block_stage2/bn2a_branch2c/cond/Merge_1"
  op: "Merge"
  input: "id_block_stage2/bn2a_branch2c/cond/FusedBatchNormV3_1:1"
  input: "id_block_stage2/bn2a_branch2c/cond/FusedBatchNormV3:1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "id_block_stage2/bn2a_branch2c/cond/Merge_2"
  op: "Merge"
  input: "id_block_stage2/bn2a_branch2c/cond/FusedBatchNormV3_1:2"
  input: "id_block_stage2/bn2a_branch2c/cond/FusedBatchNormV3:2"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "id_block_stage2/bn2a_branch2c/cond_1/Switch"
  op: "Switch"
  input: "Placeholder_2"
  input: "Placeholder_2"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "id_block_stage2/bn2a_branch2c/cond_1/switch_t"
  op: "Identity"
  input: "id_block_stage2/bn2a_branch2c/cond_1/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "id_block_stage2/bn2a_branch2c/cond_1/switch_f"
  op: "Identity"
  input: "id_block_stage2/bn2a_branch2c/cond_1/Switch"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "id_block_stage2/bn2a_branch2c/cond_1/pred_id"
  op: "Identity"
  input: "Placeholder_2"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "id_block_stage2/bn2a_branch2c/cond_1/Const"
  op: "Const"
  input: "^id_block_stage2/bn2a_branch2c/cond_1/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.9900000095367432
      }
    }
  }
}
node {
  name: "id_block_stage2/bn2a_branch2c/cond_1/Const_1"
  op: "Const"
  input: "^id_block_stage2/bn2a_branch2c/cond_1/switch_f"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "id_block_stage2/bn2a_branch2c/cond_1/Merge"
  op: "Merge"
  input: "id_block_stage2/bn2a_branch2c/cond_1/Const_1"
  input: "id_block_stage2/bn2a_branch2c/cond_1/Const"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "id_block_stage2/bn2a_branch2c/AssignMovingAvg/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2a_branch2c/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "id_block_stage2/bn2a_branch2c/AssignMovingAvg/sub"
  op: "Sub"
  input: "id_block_stage2/bn2a_branch2c/AssignMovingAvg/sub/x"
  input: "id_block_stage2/bn2a_branch2c/cond_1/Merge"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2a_branch2c/moving_mean"
      }
    }
  }
}
node {
  name: "id_block_stage2/bn2a_branch2c/AssignMovingAvg/sub_1"
  op: "Sub"
  input: "bn2a_branch2c/moving_mean/read"
  input: "id_block_stage2/bn2a_branch2c/cond/Merge_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2a_branch2c/moving_mean"
      }
    }
  }
}
node {
  name: "id_block_stage2/bn2a_branch2c/AssignMovingAvg/mul"
  op: "Mul"
  input: "id_block_stage2/bn2a_branch2c/AssignMovingAvg/sub_1"
  input: "id_block_stage2/bn2a_branch2c/AssignMovingAvg/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2a_branch2c/moving_mean"
      }
    }
  }
}
node {
  name: "id_block_stage2/bn2a_branch2c/AssignMovingAvg"
  op: "AssignSub"
  input: "bn2a_branch2c/moving_mean"
  input: "id_block_stage2/bn2a_branch2c/AssignMovingAvg/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2a_branch2c/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "id_block_stage2/bn2a_branch2c/AssignMovingAvg_1/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2a_branch2c/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "id_block_stage2/bn2a_branch2c/AssignMovingAvg_1/sub"
  op: "Sub"
  input: "id_block_stage2/bn2a_branch2c/AssignMovingAvg_1/sub/x"
  input: "id_block_stage2/bn2a_branch2c/cond_1/Merge"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2a_branch2c/moving_variance"
      }
    }
  }
}
node {
  name: "id_block_stage2/bn2a_branch2c/AssignMovingAvg_1/sub_1"
  op: "Sub"
  input: "bn2a_branch2c/moving_variance/read"
  input: "id_block_stage2/bn2a_branch2c/cond/Merge_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2a_branch2c/moving_variance"
      }
    }
  }
}
node {
  name: "id_block_stage2/bn2a_branch2c/AssignMovingAvg_1/mul"
  op: "Mul"
  input: "id_block_stage2/bn2a_branch2c/AssignMovingAvg_1/sub_1"
  input: "id_block_stage2/bn2a_branch2c/AssignMovingAvg_1/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2a_branch2c/moving_variance"
      }
    }
  }
}
node {
  name: "id_block_stage2/bn2a_branch2c/AssignMovingAvg_1"
  op: "AssignSub"
  input: "bn2a_branch2c/moving_variance"
  input: "id_block_stage2/bn2a_branch2c/AssignMovingAvg_1/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2a_branch2c/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "id_block_stage2/Add"
  op: "Add"
  input: "id_block_stage2/bn2a_branch2c/cond/Merge"
  input: "max_pooling2d/MaxPool"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "id_block_stage2/Relu_1"
  op: "Relu"
  input: "id_block_stage2/Add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "res2b_branch2b/kernel/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res2b_branch2b/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000@\000\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "res2b_branch2b/kernel/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res2b_branch2b/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.07216878235340118
      }
    }
  }
}
node {
  name: "res2b_branch2b/kernel/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res2b_branch2b/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.07216878235340118
      }
    }
  }
}
node {
  name: "res2b_branch2b/kernel/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "res2b_branch2b/kernel/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res2b_branch2b/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "res2b_branch2b/kernel/Initializer/random_uniform/sub"
  op: "Sub"
  input: "res2b_branch2b/kernel/Initializer/random_uniform/max"
  input: "res2b_branch2b/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res2b_branch2b/kernel"
      }
    }
  }
}
node {
  name: "res2b_branch2b/kernel/Initializer/random_uniform/mul"
  op: "Mul"
  input: "res2b_branch2b/kernel/Initializer/random_uniform/RandomUniform"
  input: "res2b_branch2b/kernel/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res2b_branch2b/kernel"
      }
    }
  }
}
node {
  name: "res2b_branch2b/kernel/Initializer/random_uniform"
  op: "Add"
  input: "res2b_branch2b/kernel/Initializer/random_uniform/mul"
  input: "res2b_branch2b/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res2b_branch2b/kernel"
      }
    }
  }
}
node {
  name: "res2b_branch2b/kernel"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res2b_branch2b/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 64
        }
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "res2b_branch2b/kernel/Assign"
  op: "Assign"
  input: "res2b_branch2b/kernel"
  input: "res2b_branch2b/kernel/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res2b_branch2b/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "res2b_branch2b/kernel/read"
  op: "Identity"
  input: "res2b_branch2b/kernel"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res2b_branch2b/kernel"
      }
    }
  }
}
node {
  name: "id_block_stage2_1/res2b_branch2b/kernel/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0005000000237487257
      }
    }
  }
}
node {
  name: "id_block_stage2_1/res2b_branch2b/kernel/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "res2b_branch2b/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "id_block_stage2_1/res2b_branch2b/kernel/Regularizer/l2_regularizer"
  op: "Mul"
  input: "id_block_stage2_1/res2b_branch2b/kernel/Regularizer/l2_regularizer/scale"
  input: "id_block_stage2_1/res2b_branch2b/kernel/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "res2b_branch2b/bias/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res2b_branch2b/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "res2b_branch2b/bias"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res2b_branch2b/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "res2b_branch2b/bias/Assign"
  op: "Assign"
  input: "res2b_branch2b/bias"
  input: "res2b_branch2b/bias/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res2b_branch2b/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "res2b_branch2b/bias/read"
  op: "Identity"
  input: "res2b_branch2b/bias"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res2b_branch2b/bias"
      }
    }
  }
}
node {
  name: "id_block_stage2_1/res2b_branch2b/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "id_block_stage2_1/res2b_branch2b/Conv2D"
  op: "Conv2D"
  input: "id_block_stage2/Relu_1"
  input: "res2b_branch2b/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "id_block_stage2_1/res2b_branch2b/BiasAdd"
  op: "BiasAdd"
  input: "id_block_stage2_1/res2b_branch2b/Conv2D"
  input: "res2b_branch2b/bias/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "bn2b_branch2b/gamma/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2b_branch2b/gamma"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "bn2b_branch2b/gamma"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2b_branch2b/gamma"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn2b_branch2b/gamma/Assign"
  op: "Assign"
  input: "bn2b_branch2b/gamma"
  input: "bn2b_branch2b/gamma/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2b_branch2b/gamma"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn2b_branch2b/gamma/read"
  op: "Identity"
  input: "bn2b_branch2b/gamma"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2b_branch2b/gamma"
      }
    }
  }
}
node {
  name: "bn2b_branch2b/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2b_branch2b/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "bn2b_branch2b/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2b_branch2b/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn2b_branch2b/beta/Assign"
  op: "Assign"
  input: "bn2b_branch2b/beta"
  input: "bn2b_branch2b/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2b_branch2b/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn2b_branch2b/beta/read"
  op: "Identity"
  input: "bn2b_branch2b/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2b_branch2b/beta"
      }
    }
  }
}
node {
  name: "bn2b_branch2b/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2b_branch2b/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "bn2b_branch2b/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2b_branch2b/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn2b_branch2b/moving_mean/Assign"
  op: "Assign"
  input: "bn2b_branch2b/moving_mean"
  input: "bn2b_branch2b/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2b_branch2b/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn2b_branch2b/moving_mean/read"
  op: "Identity"
  input: "bn2b_branch2b/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2b_branch2b/moving_mean"
      }
    }
  }
}
node {
  name: "bn2b_branch2b/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2b_branch2b/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "bn2b_branch2b/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2b_branch2b/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn2b_branch2b/moving_variance/Assign"
  op: "Assign"
  input: "bn2b_branch2b/moving_variance"
  input: "bn2b_branch2b/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2b_branch2b/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn2b_branch2b/moving_variance/read"
  op: "Identity"
  input: "bn2b_branch2b/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2b_branch2b/moving_variance"
      }
    }
  }
}
node {
  name: "id_block_stage2_1/bn2b_branch2b/cond/Switch"
  op: "Switch"
  input: "Placeholder_2"
  input: "Placeholder_2"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "id_block_stage2_1/bn2b_branch2b/cond/switch_t"
  op: "Identity"
  input: "id_block_stage2_1/bn2b_branch2b/cond/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "id_block_stage2_1/bn2b_branch2b/cond/switch_f"
  op: "Identity"
  input: "id_block_stage2_1/bn2b_branch2b/cond/Switch"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "id_block_stage2_1/bn2b_branch2b/cond/pred_id"
  op: "Identity"
  input: "Placeholder_2"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "id_block_stage2_1/bn2b_branch2b/cond/Const"
  op: "Const"
  input: "^id_block_stage2_1/bn2b_branch2b/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "id_block_stage2_1/bn2b_branch2b/cond/Const_1"
  op: "Const"
  input: "^id_block_stage2_1/bn2b_branch2b/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "id_block_stage2_1/bn2b_branch2b/cond/FusedBatchNormV3"
  op: "FusedBatchNormV3"
  input: "id_block_stage2_1/bn2b_branch2b/cond/FusedBatchNormV3/Switch:1"
  input: "id_block_stage2_1/bn2b_branch2b/cond/FusedBatchNormV3/Switch_1:1"
  input: "id_block_stage2_1/bn2b_branch2b/cond/FusedBatchNormV3/Switch_2:1"
  input: "id_block_stage2_1/bn2b_branch2b/cond/Const"
  input: "id_block_stage2_1/bn2b_branch2b/cond/Const_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "U"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.0010000000474974513
    }
  }
  attr {
    key: "is_training"
    value {
      b: true
    }
  }
}
node {
  name: "id_block_stage2_1/bn2b_branch2b/cond/FusedBatchNormV3/Switch"
  op: "Switch"
  input: "id_block_stage2_1/res2b_branch2b/BiasAdd"
  input: "id_block_stage2_1/bn2b_branch2b/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@id_block_stage2_1/res2b_branch2b/BiasAdd"
      }
    }
  }
}
node {
  name: "id_block_stage2_1/bn2b_branch2b/cond/FusedBatchNormV3/Switch_1"
  op: "Switch"
  input: "bn2b_branch2b/gamma/read"
  input: "id_block_stage2_1/bn2b_branch2b/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2b_branch2b/gamma"
      }
    }
  }
}
node {
  name: "id_block_stage2_1/bn2b_branch2b/cond/FusedBatchNormV3/Switch_2"
  op: "Switch"
  input: "bn2b_branch2b/beta/read"
  input: "id_block_stage2_1/bn2b_branch2b/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2b_branch2b/beta"
      }
    }
  }
}
node {
  name: "id_block_stage2_1/bn2b_branch2b/cond/FusedBatchNormV3_1"
  op: "FusedBatchNormV3"
  input: "id_block_stage2_1/bn2b_branch2b/cond/FusedBatchNormV3_1/Switch"
  input: "id_block_stage2_1/bn2b_branch2b/cond/FusedBatchNormV3_1/Switch_1"
  input: "id_block_stage2_1/bn2b_branch2b/cond/FusedBatchNormV3_1/Switch_2"
  input: "id_block_stage2_1/bn2b_branch2b/cond/FusedBatchNormV3_1/Switch_3"
  input: "id_block_stage2_1/bn2b_branch2b/cond/FusedBatchNormV3_1/Switch_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "U"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.0010000000474974513
    }
  }
  attr {
    key: "is_training"
    value {
      b: false
    }
  }
}
node {
  name: "id_block_stage2_1/bn2b_branch2b/cond/FusedBatchNormV3_1/Switch"
  op: "Switch"
  input: "id_block_stage2_1/res2b_branch2b/BiasAdd"
  input: "id_block_stage2_1/bn2b_branch2b/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@id_block_stage2_1/res2b_branch2b/BiasAdd"
      }
    }
  }
}
node {
  name: "id_block_stage2_1/bn2b_branch2b/cond/FusedBatchNormV3_1/Switch_1"
  op: "Switch"
  input: "bn2b_branch2b/gamma/read"
  input: "id_block_stage2_1/bn2b_branch2b/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2b_branch2b/gamma"
      }
    }
  }
}
node {
  name: "id_block_stage2_1/bn2b_branch2b/cond/FusedBatchNormV3_1/Switch_2"
  op: "Switch"
  input: "bn2b_branch2b/beta/read"
  input: "id_block_stage2_1/bn2b_branch2b/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2b_branch2b/beta"
      }
    }
  }
}
node {
  name: "id_block_stage2_1/bn2b_branch2b/cond/FusedBatchNormV3_1/Switch_3"
  op: "Switch"
  input: "bn2b_branch2b/moving_mean/read"
  input: "id_block_stage2_1/bn2b_branch2b/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2b_branch2b/moving_mean"
      }
    }
  }
}
node {
  name: "id_block_stage2_1/bn2b_branch2b/cond/FusedBatchNormV3_1/Switch_4"
  op: "Switch"
  input: "bn2b_branch2b/moving_variance/read"
  input: "id_block_stage2_1/bn2b_branch2b/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2b_branch2b/moving_variance"
      }
    }
  }
}
node {
  name: "id_block_stage2_1/bn2b_branch2b/cond/Merge"
  op: "Merge"
  input: "id_block_stage2_1/bn2b_branch2b/cond/FusedBatchNormV3_1"
  input: "id_block_stage2_1/bn2b_branch2b/cond/FusedBatchNormV3"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "id_block_stage2_1/bn2b_branch2b/cond/Merge_1"
  op: "Merge"
  input: "id_block_stage2_1/bn2b_branch2b/cond/FusedBatchNormV3_1:1"
  input: "id_block_stage2_1/bn2b_branch2b/cond/FusedBatchNormV3:1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "id_block_stage2_1/bn2b_branch2b/cond/Merge_2"
  op: "Merge"
  input: "id_block_stage2_1/bn2b_branch2b/cond/FusedBatchNormV3_1:2"
  input: "id_block_stage2_1/bn2b_branch2b/cond/FusedBatchNormV3:2"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "id_block_stage2_1/bn2b_branch2b/cond_1/Switch"
  op: "Switch"
  input: "Placeholder_2"
  input: "Placeholder_2"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "id_block_stage2_1/bn2b_branch2b/cond_1/switch_t"
  op: "Identity"
  input: "id_block_stage2_1/bn2b_branch2b/cond_1/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "id_block_stage2_1/bn2b_branch2b/cond_1/switch_f"
  op: "Identity"
  input: "id_block_stage2_1/bn2b_branch2b/cond_1/Switch"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "id_block_stage2_1/bn2b_branch2b/cond_1/pred_id"
  op: "Identity"
  input: "Placeholder_2"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "id_block_stage2_1/bn2b_branch2b/cond_1/Const"
  op: "Const"
  input: "^id_block_stage2_1/bn2b_branch2b/cond_1/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.9900000095367432
      }
    }
  }
}
node {
  name: "id_block_stage2_1/bn2b_branch2b/cond_1/Const_1"
  op: "Const"
  input: "^id_block_stage2_1/bn2b_branch2b/cond_1/switch_f"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "id_block_stage2_1/bn2b_branch2b/cond_1/Merge"
  op: "Merge"
  input: "id_block_stage2_1/bn2b_branch2b/cond_1/Const_1"
  input: "id_block_stage2_1/bn2b_branch2b/cond_1/Const"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "id_block_stage2_1/bn2b_branch2b/AssignMovingAvg/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2b_branch2b/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "id_block_stage2_1/bn2b_branch2b/AssignMovingAvg/sub"
  op: "Sub"
  input: "id_block_stage2_1/bn2b_branch2b/AssignMovingAvg/sub/x"
  input: "id_block_stage2_1/bn2b_branch2b/cond_1/Merge"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2b_branch2b/moving_mean"
      }
    }
  }
}
node {
  name: "id_block_stage2_1/bn2b_branch2b/AssignMovingAvg/sub_1"
  op: "Sub"
  input: "bn2b_branch2b/moving_mean/read"
  input: "id_block_stage2_1/bn2b_branch2b/cond/Merge_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2b_branch2b/moving_mean"
      }
    }
  }
}
node {
  name: "id_block_stage2_1/bn2b_branch2b/AssignMovingAvg/mul"
  op: "Mul"
  input: "id_block_stage2_1/bn2b_branch2b/AssignMovingAvg/sub_1"
  input: "id_block_stage2_1/bn2b_branch2b/AssignMovingAvg/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2b_branch2b/moving_mean"
      }
    }
  }
}
node {
  name: "id_block_stage2_1/bn2b_branch2b/AssignMovingAvg"
  op: "AssignSub"
  input: "bn2b_branch2b/moving_mean"
  input: "id_block_stage2_1/bn2b_branch2b/AssignMovingAvg/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2b_branch2b/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "id_block_stage2_1/bn2b_branch2b/AssignMovingAvg_1/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2b_branch2b/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "id_block_stage2_1/bn2b_branch2b/AssignMovingAvg_1/sub"
  op: "Sub"
  input: "id_block_stage2_1/bn2b_branch2b/AssignMovingAvg_1/sub/x"
  input: "id_block_stage2_1/bn2b_branch2b/cond_1/Merge"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2b_branch2b/moving_variance"
      }
    }
  }
}
node {
  name: "id_block_stage2_1/bn2b_branch2b/AssignMovingAvg_1/sub_1"
  op: "Sub"
  input: "bn2b_branch2b/moving_variance/read"
  input: "id_block_stage2_1/bn2b_branch2b/cond/Merge_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2b_branch2b/moving_variance"
      }
    }
  }
}
node {
  name: "id_block_stage2_1/bn2b_branch2b/AssignMovingAvg_1/mul"
  op: "Mul"
  input: "id_block_stage2_1/bn2b_branch2b/AssignMovingAvg_1/sub_1"
  input: "id_block_stage2_1/bn2b_branch2b/AssignMovingAvg_1/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2b_branch2b/moving_variance"
      }
    }
  }
}
node {
  name: "id_block_stage2_1/bn2b_branch2b/AssignMovingAvg_1"
  op: "AssignSub"
  input: "bn2b_branch2b/moving_variance"
  input: "id_block_stage2_1/bn2b_branch2b/AssignMovingAvg_1/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2b_branch2b/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "id_block_stage2_1/Relu"
  op: "Relu"
  input: "id_block_stage2_1/bn2b_branch2b/cond/Merge"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "res2b_branch2c/kernel/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res2b_branch2c/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000@\000\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "res2b_branch2c/kernel/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res2b_branch2c/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.07216878235340118
      }
    }
  }
}
node {
  name: "res2b_branch2c/kernel/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res2b_branch2c/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.07216878235340118
      }
    }
  }
}
node {
  name: "res2b_branch2c/kernel/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "res2b_branch2c/kernel/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res2b_branch2c/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "res2b_branch2c/kernel/Initializer/random_uniform/sub"
  op: "Sub"
  input: "res2b_branch2c/kernel/Initializer/random_uniform/max"
  input: "res2b_branch2c/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res2b_branch2c/kernel"
      }
    }
  }
}
node {
  name: "res2b_branch2c/kernel/Initializer/random_uniform/mul"
  op: "Mul"
  input: "res2b_branch2c/kernel/Initializer/random_uniform/RandomUniform"
  input: "res2b_branch2c/kernel/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res2b_branch2c/kernel"
      }
    }
  }
}
node {
  name: "res2b_branch2c/kernel/Initializer/random_uniform"
  op: "Add"
  input: "res2b_branch2c/kernel/Initializer/random_uniform/mul"
  input: "res2b_branch2c/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res2b_branch2c/kernel"
      }
    }
  }
}
node {
  name: "res2b_branch2c/kernel"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res2b_branch2c/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 64
        }
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "res2b_branch2c/kernel/Assign"
  op: "Assign"
  input: "res2b_branch2c/kernel"
  input: "res2b_branch2c/kernel/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res2b_branch2c/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "res2b_branch2c/kernel/read"
  op: "Identity"
  input: "res2b_branch2c/kernel"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res2b_branch2c/kernel"
      }
    }
  }
}
node {
  name: "id_block_stage2_1/res2b_branch2c/kernel/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0005000000237487257
      }
    }
  }
}
node {
  name: "id_block_stage2_1/res2b_branch2c/kernel/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "res2b_branch2c/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "id_block_stage2_1/res2b_branch2c/kernel/Regularizer/l2_regularizer"
  op: "Mul"
  input: "id_block_stage2_1/res2b_branch2c/kernel/Regularizer/l2_regularizer/scale"
  input: "id_block_stage2_1/res2b_branch2c/kernel/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "res2b_branch2c/bias/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res2b_branch2c/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "res2b_branch2c/bias"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res2b_branch2c/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "res2b_branch2c/bias/Assign"
  op: "Assign"
  input: "res2b_branch2c/bias"
  input: "res2b_branch2c/bias/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res2b_branch2c/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "res2b_branch2c/bias/read"
  op: "Identity"
  input: "res2b_branch2c/bias"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res2b_branch2c/bias"
      }
    }
  }
}
node {
  name: "id_block_stage2_1/res2b_branch2c/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "id_block_stage2_1/res2b_branch2c/Conv2D"
  op: "Conv2D"
  input: "id_block_stage2_1/Relu"
  input: "res2b_branch2c/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "id_block_stage2_1/res2b_branch2c/BiasAdd"
  op: "BiasAdd"
  input: "id_block_stage2_1/res2b_branch2c/Conv2D"
  input: "res2b_branch2c/bias/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "bn2b_branch2c/gamma/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2b_branch2c/gamma"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "bn2b_branch2c/gamma"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2b_branch2c/gamma"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn2b_branch2c/gamma/Assign"
  op: "Assign"
  input: "bn2b_branch2c/gamma"
  input: "bn2b_branch2c/gamma/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2b_branch2c/gamma"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn2b_branch2c/gamma/read"
  op: "Identity"
  input: "bn2b_branch2c/gamma"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2b_branch2c/gamma"
      }
    }
  }
}
node {
  name: "bn2b_branch2c/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2b_branch2c/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "bn2b_branch2c/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2b_branch2c/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn2b_branch2c/beta/Assign"
  op: "Assign"
  input: "bn2b_branch2c/beta"
  input: "bn2b_branch2c/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2b_branch2c/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn2b_branch2c/beta/read"
  op: "Identity"
  input: "bn2b_branch2c/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2b_branch2c/beta"
      }
    }
  }
}
node {
  name: "bn2b_branch2c/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2b_branch2c/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "bn2b_branch2c/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2b_branch2c/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn2b_branch2c/moving_mean/Assign"
  op: "Assign"
  input: "bn2b_branch2c/moving_mean"
  input: "bn2b_branch2c/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2b_branch2c/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn2b_branch2c/moving_mean/read"
  op: "Identity"
  input: "bn2b_branch2c/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2b_branch2c/moving_mean"
      }
    }
  }
}
node {
  name: "bn2b_branch2c/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2b_branch2c/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "bn2b_branch2c/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2b_branch2c/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn2b_branch2c/moving_variance/Assign"
  op: "Assign"
  input: "bn2b_branch2c/moving_variance"
  input: "bn2b_branch2c/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2b_branch2c/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn2b_branch2c/moving_variance/read"
  op: "Identity"
  input: "bn2b_branch2c/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2b_branch2c/moving_variance"
      }
    }
  }
}
node {
  name: "id_block_stage2_1/bn2b_branch2c/cond/Switch"
  op: "Switch"
  input: "Placeholder_2"
  input: "Placeholder_2"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "id_block_stage2_1/bn2b_branch2c/cond/switch_t"
  op: "Identity"
  input: "id_block_stage2_1/bn2b_branch2c/cond/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "id_block_stage2_1/bn2b_branch2c/cond/switch_f"
  op: "Identity"
  input: "id_block_stage2_1/bn2b_branch2c/cond/Switch"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "id_block_stage2_1/bn2b_branch2c/cond/pred_id"
  op: "Identity"
  input: "Placeholder_2"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "id_block_stage2_1/bn2b_branch2c/cond/Const"
  op: "Const"
  input: "^id_block_stage2_1/bn2b_branch2c/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "id_block_stage2_1/bn2b_branch2c/cond/Const_1"
  op: "Const"
  input: "^id_block_stage2_1/bn2b_branch2c/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "id_block_stage2_1/bn2b_branch2c/cond/FusedBatchNormV3"
  op: "FusedBatchNormV3"
  input: "id_block_stage2_1/bn2b_branch2c/cond/FusedBatchNormV3/Switch:1"
  input: "id_block_stage2_1/bn2b_branch2c/cond/FusedBatchNormV3/Switch_1:1"
  input: "id_block_stage2_1/bn2b_branch2c/cond/FusedBatchNormV3/Switch_2:1"
  input: "id_block_stage2_1/bn2b_branch2c/cond/Const"
  input: "id_block_stage2_1/bn2b_branch2c/cond/Const_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "U"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.0010000000474974513
    }
  }
  attr {
    key: "is_training"
    value {
      b: true
    }
  }
}
node {
  name: "id_block_stage2_1/bn2b_branch2c/cond/FusedBatchNormV3/Switch"
  op: "Switch"
  input: "id_block_stage2_1/res2b_branch2c/BiasAdd"
  input: "id_block_stage2_1/bn2b_branch2c/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@id_block_stage2_1/res2b_branch2c/BiasAdd"
      }
    }
  }
}
node {
  name: "id_block_stage2_1/bn2b_branch2c/cond/FusedBatchNormV3/Switch_1"
  op: "Switch"
  input: "bn2b_branch2c/gamma/read"
  input: "id_block_stage2_1/bn2b_branch2c/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2b_branch2c/gamma"
      }
    }
  }
}
node {
  name: "id_block_stage2_1/bn2b_branch2c/cond/FusedBatchNormV3/Switch_2"
  op: "Switch"
  input: "bn2b_branch2c/beta/read"
  input: "id_block_stage2_1/bn2b_branch2c/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2b_branch2c/beta"
      }
    }
  }
}
node {
  name: "id_block_stage2_1/bn2b_branch2c/cond/FusedBatchNormV3_1"
  op: "FusedBatchNormV3"
  input: "id_block_stage2_1/bn2b_branch2c/cond/FusedBatchNormV3_1/Switch"
  input: "id_block_stage2_1/bn2b_branch2c/cond/FusedBatchNormV3_1/Switch_1"
  input: "id_block_stage2_1/bn2b_branch2c/cond/FusedBatchNormV3_1/Switch_2"
  input: "id_block_stage2_1/bn2b_branch2c/cond/FusedBatchNormV3_1/Switch_3"
  input: "id_block_stage2_1/bn2b_branch2c/cond/FusedBatchNormV3_1/Switch_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "U"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.0010000000474974513
    }
  }
  attr {
    key: "is_training"
    value {
      b: false
    }
  }
}
node {
  name: "id_block_stage2_1/bn2b_branch2c/cond/FusedBatchNormV3_1/Switch"
  op: "Switch"
  input: "id_block_stage2_1/res2b_branch2c/BiasAdd"
  input: "id_block_stage2_1/bn2b_branch2c/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@id_block_stage2_1/res2b_branch2c/BiasAdd"
      }
    }
  }
}
node {
  name: "id_block_stage2_1/bn2b_branch2c/cond/FusedBatchNormV3_1/Switch_1"
  op: "Switch"
  input: "bn2b_branch2c/gamma/read"
  input: "id_block_stage2_1/bn2b_branch2c/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2b_branch2c/gamma"
      }
    }
  }
}
node {
  name: "id_block_stage2_1/bn2b_branch2c/cond/FusedBatchNormV3_1/Switch_2"
  op: "Switch"
  input: "bn2b_branch2c/beta/read"
  input: "id_block_stage2_1/bn2b_branch2c/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2b_branch2c/beta"
      }
    }
  }
}
node {
  name: "id_block_stage2_1/bn2b_branch2c/cond/FusedBatchNormV3_1/Switch_3"
  op: "Switch"
  input: "bn2b_branch2c/moving_mean/read"
  input: "id_block_stage2_1/bn2b_branch2c/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2b_branch2c/moving_mean"
      }
    }
  }
}
node {
  name: "id_block_stage2_1/bn2b_branch2c/cond/FusedBatchNormV3_1/Switch_4"
  op: "Switch"
  input: "bn2b_branch2c/moving_variance/read"
  input: "id_block_stage2_1/bn2b_branch2c/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2b_branch2c/moving_variance"
      }
    }
  }
}
node {
  name: "id_block_stage2_1/bn2b_branch2c/cond/Merge"
  op: "Merge"
  input: "id_block_stage2_1/bn2b_branch2c/cond/FusedBatchNormV3_1"
  input: "id_block_stage2_1/bn2b_branch2c/cond/FusedBatchNormV3"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "id_block_stage2_1/bn2b_branch2c/cond/Merge_1"
  op: "Merge"
  input: "id_block_stage2_1/bn2b_branch2c/cond/FusedBatchNormV3_1:1"
  input: "id_block_stage2_1/bn2b_branch2c/cond/FusedBatchNormV3:1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "id_block_stage2_1/bn2b_branch2c/cond/Merge_2"
  op: "Merge"
  input: "id_block_stage2_1/bn2b_branch2c/cond/FusedBatchNormV3_1:2"
  input: "id_block_stage2_1/bn2b_branch2c/cond/FusedBatchNormV3:2"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "id_block_stage2_1/bn2b_branch2c/cond_1/Switch"
  op: "Switch"
  input: "Placeholder_2"
  input: "Placeholder_2"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "id_block_stage2_1/bn2b_branch2c/cond_1/switch_t"
  op: "Identity"
  input: "id_block_stage2_1/bn2b_branch2c/cond_1/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "id_block_stage2_1/bn2b_branch2c/cond_1/switch_f"
  op: "Identity"
  input: "id_block_stage2_1/bn2b_branch2c/cond_1/Switch"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "id_block_stage2_1/bn2b_branch2c/cond_1/pred_id"
  op: "Identity"
  input: "Placeholder_2"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "id_block_stage2_1/bn2b_branch2c/cond_1/Const"
  op: "Const"
  input: "^id_block_stage2_1/bn2b_branch2c/cond_1/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.9900000095367432
      }
    }
  }
}
node {
  name: "id_block_stage2_1/bn2b_branch2c/cond_1/Const_1"
  op: "Const"
  input: "^id_block_stage2_1/bn2b_branch2c/cond_1/switch_f"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "id_block_stage2_1/bn2b_branch2c/cond_1/Merge"
  op: "Merge"
  input: "id_block_stage2_1/bn2b_branch2c/cond_1/Const_1"
  input: "id_block_stage2_1/bn2b_branch2c/cond_1/Const"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "id_block_stage2_1/bn2b_branch2c/AssignMovingAvg/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2b_branch2c/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "id_block_stage2_1/bn2b_branch2c/AssignMovingAvg/sub"
  op: "Sub"
  input: "id_block_stage2_1/bn2b_branch2c/AssignMovingAvg/sub/x"
  input: "id_block_stage2_1/bn2b_branch2c/cond_1/Merge"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2b_branch2c/moving_mean"
      }
    }
  }
}
node {
  name: "id_block_stage2_1/bn2b_branch2c/AssignMovingAvg/sub_1"
  op: "Sub"
  input: "bn2b_branch2c/moving_mean/read"
  input: "id_block_stage2_1/bn2b_branch2c/cond/Merge_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2b_branch2c/moving_mean"
      }
    }
  }
}
node {
  name: "id_block_stage2_1/bn2b_branch2c/AssignMovingAvg/mul"
  op: "Mul"
  input: "id_block_stage2_1/bn2b_branch2c/AssignMovingAvg/sub_1"
  input: "id_block_stage2_1/bn2b_branch2c/AssignMovingAvg/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2b_branch2c/moving_mean"
      }
    }
  }
}
node {
  name: "id_block_stage2_1/bn2b_branch2c/AssignMovingAvg"
  op: "AssignSub"
  input: "bn2b_branch2c/moving_mean"
  input: "id_block_stage2_1/bn2b_branch2c/AssignMovingAvg/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2b_branch2c/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "id_block_stage2_1/bn2b_branch2c/AssignMovingAvg_1/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2b_branch2c/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "id_block_stage2_1/bn2b_branch2c/AssignMovingAvg_1/sub"
  op: "Sub"
  input: "id_block_stage2_1/bn2b_branch2c/AssignMovingAvg_1/sub/x"
  input: "id_block_stage2_1/bn2b_branch2c/cond_1/Merge"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2b_branch2c/moving_variance"
      }
    }
  }
}
node {
  name: "id_block_stage2_1/bn2b_branch2c/AssignMovingAvg_1/sub_1"
  op: "Sub"
  input: "bn2b_branch2c/moving_variance/read"
  input: "id_block_stage2_1/bn2b_branch2c/cond/Merge_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2b_branch2c/moving_variance"
      }
    }
  }
}
node {
  name: "id_block_stage2_1/bn2b_branch2c/AssignMovingAvg_1/mul"
  op: "Mul"
  input: "id_block_stage2_1/bn2b_branch2c/AssignMovingAvg_1/sub_1"
  input: "id_block_stage2_1/bn2b_branch2c/AssignMovingAvg_1/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2b_branch2c/moving_variance"
      }
    }
  }
}
node {
  name: "id_block_stage2_1/bn2b_branch2c/AssignMovingAvg_1"
  op: "AssignSub"
  input: "bn2b_branch2c/moving_variance"
  input: "id_block_stage2_1/bn2b_branch2c/AssignMovingAvg_1/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2b_branch2c/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "id_block_stage2_1/Add"
  op: "Add"
  input: "id_block_stage2_1/bn2b_branch2c/cond/Merge"
  input: "id_block_stage2/Relu_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "id_block_stage2_1/Relu_1"
  op: "Relu"
  input: "id_block_stage2_1/Add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "res3a_branch2a/kernel/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res3a_branch2a/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000@\000\000\000\200\000\000\000"
      }
    }
  }
}
node {
  name: "res3a_branch2a/kernel/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res3a_branch2a/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.0589255653321743
      }
    }
  }
}
node {
  name: "res3a_branch2a/kernel/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res3a_branch2a/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0589255653321743
      }
    }
  }
}
node {
  name: "res3a_branch2a/kernel/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "res3a_branch2a/kernel/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res3a_branch2a/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "res3a_branch2a/kernel/Initializer/random_uniform/sub"
  op: "Sub"
  input: "res3a_branch2a/kernel/Initializer/random_uniform/max"
  input: "res3a_branch2a/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res3a_branch2a/kernel"
      }
    }
  }
}
node {
  name: "res3a_branch2a/kernel/Initializer/random_uniform/mul"
  op: "Mul"
  input: "res3a_branch2a/kernel/Initializer/random_uniform/RandomUniform"
  input: "res3a_branch2a/kernel/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res3a_branch2a/kernel"
      }
    }
  }
}
node {
  name: "res3a_branch2a/kernel/Initializer/random_uniform"
  op: "Add"
  input: "res3a_branch2a/kernel/Initializer/random_uniform/mul"
  input: "res3a_branch2a/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res3a_branch2a/kernel"
      }
    }
  }
}
node {
  name: "res3a_branch2a/kernel"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res3a_branch2a/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 64
        }
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "res3a_branch2a/kernel/Assign"
  op: "Assign"
  input: "res3a_branch2a/kernel"
  input: "res3a_branch2a/kernel/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res3a_branch2a/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "res3a_branch2a/kernel/read"
  op: "Identity"
  input: "res3a_branch2a/kernel"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res3a_branch2a/kernel"
      }
    }
  }
}
node {
  name: "conv_block_stage3/res3a_branch2a/kernel/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0005000000237487257
      }
    }
  }
}
node {
  name: "conv_block_stage3/res3a_branch2a/kernel/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "res3a_branch2a/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv_block_stage3/res3a_branch2a/kernel/Regularizer/l2_regularizer"
  op: "Mul"
  input: "conv_block_stage3/res3a_branch2a/kernel/Regularizer/l2_regularizer/scale"
  input: "conv_block_stage3/res3a_branch2a/kernel/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "res3a_branch2a/bias/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res3a_branch2a/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 128
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "res3a_branch2a/bias"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res3a_branch2a/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "res3a_branch2a/bias/Assign"
  op: "Assign"
  input: "res3a_branch2a/bias"
  input: "res3a_branch2a/bias/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res3a_branch2a/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "res3a_branch2a/bias/read"
  op: "Identity"
  input: "res3a_branch2a/bias"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res3a_branch2a/bias"
      }
    }
  }
}
node {
  name: "conv_block_stage3/res3a_branch2a/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "conv_block_stage3/res3a_branch2a/Conv2D"
  op: "Conv2D"
  input: "id_block_stage2_1/Relu_1"
  input: "res3a_branch2a/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "conv_block_stage3/res3a_branch2a/BiasAdd"
  op: "BiasAdd"
  input: "conv_block_stage3/res3a_branch2a/Conv2D"
  input: "res3a_branch2a/bias/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "bn3a_branch2a/gamma/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch2a/gamma"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 128
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "bn3a_branch2a/gamma"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch2a/gamma"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn3a_branch2a/gamma/Assign"
  op: "Assign"
  input: "bn3a_branch2a/gamma"
  input: "bn3a_branch2a/gamma/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch2a/gamma"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn3a_branch2a/gamma/read"
  op: "Identity"
  input: "bn3a_branch2a/gamma"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch2a/gamma"
      }
    }
  }
}
node {
  name: "bn3a_branch2a/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch2a/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 128
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "bn3a_branch2a/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch2a/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn3a_branch2a/beta/Assign"
  op: "Assign"
  input: "bn3a_branch2a/beta"
  input: "bn3a_branch2a/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch2a/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn3a_branch2a/beta/read"
  op: "Identity"
  input: "bn3a_branch2a/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch2a/beta"
      }
    }
  }
}
node {
  name: "bn3a_branch2a/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch2a/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 128
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "bn3a_branch2a/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch2a/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn3a_branch2a/moving_mean/Assign"
  op: "Assign"
  input: "bn3a_branch2a/moving_mean"
  input: "bn3a_branch2a/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch2a/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn3a_branch2a/moving_mean/read"
  op: "Identity"
  input: "bn3a_branch2a/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch2a/moving_mean"
      }
    }
  }
}
node {
  name: "bn3a_branch2a/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch2a/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 128
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "bn3a_branch2a/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch2a/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn3a_branch2a/moving_variance/Assign"
  op: "Assign"
  input: "bn3a_branch2a/moving_variance"
  input: "bn3a_branch2a/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch2a/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn3a_branch2a/moving_variance/read"
  op: "Identity"
  input: "bn3a_branch2a/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch2a/moving_variance"
      }
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch2a/cond/Switch"
  op: "Switch"
  input: "Placeholder_2"
  input: "Placeholder_2"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch2a/cond/switch_t"
  op: "Identity"
  input: "conv_block_stage3/bn3a_branch2a/cond/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch2a/cond/switch_f"
  op: "Identity"
  input: "conv_block_stage3/bn3a_branch2a/cond/Switch"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch2a/cond/pred_id"
  op: "Identity"
  input: "Placeholder_2"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch2a/cond/Const"
  op: "Const"
  input: "^conv_block_stage3/bn3a_branch2a/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch2a/cond/Const_1"
  op: "Const"
  input: "^conv_block_stage3/bn3a_branch2a/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch2a/cond/FusedBatchNormV3"
  op: "FusedBatchNormV3"
  input: "conv_block_stage3/bn3a_branch2a/cond/FusedBatchNormV3/Switch:1"
  input: "conv_block_stage3/bn3a_branch2a/cond/FusedBatchNormV3/Switch_1:1"
  input: "conv_block_stage3/bn3a_branch2a/cond/FusedBatchNormV3/Switch_2:1"
  input: "conv_block_stage3/bn3a_branch2a/cond/Const"
  input: "conv_block_stage3/bn3a_branch2a/cond/Const_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "U"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.0010000000474974513
    }
  }
  attr {
    key: "is_training"
    value {
      b: true
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch2a/cond/FusedBatchNormV3/Switch"
  op: "Switch"
  input: "conv_block_stage3/res3a_branch2a/BiasAdd"
  input: "conv_block_stage3/bn3a_branch2a/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_block_stage3/res3a_branch2a/BiasAdd"
      }
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch2a/cond/FusedBatchNormV3/Switch_1"
  op: "Switch"
  input: "bn3a_branch2a/gamma/read"
  input: "conv_block_stage3/bn3a_branch2a/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch2a/gamma"
      }
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch2a/cond/FusedBatchNormV3/Switch_2"
  op: "Switch"
  input: "bn3a_branch2a/beta/read"
  input: "conv_block_stage3/bn3a_branch2a/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch2a/beta"
      }
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch2a/cond/FusedBatchNormV3_1"
  op: "FusedBatchNormV3"
  input: "conv_block_stage3/bn3a_branch2a/cond/FusedBatchNormV3_1/Switch"
  input: "conv_block_stage3/bn3a_branch2a/cond/FusedBatchNormV3_1/Switch_1"
  input: "conv_block_stage3/bn3a_branch2a/cond/FusedBatchNormV3_1/Switch_2"
  input: "conv_block_stage3/bn3a_branch2a/cond/FusedBatchNormV3_1/Switch_3"
  input: "conv_block_stage3/bn3a_branch2a/cond/FusedBatchNormV3_1/Switch_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "U"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.0010000000474974513
    }
  }
  attr {
    key: "is_training"
    value {
      b: false
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch2a/cond/FusedBatchNormV3_1/Switch"
  op: "Switch"
  input: "conv_block_stage3/res3a_branch2a/BiasAdd"
  input: "conv_block_stage3/bn3a_branch2a/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_block_stage3/res3a_branch2a/BiasAdd"
      }
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch2a/cond/FusedBatchNormV3_1/Switch_1"
  op: "Switch"
  input: "bn3a_branch2a/gamma/read"
  input: "conv_block_stage3/bn3a_branch2a/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch2a/gamma"
      }
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch2a/cond/FusedBatchNormV3_1/Switch_2"
  op: "Switch"
  input: "bn3a_branch2a/beta/read"
  input: "conv_block_stage3/bn3a_branch2a/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch2a/beta"
      }
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch2a/cond/FusedBatchNormV3_1/Switch_3"
  op: "Switch"
  input: "bn3a_branch2a/moving_mean/read"
  input: "conv_block_stage3/bn3a_branch2a/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch2a/moving_mean"
      }
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch2a/cond/FusedBatchNormV3_1/Switch_4"
  op: "Switch"
  input: "bn3a_branch2a/moving_variance/read"
  input: "conv_block_stage3/bn3a_branch2a/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch2a/moving_variance"
      }
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch2a/cond/Merge"
  op: "Merge"
  input: "conv_block_stage3/bn3a_branch2a/cond/FusedBatchNormV3_1"
  input: "conv_block_stage3/bn3a_branch2a/cond/FusedBatchNormV3"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch2a/cond/Merge_1"
  op: "Merge"
  input: "conv_block_stage3/bn3a_branch2a/cond/FusedBatchNormV3_1:1"
  input: "conv_block_stage3/bn3a_branch2a/cond/FusedBatchNormV3:1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch2a/cond/Merge_2"
  op: "Merge"
  input: "conv_block_stage3/bn3a_branch2a/cond/FusedBatchNormV3_1:2"
  input: "conv_block_stage3/bn3a_branch2a/cond/FusedBatchNormV3:2"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch2a/cond_1/Switch"
  op: "Switch"
  input: "Placeholder_2"
  input: "Placeholder_2"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch2a/cond_1/switch_t"
  op: "Identity"
  input: "conv_block_stage3/bn3a_branch2a/cond_1/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch2a/cond_1/switch_f"
  op: "Identity"
  input: "conv_block_stage3/bn3a_branch2a/cond_1/Switch"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch2a/cond_1/pred_id"
  op: "Identity"
  input: "Placeholder_2"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch2a/cond_1/Const"
  op: "Const"
  input: "^conv_block_stage3/bn3a_branch2a/cond_1/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.9900000095367432
      }
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch2a/cond_1/Const_1"
  op: "Const"
  input: "^conv_block_stage3/bn3a_branch2a/cond_1/switch_f"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch2a/cond_1/Merge"
  op: "Merge"
  input: "conv_block_stage3/bn3a_branch2a/cond_1/Const_1"
  input: "conv_block_stage3/bn3a_branch2a/cond_1/Const"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch2a/AssignMovingAvg/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch2a/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch2a/AssignMovingAvg/sub"
  op: "Sub"
  input: "conv_block_stage3/bn3a_branch2a/AssignMovingAvg/sub/x"
  input: "conv_block_stage3/bn3a_branch2a/cond_1/Merge"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch2a/moving_mean"
      }
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch2a/AssignMovingAvg/sub_1"
  op: "Sub"
  input: "bn3a_branch2a/moving_mean/read"
  input: "conv_block_stage3/bn3a_branch2a/cond/Merge_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch2a/moving_mean"
      }
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch2a/AssignMovingAvg/mul"
  op: "Mul"
  input: "conv_block_stage3/bn3a_branch2a/AssignMovingAvg/sub_1"
  input: "conv_block_stage3/bn3a_branch2a/AssignMovingAvg/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch2a/moving_mean"
      }
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch2a/AssignMovingAvg"
  op: "AssignSub"
  input: "bn3a_branch2a/moving_mean"
  input: "conv_block_stage3/bn3a_branch2a/AssignMovingAvg/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch2a/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch2a/AssignMovingAvg_1/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch2a/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch2a/AssignMovingAvg_1/sub"
  op: "Sub"
  input: "conv_block_stage3/bn3a_branch2a/AssignMovingAvg_1/sub/x"
  input: "conv_block_stage3/bn3a_branch2a/cond_1/Merge"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch2a/moving_variance"
      }
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch2a/AssignMovingAvg_1/sub_1"
  op: "Sub"
  input: "bn3a_branch2a/moving_variance/read"
  input: "conv_block_stage3/bn3a_branch2a/cond/Merge_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch2a/moving_variance"
      }
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch2a/AssignMovingAvg_1/mul"
  op: "Mul"
  input: "conv_block_stage3/bn3a_branch2a/AssignMovingAvg_1/sub_1"
  input: "conv_block_stage3/bn3a_branch2a/AssignMovingAvg_1/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch2a/moving_variance"
      }
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch2a/AssignMovingAvg_1"
  op: "AssignSub"
  input: "bn3a_branch2a/moving_variance"
  input: "conv_block_stage3/bn3a_branch2a/AssignMovingAvg_1/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch2a/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "conv_block_stage3/Relu"
  op: "Relu"
  input: "conv_block_stage3/bn3a_branch2a/cond/Merge"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "res3a_branch2b/kernel/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res3a_branch2b/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\200\000\000\000\200\000\000\000"
      }
    }
  }
}
node {
  name: "res3a_branch2b/kernel/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res3a_branch2b/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.05103103816509247
      }
    }
  }
}
node {
  name: "res3a_branch2b/kernel/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res3a_branch2b/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.05103103816509247
      }
    }
  }
}
node {
  name: "res3a_branch2b/kernel/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "res3a_branch2b/kernel/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res3a_branch2b/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "res3a_branch2b/kernel/Initializer/random_uniform/sub"
  op: "Sub"
  input: "res3a_branch2b/kernel/Initializer/random_uniform/max"
  input: "res3a_branch2b/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res3a_branch2b/kernel"
      }
    }
  }
}
node {
  name: "res3a_branch2b/kernel/Initializer/random_uniform/mul"
  op: "Mul"
  input: "res3a_branch2b/kernel/Initializer/random_uniform/RandomUniform"
  input: "res3a_branch2b/kernel/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res3a_branch2b/kernel"
      }
    }
  }
}
node {
  name: "res3a_branch2b/kernel/Initializer/random_uniform"
  op: "Add"
  input: "res3a_branch2b/kernel/Initializer/random_uniform/mul"
  input: "res3a_branch2b/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res3a_branch2b/kernel"
      }
    }
  }
}
node {
  name: "res3a_branch2b/kernel"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res3a_branch2b/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 128
        }
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "res3a_branch2b/kernel/Assign"
  op: "Assign"
  input: "res3a_branch2b/kernel"
  input: "res3a_branch2b/kernel/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res3a_branch2b/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "res3a_branch2b/kernel/read"
  op: "Identity"
  input: "res3a_branch2b/kernel"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res3a_branch2b/kernel"
      }
    }
  }
}
node {
  name: "conv_block_stage3/res3a_branch2b/kernel/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0005000000237487257
      }
    }
  }
}
node {
  name: "conv_block_stage3/res3a_branch2b/kernel/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "res3a_branch2b/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv_block_stage3/res3a_branch2b/kernel/Regularizer/l2_regularizer"
  op: "Mul"
  input: "conv_block_stage3/res3a_branch2b/kernel/Regularizer/l2_regularizer/scale"
  input: "conv_block_stage3/res3a_branch2b/kernel/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "res3a_branch2b/bias/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res3a_branch2b/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 128
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "res3a_branch2b/bias"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res3a_branch2b/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "res3a_branch2b/bias/Assign"
  op: "Assign"
  input: "res3a_branch2b/bias"
  input: "res3a_branch2b/bias/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res3a_branch2b/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "res3a_branch2b/bias/read"
  op: "Identity"
  input: "res3a_branch2b/bias"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res3a_branch2b/bias"
      }
    }
  }
}
node {
  name: "conv_block_stage3/res3a_branch2b/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "conv_block_stage3/res3a_branch2b/Conv2D"
  op: "Conv2D"
  input: "conv_block_stage3/Relu"
  input: "res3a_branch2b/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "conv_block_stage3/res3a_branch2b/BiasAdd"
  op: "BiasAdd"
  input: "conv_block_stage3/res3a_branch2b/Conv2D"
  input: "res3a_branch2b/bias/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "bn3a_branch2b/gamma/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch2b/gamma"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 128
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "bn3a_branch2b/gamma"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch2b/gamma"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn3a_branch2b/gamma/Assign"
  op: "Assign"
  input: "bn3a_branch2b/gamma"
  input: "bn3a_branch2b/gamma/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch2b/gamma"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn3a_branch2b/gamma/read"
  op: "Identity"
  input: "bn3a_branch2b/gamma"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch2b/gamma"
      }
    }
  }
}
node {
  name: "bn3a_branch2b/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch2b/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 128
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "bn3a_branch2b/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch2b/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn3a_branch2b/beta/Assign"
  op: "Assign"
  input: "bn3a_branch2b/beta"
  input: "bn3a_branch2b/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch2b/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn3a_branch2b/beta/read"
  op: "Identity"
  input: "bn3a_branch2b/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch2b/beta"
      }
    }
  }
}
node {
  name: "bn3a_branch2b/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch2b/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 128
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "bn3a_branch2b/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch2b/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn3a_branch2b/moving_mean/Assign"
  op: "Assign"
  input: "bn3a_branch2b/moving_mean"
  input: "bn3a_branch2b/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch2b/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn3a_branch2b/moving_mean/read"
  op: "Identity"
  input: "bn3a_branch2b/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch2b/moving_mean"
      }
    }
  }
}
node {
  name: "bn3a_branch2b/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch2b/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 128
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "bn3a_branch2b/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch2b/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn3a_branch2b/moving_variance/Assign"
  op: "Assign"
  input: "bn3a_branch2b/moving_variance"
  input: "bn3a_branch2b/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch2b/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn3a_branch2b/moving_variance/read"
  op: "Identity"
  input: "bn3a_branch2b/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch2b/moving_variance"
      }
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch2b/cond/Switch"
  op: "Switch"
  input: "Placeholder_2"
  input: "Placeholder_2"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch2b/cond/switch_t"
  op: "Identity"
  input: "conv_block_stage3/bn3a_branch2b/cond/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch2b/cond/switch_f"
  op: "Identity"
  input: "conv_block_stage3/bn3a_branch2b/cond/Switch"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch2b/cond/pred_id"
  op: "Identity"
  input: "Placeholder_2"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch2b/cond/Const"
  op: "Const"
  input: "^conv_block_stage3/bn3a_branch2b/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch2b/cond/Const_1"
  op: "Const"
  input: "^conv_block_stage3/bn3a_branch2b/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch2b/cond/FusedBatchNormV3"
  op: "FusedBatchNormV3"
  input: "conv_block_stage3/bn3a_branch2b/cond/FusedBatchNormV3/Switch:1"
  input: "conv_block_stage3/bn3a_branch2b/cond/FusedBatchNormV3/Switch_1:1"
  input: "conv_block_stage3/bn3a_branch2b/cond/FusedBatchNormV3/Switch_2:1"
  input: "conv_block_stage3/bn3a_branch2b/cond/Const"
  input: "conv_block_stage3/bn3a_branch2b/cond/Const_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "U"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.0010000000474974513
    }
  }
  attr {
    key: "is_training"
    value {
      b: true
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch2b/cond/FusedBatchNormV3/Switch"
  op: "Switch"
  input: "conv_block_stage3/res3a_branch2b/BiasAdd"
  input: "conv_block_stage3/bn3a_branch2b/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_block_stage3/res3a_branch2b/BiasAdd"
      }
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch2b/cond/FusedBatchNormV3/Switch_1"
  op: "Switch"
  input: "bn3a_branch2b/gamma/read"
  input: "conv_block_stage3/bn3a_branch2b/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch2b/gamma"
      }
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch2b/cond/FusedBatchNormV3/Switch_2"
  op: "Switch"
  input: "bn3a_branch2b/beta/read"
  input: "conv_block_stage3/bn3a_branch2b/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch2b/beta"
      }
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch2b/cond/FusedBatchNormV3_1"
  op: "FusedBatchNormV3"
  input: "conv_block_stage3/bn3a_branch2b/cond/FusedBatchNormV3_1/Switch"
  input: "conv_block_stage3/bn3a_branch2b/cond/FusedBatchNormV3_1/Switch_1"
  input: "conv_block_stage3/bn3a_branch2b/cond/FusedBatchNormV3_1/Switch_2"
  input: "conv_block_stage3/bn3a_branch2b/cond/FusedBatchNormV3_1/Switch_3"
  input: "conv_block_stage3/bn3a_branch2b/cond/FusedBatchNormV3_1/Switch_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "U"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.0010000000474974513
    }
  }
  attr {
    key: "is_training"
    value {
      b: false
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch2b/cond/FusedBatchNormV3_1/Switch"
  op: "Switch"
  input: "conv_block_stage3/res3a_branch2b/BiasAdd"
  input: "conv_block_stage3/bn3a_branch2b/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_block_stage3/res3a_branch2b/BiasAdd"
      }
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch2b/cond/FusedBatchNormV3_1/Switch_1"
  op: "Switch"
  input: "bn3a_branch2b/gamma/read"
  input: "conv_block_stage3/bn3a_branch2b/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch2b/gamma"
      }
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch2b/cond/FusedBatchNormV3_1/Switch_2"
  op: "Switch"
  input: "bn3a_branch2b/beta/read"
  input: "conv_block_stage3/bn3a_branch2b/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch2b/beta"
      }
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch2b/cond/FusedBatchNormV3_1/Switch_3"
  op: "Switch"
  input: "bn3a_branch2b/moving_mean/read"
  input: "conv_block_stage3/bn3a_branch2b/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch2b/moving_mean"
      }
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch2b/cond/FusedBatchNormV3_1/Switch_4"
  op: "Switch"
  input: "bn3a_branch2b/moving_variance/read"
  input: "conv_block_stage3/bn3a_branch2b/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch2b/moving_variance"
      }
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch2b/cond/Merge"
  op: "Merge"
  input: "conv_block_stage3/bn3a_branch2b/cond/FusedBatchNormV3_1"
  input: "conv_block_stage3/bn3a_branch2b/cond/FusedBatchNormV3"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch2b/cond/Merge_1"
  op: "Merge"
  input: "conv_block_stage3/bn3a_branch2b/cond/FusedBatchNormV3_1:1"
  input: "conv_block_stage3/bn3a_branch2b/cond/FusedBatchNormV3:1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch2b/cond/Merge_2"
  op: "Merge"
  input: "conv_block_stage3/bn3a_branch2b/cond/FusedBatchNormV3_1:2"
  input: "conv_block_stage3/bn3a_branch2b/cond/FusedBatchNormV3:2"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch2b/cond_1/Switch"
  op: "Switch"
  input: "Placeholder_2"
  input: "Placeholder_2"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch2b/cond_1/switch_t"
  op: "Identity"
  input: "conv_block_stage3/bn3a_branch2b/cond_1/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch2b/cond_1/switch_f"
  op: "Identity"
  input: "conv_block_stage3/bn3a_branch2b/cond_1/Switch"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch2b/cond_1/pred_id"
  op: "Identity"
  input: "Placeholder_2"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch2b/cond_1/Const"
  op: "Const"
  input: "^conv_block_stage3/bn3a_branch2b/cond_1/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.9900000095367432
      }
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch2b/cond_1/Const_1"
  op: "Const"
  input: "^conv_block_stage3/bn3a_branch2b/cond_1/switch_f"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch2b/cond_1/Merge"
  op: "Merge"
  input: "conv_block_stage3/bn3a_branch2b/cond_1/Const_1"
  input: "conv_block_stage3/bn3a_branch2b/cond_1/Const"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch2b/AssignMovingAvg/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch2b/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch2b/AssignMovingAvg/sub"
  op: "Sub"
  input: "conv_block_stage3/bn3a_branch2b/AssignMovingAvg/sub/x"
  input: "conv_block_stage3/bn3a_branch2b/cond_1/Merge"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch2b/moving_mean"
      }
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch2b/AssignMovingAvg/sub_1"
  op: "Sub"
  input: "bn3a_branch2b/moving_mean/read"
  input: "conv_block_stage3/bn3a_branch2b/cond/Merge_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch2b/moving_mean"
      }
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch2b/AssignMovingAvg/mul"
  op: "Mul"
  input: "conv_block_stage3/bn3a_branch2b/AssignMovingAvg/sub_1"
  input: "conv_block_stage3/bn3a_branch2b/AssignMovingAvg/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch2b/moving_mean"
      }
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch2b/AssignMovingAvg"
  op: "AssignSub"
  input: "bn3a_branch2b/moving_mean"
  input: "conv_block_stage3/bn3a_branch2b/AssignMovingAvg/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch2b/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch2b/AssignMovingAvg_1/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch2b/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch2b/AssignMovingAvg_1/sub"
  op: "Sub"
  input: "conv_block_stage3/bn3a_branch2b/AssignMovingAvg_1/sub/x"
  input: "conv_block_stage3/bn3a_branch2b/cond_1/Merge"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch2b/moving_variance"
      }
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch2b/AssignMovingAvg_1/sub_1"
  op: "Sub"
  input: "bn3a_branch2b/moving_variance/read"
  input: "conv_block_stage3/bn3a_branch2b/cond/Merge_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch2b/moving_variance"
      }
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch2b/AssignMovingAvg_1/mul"
  op: "Mul"
  input: "conv_block_stage3/bn3a_branch2b/AssignMovingAvg_1/sub_1"
  input: "conv_block_stage3/bn3a_branch2b/AssignMovingAvg_1/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch2b/moving_variance"
      }
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch2b/AssignMovingAvg_1"
  op: "AssignSub"
  input: "bn3a_branch2b/moving_variance"
  input: "conv_block_stage3/bn3a_branch2b/AssignMovingAvg_1/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch2b/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "res3a_branch1/kernel/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res3a_branch1/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000@\000\000\000\200\000\000\000"
      }
    }
  }
}
node {
  name: "res3a_branch1/kernel/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res3a_branch1/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.1767766922712326
      }
    }
  }
}
node {
  name: "res3a_branch1/kernel/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res3a_branch1/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.1767766922712326
      }
    }
  }
}
node {
  name: "res3a_branch1/kernel/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "res3a_branch1/kernel/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res3a_branch1/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "res3a_branch1/kernel/Initializer/random_uniform/sub"
  op: "Sub"
  input: "res3a_branch1/kernel/Initializer/random_uniform/max"
  input: "res3a_branch1/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res3a_branch1/kernel"
      }
    }
  }
}
node {
  name: "res3a_branch1/kernel/Initializer/random_uniform/mul"
  op: "Mul"
  input: "res3a_branch1/kernel/Initializer/random_uniform/RandomUniform"
  input: "res3a_branch1/kernel/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res3a_branch1/kernel"
      }
    }
  }
}
node {
  name: "res3a_branch1/kernel/Initializer/random_uniform"
  op: "Add"
  input: "res3a_branch1/kernel/Initializer/random_uniform/mul"
  input: "res3a_branch1/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res3a_branch1/kernel"
      }
    }
  }
}
node {
  name: "res3a_branch1/kernel"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res3a_branch1/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
        dim {
          size: 1
        }
        dim {
          size: 64
        }
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "res3a_branch1/kernel/Assign"
  op: "Assign"
  input: "res3a_branch1/kernel"
  input: "res3a_branch1/kernel/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res3a_branch1/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "res3a_branch1/kernel/read"
  op: "Identity"
  input: "res3a_branch1/kernel"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res3a_branch1/kernel"
      }
    }
  }
}
node {
  name: "conv_block_stage3/res3a_branch1/kernel/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0005000000237487257
      }
    }
  }
}
node {
  name: "conv_block_stage3/res3a_branch1/kernel/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "res3a_branch1/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv_block_stage3/res3a_branch1/kernel/Regularizer/l2_regularizer"
  op: "Mul"
  input: "conv_block_stage3/res3a_branch1/kernel/Regularizer/l2_regularizer/scale"
  input: "conv_block_stage3/res3a_branch1/kernel/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "res3a_branch1/bias/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res3a_branch1/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 128
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "res3a_branch1/bias"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res3a_branch1/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "res3a_branch1/bias/Assign"
  op: "Assign"
  input: "res3a_branch1/bias"
  input: "res3a_branch1/bias/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res3a_branch1/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "res3a_branch1/bias/read"
  op: "Identity"
  input: "res3a_branch1/bias"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res3a_branch1/bias"
      }
    }
  }
}
node {
  name: "conv_block_stage3/res3a_branch1/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "conv_block_stage3/res3a_branch1/Conv2D"
  op: "Conv2D"
  input: "id_block_stage2_1/Relu_1"
  input: "res3a_branch1/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "VALID"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "conv_block_stage3/res3a_branch1/BiasAdd"
  op: "BiasAdd"
  input: "conv_block_stage3/res3a_branch1/Conv2D"
  input: "res3a_branch1/bias/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "bn3a_branch1/gamma/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch1/gamma"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 128
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "bn3a_branch1/gamma"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch1/gamma"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn3a_branch1/gamma/Assign"
  op: "Assign"
  input: "bn3a_branch1/gamma"
  input: "bn3a_branch1/gamma/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch1/gamma"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn3a_branch1/gamma/read"
  op: "Identity"
  input: "bn3a_branch1/gamma"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch1/gamma"
      }
    }
  }
}
node {
  name: "bn3a_branch1/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch1/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 128
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "bn3a_branch1/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch1/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn3a_branch1/beta/Assign"
  op: "Assign"
  input: "bn3a_branch1/beta"
  input: "bn3a_branch1/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch1/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn3a_branch1/beta/read"
  op: "Identity"
  input: "bn3a_branch1/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch1/beta"
      }
    }
  }
}
node {
  name: "bn3a_branch1/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch1/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 128
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "bn3a_branch1/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch1/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn3a_branch1/moving_mean/Assign"
  op: "Assign"
  input: "bn3a_branch1/moving_mean"
  input: "bn3a_branch1/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch1/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn3a_branch1/moving_mean/read"
  op: "Identity"
  input: "bn3a_branch1/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch1/moving_mean"
      }
    }
  }
}
node {
  name: "bn3a_branch1/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch1/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 128
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "bn3a_branch1/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch1/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn3a_branch1/moving_variance/Assign"
  op: "Assign"
  input: "bn3a_branch1/moving_variance"
  input: "bn3a_branch1/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch1/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn3a_branch1/moving_variance/read"
  op: "Identity"
  input: "bn3a_branch1/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch1/moving_variance"
      }
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch1/cond/Switch"
  op: "Switch"
  input: "Placeholder_2"
  input: "Placeholder_2"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch1/cond/switch_t"
  op: "Identity"
  input: "conv_block_stage3/bn3a_branch1/cond/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch1/cond/switch_f"
  op: "Identity"
  input: "conv_block_stage3/bn3a_branch1/cond/Switch"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch1/cond/pred_id"
  op: "Identity"
  input: "Placeholder_2"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch1/cond/Const"
  op: "Const"
  input: "^conv_block_stage3/bn3a_branch1/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch1/cond/Const_1"
  op: "Const"
  input: "^conv_block_stage3/bn3a_branch1/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch1/cond/FusedBatchNormV3"
  op: "FusedBatchNormV3"
  input: "conv_block_stage3/bn3a_branch1/cond/FusedBatchNormV3/Switch:1"
  input: "conv_block_stage3/bn3a_branch1/cond/FusedBatchNormV3/Switch_1:1"
  input: "conv_block_stage3/bn3a_branch1/cond/FusedBatchNormV3/Switch_2:1"
  input: "conv_block_stage3/bn3a_branch1/cond/Const"
  input: "conv_block_stage3/bn3a_branch1/cond/Const_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "U"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.0010000000474974513
    }
  }
  attr {
    key: "is_training"
    value {
      b: true
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch1/cond/FusedBatchNormV3/Switch"
  op: "Switch"
  input: "conv_block_stage3/res3a_branch1/BiasAdd"
  input: "conv_block_stage3/bn3a_branch1/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_block_stage3/res3a_branch1/BiasAdd"
      }
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch1/cond/FusedBatchNormV3/Switch_1"
  op: "Switch"
  input: "bn3a_branch1/gamma/read"
  input: "conv_block_stage3/bn3a_branch1/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch1/gamma"
      }
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch1/cond/FusedBatchNormV3/Switch_2"
  op: "Switch"
  input: "bn3a_branch1/beta/read"
  input: "conv_block_stage3/bn3a_branch1/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch1/beta"
      }
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch1/cond/FusedBatchNormV3_1"
  op: "FusedBatchNormV3"
  input: "conv_block_stage3/bn3a_branch1/cond/FusedBatchNormV3_1/Switch"
  input: "conv_block_stage3/bn3a_branch1/cond/FusedBatchNormV3_1/Switch_1"
  input: "conv_block_stage3/bn3a_branch1/cond/FusedBatchNormV3_1/Switch_2"
  input: "conv_block_stage3/bn3a_branch1/cond/FusedBatchNormV3_1/Switch_3"
  input: "conv_block_stage3/bn3a_branch1/cond/FusedBatchNormV3_1/Switch_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "U"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.0010000000474974513
    }
  }
  attr {
    key: "is_training"
    value {
      b: false
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch1/cond/FusedBatchNormV3_1/Switch"
  op: "Switch"
  input: "conv_block_stage3/res3a_branch1/BiasAdd"
  input: "conv_block_stage3/bn3a_branch1/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_block_stage3/res3a_branch1/BiasAdd"
      }
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch1/cond/FusedBatchNormV3_1/Switch_1"
  op: "Switch"
  input: "bn3a_branch1/gamma/read"
  input: "conv_block_stage3/bn3a_branch1/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch1/gamma"
      }
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch1/cond/FusedBatchNormV3_1/Switch_2"
  op: "Switch"
  input: "bn3a_branch1/beta/read"
  input: "conv_block_stage3/bn3a_branch1/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch1/beta"
      }
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch1/cond/FusedBatchNormV3_1/Switch_3"
  op: "Switch"
  input: "bn3a_branch1/moving_mean/read"
  input: "conv_block_stage3/bn3a_branch1/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch1/moving_mean"
      }
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch1/cond/FusedBatchNormV3_1/Switch_4"
  op: "Switch"
  input: "bn3a_branch1/moving_variance/read"
  input: "conv_block_stage3/bn3a_branch1/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch1/moving_variance"
      }
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch1/cond/Merge"
  op: "Merge"
  input: "conv_block_stage3/bn3a_branch1/cond/FusedBatchNormV3_1"
  input: "conv_block_stage3/bn3a_branch1/cond/FusedBatchNormV3"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch1/cond/Merge_1"
  op: "Merge"
  input: "conv_block_stage3/bn3a_branch1/cond/FusedBatchNormV3_1:1"
  input: "conv_block_stage3/bn3a_branch1/cond/FusedBatchNormV3:1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch1/cond/Merge_2"
  op: "Merge"
  input: "conv_block_stage3/bn3a_branch1/cond/FusedBatchNormV3_1:2"
  input: "conv_block_stage3/bn3a_branch1/cond/FusedBatchNormV3:2"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch1/cond_1/Switch"
  op: "Switch"
  input: "Placeholder_2"
  input: "Placeholder_2"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch1/cond_1/switch_t"
  op: "Identity"
  input: "conv_block_stage3/bn3a_branch1/cond_1/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch1/cond_1/switch_f"
  op: "Identity"
  input: "conv_block_stage3/bn3a_branch1/cond_1/Switch"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch1/cond_1/pred_id"
  op: "Identity"
  input: "Placeholder_2"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch1/cond_1/Const"
  op: "Const"
  input: "^conv_block_stage3/bn3a_branch1/cond_1/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.9900000095367432
      }
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch1/cond_1/Const_1"
  op: "Const"
  input: "^conv_block_stage3/bn3a_branch1/cond_1/switch_f"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch1/cond_1/Merge"
  op: "Merge"
  input: "conv_block_stage3/bn3a_branch1/cond_1/Const_1"
  input: "conv_block_stage3/bn3a_branch1/cond_1/Const"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch1/AssignMovingAvg/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch1/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch1/AssignMovingAvg/sub"
  op: "Sub"
  input: "conv_block_stage3/bn3a_branch1/AssignMovingAvg/sub/x"
  input: "conv_block_stage3/bn3a_branch1/cond_1/Merge"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch1/moving_mean"
      }
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch1/AssignMovingAvg/sub_1"
  op: "Sub"
  input: "bn3a_branch1/moving_mean/read"
  input: "conv_block_stage3/bn3a_branch1/cond/Merge_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch1/moving_mean"
      }
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch1/AssignMovingAvg/mul"
  op: "Mul"
  input: "conv_block_stage3/bn3a_branch1/AssignMovingAvg/sub_1"
  input: "conv_block_stage3/bn3a_branch1/AssignMovingAvg/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch1/moving_mean"
      }
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch1/AssignMovingAvg"
  op: "AssignSub"
  input: "bn3a_branch1/moving_mean"
  input: "conv_block_stage3/bn3a_branch1/AssignMovingAvg/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch1/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch1/AssignMovingAvg_1/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch1/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch1/AssignMovingAvg_1/sub"
  op: "Sub"
  input: "conv_block_stage3/bn3a_branch1/AssignMovingAvg_1/sub/x"
  input: "conv_block_stage3/bn3a_branch1/cond_1/Merge"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch1/moving_variance"
      }
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch1/AssignMovingAvg_1/sub_1"
  op: "Sub"
  input: "bn3a_branch1/moving_variance/read"
  input: "conv_block_stage3/bn3a_branch1/cond/Merge_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch1/moving_variance"
      }
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch1/AssignMovingAvg_1/mul"
  op: "Mul"
  input: "conv_block_stage3/bn3a_branch1/AssignMovingAvg_1/sub_1"
  input: "conv_block_stage3/bn3a_branch1/AssignMovingAvg_1/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch1/moving_variance"
      }
    }
  }
}
node {
  name: "conv_block_stage3/bn3a_branch1/AssignMovingAvg_1"
  op: "AssignSub"
  input: "bn3a_branch1/moving_variance"
  input: "conv_block_stage3/bn3a_branch1/AssignMovingAvg_1/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch1/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "conv_block_stage3/Add"
  op: "Add"
  input: "conv_block_stage3/bn3a_branch1/cond/Merge"
  input: "conv_block_stage3/bn3a_branch2b/cond/Merge"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv_block_stage3/Relu_1"
  op: "Relu"
  input: "conv_block_stage3/Add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "res3b_branch2b/kernel/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res3b_branch2b/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\200\000\000\000\200\000\000\000"
      }
    }
  }
}
node {
  name: "res3b_branch2b/kernel/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res3b_branch2b/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.05103103816509247
      }
    }
  }
}
node {
  name: "res3b_branch2b/kernel/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res3b_branch2b/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.05103103816509247
      }
    }
  }
}
node {
  name: "res3b_branch2b/kernel/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "res3b_branch2b/kernel/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res3b_branch2b/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "res3b_branch2b/kernel/Initializer/random_uniform/sub"
  op: "Sub"
  input: "res3b_branch2b/kernel/Initializer/random_uniform/max"
  input: "res3b_branch2b/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res3b_branch2b/kernel"
      }
    }
  }
}
node {
  name: "res3b_branch2b/kernel/Initializer/random_uniform/mul"
  op: "Mul"
  input: "res3b_branch2b/kernel/Initializer/random_uniform/RandomUniform"
  input: "res3b_branch2b/kernel/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res3b_branch2b/kernel"
      }
    }
  }
}
node {
  name: "res3b_branch2b/kernel/Initializer/random_uniform"
  op: "Add"
  input: "res3b_branch2b/kernel/Initializer/random_uniform/mul"
  input: "res3b_branch2b/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res3b_branch2b/kernel"
      }
    }
  }
}
node {
  name: "res3b_branch2b/kernel"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res3b_branch2b/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 128
        }
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "res3b_branch2b/kernel/Assign"
  op: "Assign"
  input: "res3b_branch2b/kernel"
  input: "res3b_branch2b/kernel/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res3b_branch2b/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "res3b_branch2b/kernel/read"
  op: "Identity"
  input: "res3b_branch2b/kernel"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res3b_branch2b/kernel"
      }
    }
  }
}
node {
  name: "id_block_stage3/res3b_branch2b/kernel/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0005000000237487257
      }
    }
  }
}
node {
  name: "id_block_stage3/res3b_branch2b/kernel/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "res3b_branch2b/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "id_block_stage3/res3b_branch2b/kernel/Regularizer/l2_regularizer"
  op: "Mul"
  input: "id_block_stage3/res3b_branch2b/kernel/Regularizer/l2_regularizer/scale"
  input: "id_block_stage3/res3b_branch2b/kernel/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "res3b_branch2b/bias/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res3b_branch2b/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 128
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "res3b_branch2b/bias"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res3b_branch2b/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "res3b_branch2b/bias/Assign"
  op: "Assign"
  input: "res3b_branch2b/bias"
  input: "res3b_branch2b/bias/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res3b_branch2b/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "res3b_branch2b/bias/read"
  op: "Identity"
  input: "res3b_branch2b/bias"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res3b_branch2b/bias"
      }
    }
  }
}
node {
  name: "id_block_stage3/res3b_branch2b/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "id_block_stage3/res3b_branch2b/Conv2D"
  op: "Conv2D"
  input: "conv_block_stage3/Relu_1"
  input: "res3b_branch2b/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "id_block_stage3/res3b_branch2b/BiasAdd"
  op: "BiasAdd"
  input: "id_block_stage3/res3b_branch2b/Conv2D"
  input: "res3b_branch2b/bias/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "bn3b_branch2b/gamma/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3b_branch2b/gamma"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 128
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "bn3b_branch2b/gamma"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3b_branch2b/gamma"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn3b_branch2b/gamma/Assign"
  op: "Assign"
  input: "bn3b_branch2b/gamma"
  input: "bn3b_branch2b/gamma/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3b_branch2b/gamma"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn3b_branch2b/gamma/read"
  op: "Identity"
  input: "bn3b_branch2b/gamma"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3b_branch2b/gamma"
      }
    }
  }
}
node {
  name: "bn3b_branch2b/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3b_branch2b/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 128
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "bn3b_branch2b/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3b_branch2b/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn3b_branch2b/beta/Assign"
  op: "Assign"
  input: "bn3b_branch2b/beta"
  input: "bn3b_branch2b/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3b_branch2b/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn3b_branch2b/beta/read"
  op: "Identity"
  input: "bn3b_branch2b/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3b_branch2b/beta"
      }
    }
  }
}
node {
  name: "bn3b_branch2b/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3b_branch2b/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 128
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "bn3b_branch2b/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3b_branch2b/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn3b_branch2b/moving_mean/Assign"
  op: "Assign"
  input: "bn3b_branch2b/moving_mean"
  input: "bn3b_branch2b/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3b_branch2b/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn3b_branch2b/moving_mean/read"
  op: "Identity"
  input: "bn3b_branch2b/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3b_branch2b/moving_mean"
      }
    }
  }
}
node {
  name: "bn3b_branch2b/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3b_branch2b/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 128
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "bn3b_branch2b/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3b_branch2b/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn3b_branch2b/moving_variance/Assign"
  op: "Assign"
  input: "bn3b_branch2b/moving_variance"
  input: "bn3b_branch2b/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3b_branch2b/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn3b_branch2b/moving_variance/read"
  op: "Identity"
  input: "bn3b_branch2b/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3b_branch2b/moving_variance"
      }
    }
  }
}
node {
  name: "id_block_stage3/bn3b_branch2b/cond/Switch"
  op: "Switch"
  input: "Placeholder_2"
  input: "Placeholder_2"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "id_block_stage3/bn3b_branch2b/cond/switch_t"
  op: "Identity"
  input: "id_block_stage3/bn3b_branch2b/cond/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "id_block_stage3/bn3b_branch2b/cond/switch_f"
  op: "Identity"
  input: "id_block_stage3/bn3b_branch2b/cond/Switch"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "id_block_stage3/bn3b_branch2b/cond/pred_id"
  op: "Identity"
  input: "Placeholder_2"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "id_block_stage3/bn3b_branch2b/cond/Const"
  op: "Const"
  input: "^id_block_stage3/bn3b_branch2b/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "id_block_stage3/bn3b_branch2b/cond/Const_1"
  op: "Const"
  input: "^id_block_stage3/bn3b_branch2b/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "id_block_stage3/bn3b_branch2b/cond/FusedBatchNormV3"
  op: "FusedBatchNormV3"
  input: "id_block_stage3/bn3b_branch2b/cond/FusedBatchNormV3/Switch:1"
  input: "id_block_stage3/bn3b_branch2b/cond/FusedBatchNormV3/Switch_1:1"
  input: "id_block_stage3/bn3b_branch2b/cond/FusedBatchNormV3/Switch_2:1"
  input: "id_block_stage3/bn3b_branch2b/cond/Const"
  input: "id_block_stage3/bn3b_branch2b/cond/Const_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "U"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.0010000000474974513
    }
  }
  attr {
    key: "is_training"
    value {
      b: true
    }
  }
}
node {
  name: "id_block_stage3/bn3b_branch2b/cond/FusedBatchNormV3/Switch"
  op: "Switch"
  input: "id_block_stage3/res3b_branch2b/BiasAdd"
  input: "id_block_stage3/bn3b_branch2b/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@id_block_stage3/res3b_branch2b/BiasAdd"
      }
    }
  }
}
node {
  name: "id_block_stage3/bn3b_branch2b/cond/FusedBatchNormV3/Switch_1"
  op: "Switch"
  input: "bn3b_branch2b/gamma/read"
  input: "id_block_stage3/bn3b_branch2b/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3b_branch2b/gamma"
      }
    }
  }
}
node {
  name: "id_block_stage3/bn3b_branch2b/cond/FusedBatchNormV3/Switch_2"
  op: "Switch"
  input: "bn3b_branch2b/beta/read"
  input: "id_block_stage3/bn3b_branch2b/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3b_branch2b/beta"
      }
    }
  }
}
node {
  name: "id_block_stage3/bn3b_branch2b/cond/FusedBatchNormV3_1"
  op: "FusedBatchNormV3"
  input: "id_block_stage3/bn3b_branch2b/cond/FusedBatchNormV3_1/Switch"
  input: "id_block_stage3/bn3b_branch2b/cond/FusedBatchNormV3_1/Switch_1"
  input: "id_block_stage3/bn3b_branch2b/cond/FusedBatchNormV3_1/Switch_2"
  input: "id_block_stage3/bn3b_branch2b/cond/FusedBatchNormV3_1/Switch_3"
  input: "id_block_stage3/bn3b_branch2b/cond/FusedBatchNormV3_1/Switch_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "U"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.0010000000474974513
    }
  }
  attr {
    key: "is_training"
    value {
      b: false
    }
  }
}
node {
  name: "id_block_stage3/bn3b_branch2b/cond/FusedBatchNormV3_1/Switch"
  op: "Switch"
  input: "id_block_stage3/res3b_branch2b/BiasAdd"
  input: "id_block_stage3/bn3b_branch2b/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@id_block_stage3/res3b_branch2b/BiasAdd"
      }
    }
  }
}
node {
  name: "id_block_stage3/bn3b_branch2b/cond/FusedBatchNormV3_1/Switch_1"
  op: "Switch"
  input: "bn3b_branch2b/gamma/read"
  input: "id_block_stage3/bn3b_branch2b/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3b_branch2b/gamma"
      }
    }
  }
}
node {
  name: "id_block_stage3/bn3b_branch2b/cond/FusedBatchNormV3_1/Switch_2"
  op: "Switch"
  input: "bn3b_branch2b/beta/read"
  input: "id_block_stage3/bn3b_branch2b/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3b_branch2b/beta"
      }
    }
  }
}
node {
  name: "id_block_stage3/bn3b_branch2b/cond/FusedBatchNormV3_1/Switch_3"
  op: "Switch"
  input: "bn3b_branch2b/moving_mean/read"
  input: "id_block_stage3/bn3b_branch2b/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3b_branch2b/moving_mean"
      }
    }
  }
}
node {
  name: "id_block_stage3/bn3b_branch2b/cond/FusedBatchNormV3_1/Switch_4"
  op: "Switch"
  input: "bn3b_branch2b/moving_variance/read"
  input: "id_block_stage3/bn3b_branch2b/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3b_branch2b/moving_variance"
      }
    }
  }
}
node {
  name: "id_block_stage3/bn3b_branch2b/cond/Merge"
  op: "Merge"
  input: "id_block_stage3/bn3b_branch2b/cond/FusedBatchNormV3_1"
  input: "id_block_stage3/bn3b_branch2b/cond/FusedBatchNormV3"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "id_block_stage3/bn3b_branch2b/cond/Merge_1"
  op: "Merge"
  input: "id_block_stage3/bn3b_branch2b/cond/FusedBatchNormV3_1:1"
  input: "id_block_stage3/bn3b_branch2b/cond/FusedBatchNormV3:1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "id_block_stage3/bn3b_branch2b/cond/Merge_2"
  op: "Merge"
  input: "id_block_stage3/bn3b_branch2b/cond/FusedBatchNormV3_1:2"
  input: "id_block_stage3/bn3b_branch2b/cond/FusedBatchNormV3:2"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "id_block_stage3/bn3b_branch2b/cond_1/Switch"
  op: "Switch"
  input: "Placeholder_2"
  input: "Placeholder_2"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "id_block_stage3/bn3b_branch2b/cond_1/switch_t"
  op: "Identity"
  input: "id_block_stage3/bn3b_branch2b/cond_1/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "id_block_stage3/bn3b_branch2b/cond_1/switch_f"
  op: "Identity"
  input: "id_block_stage3/bn3b_branch2b/cond_1/Switch"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "id_block_stage3/bn3b_branch2b/cond_1/pred_id"
  op: "Identity"
  input: "Placeholder_2"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "id_block_stage3/bn3b_branch2b/cond_1/Const"
  op: "Const"
  input: "^id_block_stage3/bn3b_branch2b/cond_1/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.9900000095367432
      }
    }
  }
}
node {
  name: "id_block_stage3/bn3b_branch2b/cond_1/Const_1"
  op: "Const"
  input: "^id_block_stage3/bn3b_branch2b/cond_1/switch_f"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "id_block_stage3/bn3b_branch2b/cond_1/Merge"
  op: "Merge"
  input: "id_block_stage3/bn3b_branch2b/cond_1/Const_1"
  input: "id_block_stage3/bn3b_branch2b/cond_1/Const"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "id_block_stage3/bn3b_branch2b/AssignMovingAvg/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3b_branch2b/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "id_block_stage3/bn3b_branch2b/AssignMovingAvg/sub"
  op: "Sub"
  input: "id_block_stage3/bn3b_branch2b/AssignMovingAvg/sub/x"
  input: "id_block_stage3/bn3b_branch2b/cond_1/Merge"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3b_branch2b/moving_mean"
      }
    }
  }
}
node {
  name: "id_block_stage3/bn3b_branch2b/AssignMovingAvg/sub_1"
  op: "Sub"
  input: "bn3b_branch2b/moving_mean/read"
  input: "id_block_stage3/bn3b_branch2b/cond/Merge_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3b_branch2b/moving_mean"
      }
    }
  }
}
node {
  name: "id_block_stage3/bn3b_branch2b/AssignMovingAvg/mul"
  op: "Mul"
  input: "id_block_stage3/bn3b_branch2b/AssignMovingAvg/sub_1"
  input: "id_block_stage3/bn3b_branch2b/AssignMovingAvg/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3b_branch2b/moving_mean"
      }
    }
  }
}
node {
  name: "id_block_stage3/bn3b_branch2b/AssignMovingAvg"
  op: "AssignSub"
  input: "bn3b_branch2b/moving_mean"
  input: "id_block_stage3/bn3b_branch2b/AssignMovingAvg/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3b_branch2b/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "id_block_stage3/bn3b_branch2b/AssignMovingAvg_1/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3b_branch2b/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "id_block_stage3/bn3b_branch2b/AssignMovingAvg_1/sub"
  op: "Sub"
  input: "id_block_stage3/bn3b_branch2b/AssignMovingAvg_1/sub/x"
  input: "id_block_stage3/bn3b_branch2b/cond_1/Merge"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3b_branch2b/moving_variance"
      }
    }
  }
}
node {
  name: "id_block_stage3/bn3b_branch2b/AssignMovingAvg_1/sub_1"
  op: "Sub"
  input: "bn3b_branch2b/moving_variance/read"
  input: "id_block_stage3/bn3b_branch2b/cond/Merge_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3b_branch2b/moving_variance"
      }
    }
  }
}
node {
  name: "id_block_stage3/bn3b_branch2b/AssignMovingAvg_1/mul"
  op: "Mul"
  input: "id_block_stage3/bn3b_branch2b/AssignMovingAvg_1/sub_1"
  input: "id_block_stage3/bn3b_branch2b/AssignMovingAvg_1/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3b_branch2b/moving_variance"
      }
    }
  }
}
node {
  name: "id_block_stage3/bn3b_branch2b/AssignMovingAvg_1"
  op: "AssignSub"
  input: "bn3b_branch2b/moving_variance"
  input: "id_block_stage3/bn3b_branch2b/AssignMovingAvg_1/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3b_branch2b/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "id_block_stage3/Relu"
  op: "Relu"
  input: "id_block_stage3/bn3b_branch2b/cond/Merge"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "res3b_branch2c/kernel/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res3b_branch2c/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\200\000\000\000\200\000\000\000"
      }
    }
  }
}
node {
  name: "res3b_branch2c/kernel/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res3b_branch2c/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.05103103816509247
      }
    }
  }
}
node {
  name: "res3b_branch2c/kernel/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res3b_branch2c/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.05103103816509247
      }
    }
  }
}
node {
  name: "res3b_branch2c/kernel/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "res3b_branch2c/kernel/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res3b_branch2c/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "res3b_branch2c/kernel/Initializer/random_uniform/sub"
  op: "Sub"
  input: "res3b_branch2c/kernel/Initializer/random_uniform/max"
  input: "res3b_branch2c/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res3b_branch2c/kernel"
      }
    }
  }
}
node {
  name: "res3b_branch2c/kernel/Initializer/random_uniform/mul"
  op: "Mul"
  input: "res3b_branch2c/kernel/Initializer/random_uniform/RandomUniform"
  input: "res3b_branch2c/kernel/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res3b_branch2c/kernel"
      }
    }
  }
}
node {
  name: "res3b_branch2c/kernel/Initializer/random_uniform"
  op: "Add"
  input: "res3b_branch2c/kernel/Initializer/random_uniform/mul"
  input: "res3b_branch2c/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res3b_branch2c/kernel"
      }
    }
  }
}
node {
  name: "res3b_branch2c/kernel"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res3b_branch2c/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 128
        }
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "res3b_branch2c/kernel/Assign"
  op: "Assign"
  input: "res3b_branch2c/kernel"
  input: "res3b_branch2c/kernel/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res3b_branch2c/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "res3b_branch2c/kernel/read"
  op: "Identity"
  input: "res3b_branch2c/kernel"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res3b_branch2c/kernel"
      }
    }
  }
}
node {
  name: "id_block_stage3/res3b_branch2c/kernel/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0005000000237487257
      }
    }
  }
}
node {
  name: "id_block_stage3/res3b_branch2c/kernel/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "res3b_branch2c/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "id_block_stage3/res3b_branch2c/kernel/Regularizer/l2_regularizer"
  op: "Mul"
  input: "id_block_stage3/res3b_branch2c/kernel/Regularizer/l2_regularizer/scale"
  input: "id_block_stage3/res3b_branch2c/kernel/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "res3b_branch2c/bias/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res3b_branch2c/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 128
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "res3b_branch2c/bias"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res3b_branch2c/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "res3b_branch2c/bias/Assign"
  op: "Assign"
  input: "res3b_branch2c/bias"
  input: "res3b_branch2c/bias/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res3b_branch2c/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "res3b_branch2c/bias/read"
  op: "Identity"
  input: "res3b_branch2c/bias"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res3b_branch2c/bias"
      }
    }
  }
}
node {
  name: "id_block_stage3/res3b_branch2c/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "id_block_stage3/res3b_branch2c/Conv2D"
  op: "Conv2D"
  input: "id_block_stage3/Relu"
  input: "res3b_branch2c/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "id_block_stage3/res3b_branch2c/BiasAdd"
  op: "BiasAdd"
  input: "id_block_stage3/res3b_branch2c/Conv2D"
  input: "res3b_branch2c/bias/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "bn3b_branch2c/gamma/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3b_branch2c/gamma"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 128
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "bn3b_branch2c/gamma"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3b_branch2c/gamma"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn3b_branch2c/gamma/Assign"
  op: "Assign"
  input: "bn3b_branch2c/gamma"
  input: "bn3b_branch2c/gamma/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3b_branch2c/gamma"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn3b_branch2c/gamma/read"
  op: "Identity"
  input: "bn3b_branch2c/gamma"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3b_branch2c/gamma"
      }
    }
  }
}
node {
  name: "bn3b_branch2c/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3b_branch2c/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 128
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "bn3b_branch2c/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3b_branch2c/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn3b_branch2c/beta/Assign"
  op: "Assign"
  input: "bn3b_branch2c/beta"
  input: "bn3b_branch2c/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3b_branch2c/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn3b_branch2c/beta/read"
  op: "Identity"
  input: "bn3b_branch2c/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3b_branch2c/beta"
      }
    }
  }
}
node {
  name: "bn3b_branch2c/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3b_branch2c/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 128
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "bn3b_branch2c/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3b_branch2c/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn3b_branch2c/moving_mean/Assign"
  op: "Assign"
  input: "bn3b_branch2c/moving_mean"
  input: "bn3b_branch2c/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3b_branch2c/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn3b_branch2c/moving_mean/read"
  op: "Identity"
  input: "bn3b_branch2c/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3b_branch2c/moving_mean"
      }
    }
  }
}
node {
  name: "bn3b_branch2c/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3b_branch2c/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 128
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "bn3b_branch2c/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3b_branch2c/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn3b_branch2c/moving_variance/Assign"
  op: "Assign"
  input: "bn3b_branch2c/moving_variance"
  input: "bn3b_branch2c/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3b_branch2c/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn3b_branch2c/moving_variance/read"
  op: "Identity"
  input: "bn3b_branch2c/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3b_branch2c/moving_variance"
      }
    }
  }
}
node {
  name: "id_block_stage3/bn3b_branch2c/cond/Switch"
  op: "Switch"
  input: "Placeholder_2"
  input: "Placeholder_2"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "id_block_stage3/bn3b_branch2c/cond/switch_t"
  op: "Identity"
  input: "id_block_stage3/bn3b_branch2c/cond/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "id_block_stage3/bn3b_branch2c/cond/switch_f"
  op: "Identity"
  input: "id_block_stage3/bn3b_branch2c/cond/Switch"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "id_block_stage3/bn3b_branch2c/cond/pred_id"
  op: "Identity"
  input: "Placeholder_2"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "id_block_stage3/bn3b_branch2c/cond/Const"
  op: "Const"
  input: "^id_block_stage3/bn3b_branch2c/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "id_block_stage3/bn3b_branch2c/cond/Const_1"
  op: "Const"
  input: "^id_block_stage3/bn3b_branch2c/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "id_block_stage3/bn3b_branch2c/cond/FusedBatchNormV3"
  op: "FusedBatchNormV3"
  input: "id_block_stage3/bn3b_branch2c/cond/FusedBatchNormV3/Switch:1"
  input: "id_block_stage3/bn3b_branch2c/cond/FusedBatchNormV3/Switch_1:1"
  input: "id_block_stage3/bn3b_branch2c/cond/FusedBatchNormV3/Switch_2:1"
  input: "id_block_stage3/bn3b_branch2c/cond/Const"
  input: "id_block_stage3/bn3b_branch2c/cond/Const_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "U"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.0010000000474974513
    }
  }
  attr {
    key: "is_training"
    value {
      b: true
    }
  }
}
node {
  name: "id_block_stage3/bn3b_branch2c/cond/FusedBatchNormV3/Switch"
  op: "Switch"
  input: "id_block_stage3/res3b_branch2c/BiasAdd"
  input: "id_block_stage3/bn3b_branch2c/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@id_block_stage3/res3b_branch2c/BiasAdd"
      }
    }
  }
}
node {
  name: "id_block_stage3/bn3b_branch2c/cond/FusedBatchNormV3/Switch_1"
  op: "Switch"
  input: "bn3b_branch2c/gamma/read"
  input: "id_block_stage3/bn3b_branch2c/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3b_branch2c/gamma"
      }
    }
  }
}
node {
  name: "id_block_stage3/bn3b_branch2c/cond/FusedBatchNormV3/Switch_2"
  op: "Switch"
  input: "bn3b_branch2c/beta/read"
  input: "id_block_stage3/bn3b_branch2c/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3b_branch2c/beta"
      }
    }
  }
}
node {
  name: "id_block_stage3/bn3b_branch2c/cond/FusedBatchNormV3_1"
  op: "FusedBatchNormV3"
  input: "id_block_stage3/bn3b_branch2c/cond/FusedBatchNormV3_1/Switch"
  input: "id_block_stage3/bn3b_branch2c/cond/FusedBatchNormV3_1/Switch_1"
  input: "id_block_stage3/bn3b_branch2c/cond/FusedBatchNormV3_1/Switch_2"
  input: "id_block_stage3/bn3b_branch2c/cond/FusedBatchNormV3_1/Switch_3"
  input: "id_block_stage3/bn3b_branch2c/cond/FusedBatchNormV3_1/Switch_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "U"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.0010000000474974513
    }
  }
  attr {
    key: "is_training"
    value {
      b: false
    }
  }
}
node {
  name: "id_block_stage3/bn3b_branch2c/cond/FusedBatchNormV3_1/Switch"
  op: "Switch"
  input: "id_block_stage3/res3b_branch2c/BiasAdd"
  input: "id_block_stage3/bn3b_branch2c/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@id_block_stage3/res3b_branch2c/BiasAdd"
      }
    }
  }
}
node {
  name: "id_block_stage3/bn3b_branch2c/cond/FusedBatchNormV3_1/Switch_1"
  op: "Switch"
  input: "bn3b_branch2c/gamma/read"
  input: "id_block_stage3/bn3b_branch2c/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3b_branch2c/gamma"
      }
    }
  }
}
node {
  name: "id_block_stage3/bn3b_branch2c/cond/FusedBatchNormV3_1/Switch_2"
  op: "Switch"
  input: "bn3b_branch2c/beta/read"
  input: "id_block_stage3/bn3b_branch2c/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3b_branch2c/beta"
      }
    }
  }
}
node {
  name: "id_block_stage3/bn3b_branch2c/cond/FusedBatchNormV3_1/Switch_3"
  op: "Switch"
  input: "bn3b_branch2c/moving_mean/read"
  input: "id_block_stage3/bn3b_branch2c/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3b_branch2c/moving_mean"
      }
    }
  }
}
node {
  name: "id_block_stage3/bn3b_branch2c/cond/FusedBatchNormV3_1/Switch_4"
  op: "Switch"
  input: "bn3b_branch2c/moving_variance/read"
  input: "id_block_stage3/bn3b_branch2c/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3b_branch2c/moving_variance"
      }
    }
  }
}
node {
  name: "id_block_stage3/bn3b_branch2c/cond/Merge"
  op: "Merge"
  input: "id_block_stage3/bn3b_branch2c/cond/FusedBatchNormV3_1"
  input: "id_block_stage3/bn3b_branch2c/cond/FusedBatchNormV3"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "id_block_stage3/bn3b_branch2c/cond/Merge_1"
  op: "Merge"
  input: "id_block_stage3/bn3b_branch2c/cond/FusedBatchNormV3_1:1"
  input: "id_block_stage3/bn3b_branch2c/cond/FusedBatchNormV3:1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "id_block_stage3/bn3b_branch2c/cond/Merge_2"
  op: "Merge"
  input: "id_block_stage3/bn3b_branch2c/cond/FusedBatchNormV3_1:2"
  input: "id_block_stage3/bn3b_branch2c/cond/FusedBatchNormV3:2"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "id_block_stage3/bn3b_branch2c/cond_1/Switch"
  op: "Switch"
  input: "Placeholder_2"
  input: "Placeholder_2"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "id_block_stage3/bn3b_branch2c/cond_1/switch_t"
  op: "Identity"
  input: "id_block_stage3/bn3b_branch2c/cond_1/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "id_block_stage3/bn3b_branch2c/cond_1/switch_f"
  op: "Identity"
  input: "id_block_stage3/bn3b_branch2c/cond_1/Switch"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "id_block_stage3/bn3b_branch2c/cond_1/pred_id"
  op: "Identity"
  input: "Placeholder_2"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "id_block_stage3/bn3b_branch2c/cond_1/Const"
  op: "Const"
  input: "^id_block_stage3/bn3b_branch2c/cond_1/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.9900000095367432
      }
    }
  }
}
node {
  name: "id_block_stage3/bn3b_branch2c/cond_1/Const_1"
  op: "Const"
  input: "^id_block_stage3/bn3b_branch2c/cond_1/switch_f"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "id_block_stage3/bn3b_branch2c/cond_1/Merge"
  op: "Merge"
  input: "id_block_stage3/bn3b_branch2c/cond_1/Const_1"
  input: "id_block_stage3/bn3b_branch2c/cond_1/Const"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "id_block_stage3/bn3b_branch2c/AssignMovingAvg/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3b_branch2c/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "id_block_stage3/bn3b_branch2c/AssignMovingAvg/sub"
  op: "Sub"
  input: "id_block_stage3/bn3b_branch2c/AssignMovingAvg/sub/x"
  input: "id_block_stage3/bn3b_branch2c/cond_1/Merge"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3b_branch2c/moving_mean"
      }
    }
  }
}
node {
  name: "id_block_stage3/bn3b_branch2c/AssignMovingAvg/sub_1"
  op: "Sub"
  input: "bn3b_branch2c/moving_mean/read"
  input: "id_block_stage3/bn3b_branch2c/cond/Merge_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3b_branch2c/moving_mean"
      }
    }
  }
}
node {
  name: "id_block_stage3/bn3b_branch2c/AssignMovingAvg/mul"
  op: "Mul"
  input: "id_block_stage3/bn3b_branch2c/AssignMovingAvg/sub_1"
  input: "id_block_stage3/bn3b_branch2c/AssignMovingAvg/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3b_branch2c/moving_mean"
      }
    }
  }
}
node {
  name: "id_block_stage3/bn3b_branch2c/AssignMovingAvg"
  op: "AssignSub"
  input: "bn3b_branch2c/moving_mean"
  input: "id_block_stage3/bn3b_branch2c/AssignMovingAvg/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3b_branch2c/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "id_block_stage3/bn3b_branch2c/AssignMovingAvg_1/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3b_branch2c/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "id_block_stage3/bn3b_branch2c/AssignMovingAvg_1/sub"
  op: "Sub"
  input: "id_block_stage3/bn3b_branch2c/AssignMovingAvg_1/sub/x"
  input: "id_block_stage3/bn3b_branch2c/cond_1/Merge"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3b_branch2c/moving_variance"
      }
    }
  }
}
node {
  name: "id_block_stage3/bn3b_branch2c/AssignMovingAvg_1/sub_1"
  op: "Sub"
  input: "bn3b_branch2c/moving_variance/read"
  input: "id_block_stage3/bn3b_branch2c/cond/Merge_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3b_branch2c/moving_variance"
      }
    }
  }
}
node {
  name: "id_block_stage3/bn3b_branch2c/AssignMovingAvg_1/mul"
  op: "Mul"
  input: "id_block_stage3/bn3b_branch2c/AssignMovingAvg_1/sub_1"
  input: "id_block_stage3/bn3b_branch2c/AssignMovingAvg_1/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3b_branch2c/moving_variance"
      }
    }
  }
}
node {
  name: "id_block_stage3/bn3b_branch2c/AssignMovingAvg_1"
  op: "AssignSub"
  input: "bn3b_branch2c/moving_variance"
  input: "id_block_stage3/bn3b_branch2c/AssignMovingAvg_1/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3b_branch2c/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "id_block_stage3/Add"
  op: "Add"
  input: "id_block_stage3/bn3b_branch2c/cond/Merge"
  input: "conv_block_stage3/Relu_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "id_block_stage3/Relu_1"
  op: "Relu"
  input: "id_block_stage3/Add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "res4a_branch2a/kernel/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res4a_branch2a/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\200\000\000\000\000\001\000\000"
      }
    }
  }
}
node {
  name: "res4a_branch2a/kernel/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res4a_branch2a/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.0416666679084301
      }
    }
  }
}
node {
  name: "res4a_branch2a/kernel/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res4a_branch2a/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0416666679084301
      }
    }
  }
}
node {
  name: "res4a_branch2a/kernel/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "res4a_branch2a/kernel/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res4a_branch2a/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "res4a_branch2a/kernel/Initializer/random_uniform/sub"
  op: "Sub"
  input: "res4a_branch2a/kernel/Initializer/random_uniform/max"
  input: "res4a_branch2a/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res4a_branch2a/kernel"
      }
    }
  }
}
node {
  name: "res4a_branch2a/kernel/Initializer/random_uniform/mul"
  op: "Mul"
  input: "res4a_branch2a/kernel/Initializer/random_uniform/RandomUniform"
  input: "res4a_branch2a/kernel/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res4a_branch2a/kernel"
      }
    }
  }
}
node {
  name: "res4a_branch2a/kernel/Initializer/random_uniform"
  op: "Add"
  input: "res4a_branch2a/kernel/Initializer/random_uniform/mul"
  input: "res4a_branch2a/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res4a_branch2a/kernel"
      }
    }
  }
}
node {
  name: "res4a_branch2a/kernel"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res4a_branch2a/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 128
        }
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "res4a_branch2a/kernel/Assign"
  op: "Assign"
  input: "res4a_branch2a/kernel"
  input: "res4a_branch2a/kernel/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res4a_branch2a/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "res4a_branch2a/kernel/read"
  op: "Identity"
  input: "res4a_branch2a/kernel"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res4a_branch2a/kernel"
      }
    }
  }
}
node {
  name: "conv_block_stage4/res4a_branch2a/kernel/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0005000000237487257
      }
    }
  }
}
node {
  name: "conv_block_stage4/res4a_branch2a/kernel/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "res4a_branch2a/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv_block_stage4/res4a_branch2a/kernel/Regularizer/l2_regularizer"
  op: "Mul"
  input: "conv_block_stage4/res4a_branch2a/kernel/Regularizer/l2_regularizer/scale"
  input: "conv_block_stage4/res4a_branch2a/kernel/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "res4a_branch2a/bias/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res4a_branch2a/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 256
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "res4a_branch2a/bias"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res4a_branch2a/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "res4a_branch2a/bias/Assign"
  op: "Assign"
  input: "res4a_branch2a/bias"
  input: "res4a_branch2a/bias/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res4a_branch2a/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "res4a_branch2a/bias/read"
  op: "Identity"
  input: "res4a_branch2a/bias"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res4a_branch2a/bias"
      }
    }
  }
}
node {
  name: "conv_block_stage4/res4a_branch2a/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "conv_block_stage4/res4a_branch2a/Conv2D"
  op: "Conv2D"
  input: "id_block_stage3/Relu_1"
  input: "res4a_branch2a/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "conv_block_stage4/res4a_branch2a/BiasAdd"
  op: "BiasAdd"
  input: "conv_block_stage4/res4a_branch2a/Conv2D"
  input: "res4a_branch2a/bias/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "bn4a_branch2a/gamma/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch2a/gamma"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 256
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "bn4a_branch2a/gamma"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch2a/gamma"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn4a_branch2a/gamma/Assign"
  op: "Assign"
  input: "bn4a_branch2a/gamma"
  input: "bn4a_branch2a/gamma/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch2a/gamma"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn4a_branch2a/gamma/read"
  op: "Identity"
  input: "bn4a_branch2a/gamma"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch2a/gamma"
      }
    }
  }
}
node {
  name: "bn4a_branch2a/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch2a/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 256
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "bn4a_branch2a/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch2a/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn4a_branch2a/beta/Assign"
  op: "Assign"
  input: "bn4a_branch2a/beta"
  input: "bn4a_branch2a/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch2a/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn4a_branch2a/beta/read"
  op: "Identity"
  input: "bn4a_branch2a/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch2a/beta"
      }
    }
  }
}
node {
  name: "bn4a_branch2a/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch2a/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 256
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "bn4a_branch2a/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch2a/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn4a_branch2a/moving_mean/Assign"
  op: "Assign"
  input: "bn4a_branch2a/moving_mean"
  input: "bn4a_branch2a/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch2a/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn4a_branch2a/moving_mean/read"
  op: "Identity"
  input: "bn4a_branch2a/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch2a/moving_mean"
      }
    }
  }
}
node {
  name: "bn4a_branch2a/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch2a/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 256
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "bn4a_branch2a/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch2a/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn4a_branch2a/moving_variance/Assign"
  op: "Assign"
  input: "bn4a_branch2a/moving_variance"
  input: "bn4a_branch2a/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch2a/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn4a_branch2a/moving_variance/read"
  op: "Identity"
  input: "bn4a_branch2a/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch2a/moving_variance"
      }
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch2a/cond/Switch"
  op: "Switch"
  input: "Placeholder_2"
  input: "Placeholder_2"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch2a/cond/switch_t"
  op: "Identity"
  input: "conv_block_stage4/bn4a_branch2a/cond/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch2a/cond/switch_f"
  op: "Identity"
  input: "conv_block_stage4/bn4a_branch2a/cond/Switch"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch2a/cond/pred_id"
  op: "Identity"
  input: "Placeholder_2"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch2a/cond/Const"
  op: "Const"
  input: "^conv_block_stage4/bn4a_branch2a/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch2a/cond/Const_1"
  op: "Const"
  input: "^conv_block_stage4/bn4a_branch2a/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch2a/cond/FusedBatchNormV3"
  op: "FusedBatchNormV3"
  input: "conv_block_stage4/bn4a_branch2a/cond/FusedBatchNormV3/Switch:1"
  input: "conv_block_stage4/bn4a_branch2a/cond/FusedBatchNormV3/Switch_1:1"
  input: "conv_block_stage4/bn4a_branch2a/cond/FusedBatchNormV3/Switch_2:1"
  input: "conv_block_stage4/bn4a_branch2a/cond/Const"
  input: "conv_block_stage4/bn4a_branch2a/cond/Const_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "U"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.0010000000474974513
    }
  }
  attr {
    key: "is_training"
    value {
      b: true
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch2a/cond/FusedBatchNormV3/Switch"
  op: "Switch"
  input: "conv_block_stage4/res4a_branch2a/BiasAdd"
  input: "conv_block_stage4/bn4a_branch2a/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_block_stage4/res4a_branch2a/BiasAdd"
      }
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch2a/cond/FusedBatchNormV3/Switch_1"
  op: "Switch"
  input: "bn4a_branch2a/gamma/read"
  input: "conv_block_stage4/bn4a_branch2a/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch2a/gamma"
      }
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch2a/cond/FusedBatchNormV3/Switch_2"
  op: "Switch"
  input: "bn4a_branch2a/beta/read"
  input: "conv_block_stage4/bn4a_branch2a/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch2a/beta"
      }
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch2a/cond/FusedBatchNormV3_1"
  op: "FusedBatchNormV3"
  input: "conv_block_stage4/bn4a_branch2a/cond/FusedBatchNormV3_1/Switch"
  input: "conv_block_stage4/bn4a_branch2a/cond/FusedBatchNormV3_1/Switch_1"
  input: "conv_block_stage4/bn4a_branch2a/cond/FusedBatchNormV3_1/Switch_2"
  input: "conv_block_stage4/bn4a_branch2a/cond/FusedBatchNormV3_1/Switch_3"
  input: "conv_block_stage4/bn4a_branch2a/cond/FusedBatchNormV3_1/Switch_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "U"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.0010000000474974513
    }
  }
  attr {
    key: "is_training"
    value {
      b: false
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch2a/cond/FusedBatchNormV3_1/Switch"
  op: "Switch"
  input: "conv_block_stage4/res4a_branch2a/BiasAdd"
  input: "conv_block_stage4/bn4a_branch2a/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_block_stage4/res4a_branch2a/BiasAdd"
      }
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch2a/cond/FusedBatchNormV3_1/Switch_1"
  op: "Switch"
  input: "bn4a_branch2a/gamma/read"
  input: "conv_block_stage4/bn4a_branch2a/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch2a/gamma"
      }
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch2a/cond/FusedBatchNormV3_1/Switch_2"
  op: "Switch"
  input: "bn4a_branch2a/beta/read"
  input: "conv_block_stage4/bn4a_branch2a/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch2a/beta"
      }
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch2a/cond/FusedBatchNormV3_1/Switch_3"
  op: "Switch"
  input: "bn4a_branch2a/moving_mean/read"
  input: "conv_block_stage4/bn4a_branch2a/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch2a/moving_mean"
      }
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch2a/cond/FusedBatchNormV3_1/Switch_4"
  op: "Switch"
  input: "bn4a_branch2a/moving_variance/read"
  input: "conv_block_stage4/bn4a_branch2a/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch2a/moving_variance"
      }
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch2a/cond/Merge"
  op: "Merge"
  input: "conv_block_stage4/bn4a_branch2a/cond/FusedBatchNormV3_1"
  input: "conv_block_stage4/bn4a_branch2a/cond/FusedBatchNormV3"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch2a/cond/Merge_1"
  op: "Merge"
  input: "conv_block_stage4/bn4a_branch2a/cond/FusedBatchNormV3_1:1"
  input: "conv_block_stage4/bn4a_branch2a/cond/FusedBatchNormV3:1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch2a/cond/Merge_2"
  op: "Merge"
  input: "conv_block_stage4/bn4a_branch2a/cond/FusedBatchNormV3_1:2"
  input: "conv_block_stage4/bn4a_branch2a/cond/FusedBatchNormV3:2"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch2a/cond_1/Switch"
  op: "Switch"
  input: "Placeholder_2"
  input: "Placeholder_2"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch2a/cond_1/switch_t"
  op: "Identity"
  input: "conv_block_stage4/bn4a_branch2a/cond_1/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch2a/cond_1/switch_f"
  op: "Identity"
  input: "conv_block_stage4/bn4a_branch2a/cond_1/Switch"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch2a/cond_1/pred_id"
  op: "Identity"
  input: "Placeholder_2"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch2a/cond_1/Const"
  op: "Const"
  input: "^conv_block_stage4/bn4a_branch2a/cond_1/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.9900000095367432
      }
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch2a/cond_1/Const_1"
  op: "Const"
  input: "^conv_block_stage4/bn4a_branch2a/cond_1/switch_f"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch2a/cond_1/Merge"
  op: "Merge"
  input: "conv_block_stage4/bn4a_branch2a/cond_1/Const_1"
  input: "conv_block_stage4/bn4a_branch2a/cond_1/Const"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch2a/AssignMovingAvg/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch2a/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch2a/AssignMovingAvg/sub"
  op: "Sub"
  input: "conv_block_stage4/bn4a_branch2a/AssignMovingAvg/sub/x"
  input: "conv_block_stage4/bn4a_branch2a/cond_1/Merge"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch2a/moving_mean"
      }
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch2a/AssignMovingAvg/sub_1"
  op: "Sub"
  input: "bn4a_branch2a/moving_mean/read"
  input: "conv_block_stage4/bn4a_branch2a/cond/Merge_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch2a/moving_mean"
      }
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch2a/AssignMovingAvg/mul"
  op: "Mul"
  input: "conv_block_stage4/bn4a_branch2a/AssignMovingAvg/sub_1"
  input: "conv_block_stage4/bn4a_branch2a/AssignMovingAvg/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch2a/moving_mean"
      }
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch2a/AssignMovingAvg"
  op: "AssignSub"
  input: "bn4a_branch2a/moving_mean"
  input: "conv_block_stage4/bn4a_branch2a/AssignMovingAvg/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch2a/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch2a/AssignMovingAvg_1/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch2a/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch2a/AssignMovingAvg_1/sub"
  op: "Sub"
  input: "conv_block_stage4/bn4a_branch2a/AssignMovingAvg_1/sub/x"
  input: "conv_block_stage4/bn4a_branch2a/cond_1/Merge"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch2a/moving_variance"
      }
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch2a/AssignMovingAvg_1/sub_1"
  op: "Sub"
  input: "bn4a_branch2a/moving_variance/read"
  input: "conv_block_stage4/bn4a_branch2a/cond/Merge_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch2a/moving_variance"
      }
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch2a/AssignMovingAvg_1/mul"
  op: "Mul"
  input: "conv_block_stage4/bn4a_branch2a/AssignMovingAvg_1/sub_1"
  input: "conv_block_stage4/bn4a_branch2a/AssignMovingAvg_1/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch2a/moving_variance"
      }
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch2a/AssignMovingAvg_1"
  op: "AssignSub"
  input: "bn4a_branch2a/moving_variance"
  input: "conv_block_stage4/bn4a_branch2a/AssignMovingAvg_1/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch2a/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "conv_block_stage4/Relu"
  op: "Relu"
  input: "conv_block_stage4/bn4a_branch2a/cond/Merge"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "res4a_branch2b/kernel/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res4a_branch2b/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\000\001\000\000\000\001\000\000"
      }
    }
  }
}
node {
  name: "res4a_branch2b/kernel/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res4a_branch2b/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.03608439117670059
      }
    }
  }
}
node {
  name: "res4a_branch2b/kernel/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res4a_branch2b/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.03608439117670059
      }
    }
  }
}
node {
  name: "res4a_branch2b/kernel/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "res4a_branch2b/kernel/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res4a_branch2b/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "res4a_branch2b/kernel/Initializer/random_uniform/sub"
  op: "Sub"
  input: "res4a_branch2b/kernel/Initializer/random_uniform/max"
  input: "res4a_branch2b/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res4a_branch2b/kernel"
      }
    }
  }
}
node {
  name: "res4a_branch2b/kernel/Initializer/random_uniform/mul"
  op: "Mul"
  input: "res4a_branch2b/kernel/Initializer/random_uniform/RandomUniform"
  input: "res4a_branch2b/kernel/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res4a_branch2b/kernel"
      }
    }
  }
}
node {
  name: "res4a_branch2b/kernel/Initializer/random_uniform"
  op: "Add"
  input: "res4a_branch2b/kernel/Initializer/random_uniform/mul"
  input: "res4a_branch2b/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res4a_branch2b/kernel"
      }
    }
  }
}
node {
  name: "res4a_branch2b/kernel"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res4a_branch2b/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 256
        }
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "res4a_branch2b/kernel/Assign"
  op: "Assign"
  input: "res4a_branch2b/kernel"
  input: "res4a_branch2b/kernel/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res4a_branch2b/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "res4a_branch2b/kernel/read"
  op: "Identity"
  input: "res4a_branch2b/kernel"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res4a_branch2b/kernel"
      }
    }
  }
}
node {
  name: "conv_block_stage4/res4a_branch2b/kernel/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0005000000237487257
      }
    }
  }
}
node {
  name: "conv_block_stage4/res4a_branch2b/kernel/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "res4a_branch2b/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv_block_stage4/res4a_branch2b/kernel/Regularizer/l2_regularizer"
  op: "Mul"
  input: "conv_block_stage4/res4a_branch2b/kernel/Regularizer/l2_regularizer/scale"
  input: "conv_block_stage4/res4a_branch2b/kernel/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "res4a_branch2b/bias/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res4a_branch2b/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 256
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "res4a_branch2b/bias"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res4a_branch2b/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "res4a_branch2b/bias/Assign"
  op: "Assign"
  input: "res4a_branch2b/bias"
  input: "res4a_branch2b/bias/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res4a_branch2b/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "res4a_branch2b/bias/read"
  op: "Identity"
  input: "res4a_branch2b/bias"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res4a_branch2b/bias"
      }
    }
  }
}
node {
  name: "conv_block_stage4/res4a_branch2b/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "conv_block_stage4/res4a_branch2b/Conv2D"
  op: "Conv2D"
  input: "conv_block_stage4/Relu"
  input: "res4a_branch2b/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "conv_block_stage4/res4a_branch2b/BiasAdd"
  op: "BiasAdd"
  input: "conv_block_stage4/res4a_branch2b/Conv2D"
  input: "res4a_branch2b/bias/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "bn4a_branch2b/gamma/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch2b/gamma"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 256
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "bn4a_branch2b/gamma"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch2b/gamma"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn4a_branch2b/gamma/Assign"
  op: "Assign"
  input: "bn4a_branch2b/gamma"
  input: "bn4a_branch2b/gamma/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch2b/gamma"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn4a_branch2b/gamma/read"
  op: "Identity"
  input: "bn4a_branch2b/gamma"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch2b/gamma"
      }
    }
  }
}
node {
  name: "bn4a_branch2b/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch2b/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 256
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "bn4a_branch2b/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch2b/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn4a_branch2b/beta/Assign"
  op: "Assign"
  input: "bn4a_branch2b/beta"
  input: "bn4a_branch2b/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch2b/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn4a_branch2b/beta/read"
  op: "Identity"
  input: "bn4a_branch2b/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch2b/beta"
      }
    }
  }
}
node {
  name: "bn4a_branch2b/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch2b/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 256
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "bn4a_branch2b/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch2b/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn4a_branch2b/moving_mean/Assign"
  op: "Assign"
  input: "bn4a_branch2b/moving_mean"
  input: "bn4a_branch2b/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch2b/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn4a_branch2b/moving_mean/read"
  op: "Identity"
  input: "bn4a_branch2b/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch2b/moving_mean"
      }
    }
  }
}
node {
  name: "bn4a_branch2b/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch2b/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 256
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "bn4a_branch2b/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch2b/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn4a_branch2b/moving_variance/Assign"
  op: "Assign"
  input: "bn4a_branch2b/moving_variance"
  input: "bn4a_branch2b/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch2b/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn4a_branch2b/moving_variance/read"
  op: "Identity"
  input: "bn4a_branch2b/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch2b/moving_variance"
      }
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch2b/cond/Switch"
  op: "Switch"
  input: "Placeholder_2"
  input: "Placeholder_2"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch2b/cond/switch_t"
  op: "Identity"
  input: "conv_block_stage4/bn4a_branch2b/cond/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch2b/cond/switch_f"
  op: "Identity"
  input: "conv_block_stage4/bn4a_branch2b/cond/Switch"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch2b/cond/pred_id"
  op: "Identity"
  input: "Placeholder_2"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch2b/cond/Const"
  op: "Const"
  input: "^conv_block_stage4/bn4a_branch2b/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch2b/cond/Const_1"
  op: "Const"
  input: "^conv_block_stage4/bn4a_branch2b/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch2b/cond/FusedBatchNormV3"
  op: "FusedBatchNormV3"
  input: "conv_block_stage4/bn4a_branch2b/cond/FusedBatchNormV3/Switch:1"
  input: "conv_block_stage4/bn4a_branch2b/cond/FusedBatchNormV3/Switch_1:1"
  input: "conv_block_stage4/bn4a_branch2b/cond/FusedBatchNormV3/Switch_2:1"
  input: "conv_block_stage4/bn4a_branch2b/cond/Const"
  input: "conv_block_stage4/bn4a_branch2b/cond/Const_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "U"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.0010000000474974513
    }
  }
  attr {
    key: "is_training"
    value {
      b: true
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch2b/cond/FusedBatchNormV3/Switch"
  op: "Switch"
  input: "conv_block_stage4/res4a_branch2b/BiasAdd"
  input: "conv_block_stage4/bn4a_branch2b/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_block_stage4/res4a_branch2b/BiasAdd"
      }
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch2b/cond/FusedBatchNormV3/Switch_1"
  op: "Switch"
  input: "bn4a_branch2b/gamma/read"
  input: "conv_block_stage4/bn4a_branch2b/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch2b/gamma"
      }
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch2b/cond/FusedBatchNormV3/Switch_2"
  op: "Switch"
  input: "bn4a_branch2b/beta/read"
  input: "conv_block_stage4/bn4a_branch2b/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch2b/beta"
      }
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch2b/cond/FusedBatchNormV3_1"
  op: "FusedBatchNormV3"
  input: "conv_block_stage4/bn4a_branch2b/cond/FusedBatchNormV3_1/Switch"
  input: "conv_block_stage4/bn4a_branch2b/cond/FusedBatchNormV3_1/Switch_1"
  input: "conv_block_stage4/bn4a_branch2b/cond/FusedBatchNormV3_1/Switch_2"
  input: "conv_block_stage4/bn4a_branch2b/cond/FusedBatchNormV3_1/Switch_3"
  input: "conv_block_stage4/bn4a_branch2b/cond/FusedBatchNormV3_1/Switch_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "U"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.0010000000474974513
    }
  }
  attr {
    key: "is_training"
    value {
      b: false
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch2b/cond/FusedBatchNormV3_1/Switch"
  op: "Switch"
  input: "conv_block_stage4/res4a_branch2b/BiasAdd"
  input: "conv_block_stage4/bn4a_branch2b/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_block_stage4/res4a_branch2b/BiasAdd"
      }
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch2b/cond/FusedBatchNormV3_1/Switch_1"
  op: "Switch"
  input: "bn4a_branch2b/gamma/read"
  input: "conv_block_stage4/bn4a_branch2b/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch2b/gamma"
      }
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch2b/cond/FusedBatchNormV3_1/Switch_2"
  op: "Switch"
  input: "bn4a_branch2b/beta/read"
  input: "conv_block_stage4/bn4a_branch2b/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch2b/beta"
      }
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch2b/cond/FusedBatchNormV3_1/Switch_3"
  op: "Switch"
  input: "bn4a_branch2b/moving_mean/read"
  input: "conv_block_stage4/bn4a_branch2b/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch2b/moving_mean"
      }
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch2b/cond/FusedBatchNormV3_1/Switch_4"
  op: "Switch"
  input: "bn4a_branch2b/moving_variance/read"
  input: "conv_block_stage4/bn4a_branch2b/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch2b/moving_variance"
      }
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch2b/cond/Merge"
  op: "Merge"
  input: "conv_block_stage4/bn4a_branch2b/cond/FusedBatchNormV3_1"
  input: "conv_block_stage4/bn4a_branch2b/cond/FusedBatchNormV3"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch2b/cond/Merge_1"
  op: "Merge"
  input: "conv_block_stage4/bn4a_branch2b/cond/FusedBatchNormV3_1:1"
  input: "conv_block_stage4/bn4a_branch2b/cond/FusedBatchNormV3:1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch2b/cond/Merge_2"
  op: "Merge"
  input: "conv_block_stage4/bn4a_branch2b/cond/FusedBatchNormV3_1:2"
  input: "conv_block_stage4/bn4a_branch2b/cond/FusedBatchNormV3:2"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch2b/cond_1/Switch"
  op: "Switch"
  input: "Placeholder_2"
  input: "Placeholder_2"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch2b/cond_1/switch_t"
  op: "Identity"
  input: "conv_block_stage4/bn4a_branch2b/cond_1/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch2b/cond_1/switch_f"
  op: "Identity"
  input: "conv_block_stage4/bn4a_branch2b/cond_1/Switch"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch2b/cond_1/pred_id"
  op: "Identity"
  input: "Placeholder_2"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch2b/cond_1/Const"
  op: "Const"
  input: "^conv_block_stage4/bn4a_branch2b/cond_1/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.9900000095367432
      }
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch2b/cond_1/Const_1"
  op: "Const"
  input: "^conv_block_stage4/bn4a_branch2b/cond_1/switch_f"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch2b/cond_1/Merge"
  op: "Merge"
  input: "conv_block_stage4/bn4a_branch2b/cond_1/Const_1"
  input: "conv_block_stage4/bn4a_branch2b/cond_1/Const"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch2b/AssignMovingAvg/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch2b/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch2b/AssignMovingAvg/sub"
  op: "Sub"
  input: "conv_block_stage4/bn4a_branch2b/AssignMovingAvg/sub/x"
  input: "conv_block_stage4/bn4a_branch2b/cond_1/Merge"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch2b/moving_mean"
      }
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch2b/AssignMovingAvg/sub_1"
  op: "Sub"
  input: "bn4a_branch2b/moving_mean/read"
  input: "conv_block_stage4/bn4a_branch2b/cond/Merge_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch2b/moving_mean"
      }
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch2b/AssignMovingAvg/mul"
  op: "Mul"
  input: "conv_block_stage4/bn4a_branch2b/AssignMovingAvg/sub_1"
  input: "conv_block_stage4/bn4a_branch2b/AssignMovingAvg/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch2b/moving_mean"
      }
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch2b/AssignMovingAvg"
  op: "AssignSub"
  input: "bn4a_branch2b/moving_mean"
  input: "conv_block_stage4/bn4a_branch2b/AssignMovingAvg/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch2b/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch2b/AssignMovingAvg_1/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch2b/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch2b/AssignMovingAvg_1/sub"
  op: "Sub"
  input: "conv_block_stage4/bn4a_branch2b/AssignMovingAvg_1/sub/x"
  input: "conv_block_stage4/bn4a_branch2b/cond_1/Merge"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch2b/moving_variance"
      }
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch2b/AssignMovingAvg_1/sub_1"
  op: "Sub"
  input: "bn4a_branch2b/moving_variance/read"
  input: "conv_block_stage4/bn4a_branch2b/cond/Merge_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch2b/moving_variance"
      }
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch2b/AssignMovingAvg_1/mul"
  op: "Mul"
  input: "conv_block_stage4/bn4a_branch2b/AssignMovingAvg_1/sub_1"
  input: "conv_block_stage4/bn4a_branch2b/AssignMovingAvg_1/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch2b/moving_variance"
      }
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch2b/AssignMovingAvg_1"
  op: "AssignSub"
  input: "bn4a_branch2b/moving_variance"
  input: "conv_block_stage4/bn4a_branch2b/AssignMovingAvg_1/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch2b/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "res4a_branch1/kernel/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res4a_branch1/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\200\000\000\000\000\001\000\000"
      }
    }
  }
}
node {
  name: "res4a_branch1/kernel/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res4a_branch1/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.125
      }
    }
  }
}
node {
  name: "res4a_branch1/kernel/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res4a_branch1/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.125
      }
    }
  }
}
node {
  name: "res4a_branch1/kernel/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "res4a_branch1/kernel/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res4a_branch1/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "res4a_branch1/kernel/Initializer/random_uniform/sub"
  op: "Sub"
  input: "res4a_branch1/kernel/Initializer/random_uniform/max"
  input: "res4a_branch1/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res4a_branch1/kernel"
      }
    }
  }
}
node {
  name: "res4a_branch1/kernel/Initializer/random_uniform/mul"
  op: "Mul"
  input: "res4a_branch1/kernel/Initializer/random_uniform/RandomUniform"
  input: "res4a_branch1/kernel/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res4a_branch1/kernel"
      }
    }
  }
}
node {
  name: "res4a_branch1/kernel/Initializer/random_uniform"
  op: "Add"
  input: "res4a_branch1/kernel/Initializer/random_uniform/mul"
  input: "res4a_branch1/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res4a_branch1/kernel"
      }
    }
  }
}
node {
  name: "res4a_branch1/kernel"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res4a_branch1/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
        dim {
          size: 1
        }
        dim {
          size: 128
        }
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "res4a_branch1/kernel/Assign"
  op: "Assign"
  input: "res4a_branch1/kernel"
  input: "res4a_branch1/kernel/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res4a_branch1/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "res4a_branch1/kernel/read"
  op: "Identity"
  input: "res4a_branch1/kernel"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res4a_branch1/kernel"
      }
    }
  }
}
node {
  name: "conv_block_stage4/res4a_branch1/kernel/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0005000000237487257
      }
    }
  }
}
node {
  name: "conv_block_stage4/res4a_branch1/kernel/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "res4a_branch1/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv_block_stage4/res4a_branch1/kernel/Regularizer/l2_regularizer"
  op: "Mul"
  input: "conv_block_stage4/res4a_branch1/kernel/Regularizer/l2_regularizer/scale"
  input: "conv_block_stage4/res4a_branch1/kernel/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "res4a_branch1/bias/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res4a_branch1/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 256
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "res4a_branch1/bias"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res4a_branch1/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "res4a_branch1/bias/Assign"
  op: "Assign"
  input: "res4a_branch1/bias"
  input: "res4a_branch1/bias/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res4a_branch1/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "res4a_branch1/bias/read"
  op: "Identity"
  input: "res4a_branch1/bias"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res4a_branch1/bias"
      }
    }
  }
}
node {
  name: "conv_block_stage4/res4a_branch1/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "conv_block_stage4/res4a_branch1/Conv2D"
  op: "Conv2D"
  input: "id_block_stage3/Relu_1"
  input: "res4a_branch1/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "VALID"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "conv_block_stage4/res4a_branch1/BiasAdd"
  op: "BiasAdd"
  input: "conv_block_stage4/res4a_branch1/Conv2D"
  input: "res4a_branch1/bias/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "bn4a_branch1/gamma/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch1/gamma"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 256
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "bn4a_branch1/gamma"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch1/gamma"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn4a_branch1/gamma/Assign"
  op: "Assign"
  input: "bn4a_branch1/gamma"
  input: "bn4a_branch1/gamma/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch1/gamma"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn4a_branch1/gamma/read"
  op: "Identity"
  input: "bn4a_branch1/gamma"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch1/gamma"
      }
    }
  }
}
node {
  name: "bn4a_branch1/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch1/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 256
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "bn4a_branch1/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch1/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn4a_branch1/beta/Assign"
  op: "Assign"
  input: "bn4a_branch1/beta"
  input: "bn4a_branch1/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch1/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn4a_branch1/beta/read"
  op: "Identity"
  input: "bn4a_branch1/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch1/beta"
      }
    }
  }
}
node {
  name: "bn4a_branch1/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch1/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 256
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "bn4a_branch1/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch1/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn4a_branch1/moving_mean/Assign"
  op: "Assign"
  input: "bn4a_branch1/moving_mean"
  input: "bn4a_branch1/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch1/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn4a_branch1/moving_mean/read"
  op: "Identity"
  input: "bn4a_branch1/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch1/moving_mean"
      }
    }
  }
}
node {
  name: "bn4a_branch1/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch1/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 256
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "bn4a_branch1/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch1/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn4a_branch1/moving_variance/Assign"
  op: "Assign"
  input: "bn4a_branch1/moving_variance"
  input: "bn4a_branch1/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch1/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn4a_branch1/moving_variance/read"
  op: "Identity"
  input: "bn4a_branch1/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch1/moving_variance"
      }
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch1/cond/Switch"
  op: "Switch"
  input: "Placeholder_2"
  input: "Placeholder_2"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch1/cond/switch_t"
  op: "Identity"
  input: "conv_block_stage4/bn4a_branch1/cond/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch1/cond/switch_f"
  op: "Identity"
  input: "conv_block_stage4/bn4a_branch1/cond/Switch"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch1/cond/pred_id"
  op: "Identity"
  input: "Placeholder_2"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch1/cond/Const"
  op: "Const"
  input: "^conv_block_stage4/bn4a_branch1/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch1/cond/Const_1"
  op: "Const"
  input: "^conv_block_stage4/bn4a_branch1/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch1/cond/FusedBatchNormV3"
  op: "FusedBatchNormV3"
  input: "conv_block_stage4/bn4a_branch1/cond/FusedBatchNormV3/Switch:1"
  input: "conv_block_stage4/bn4a_branch1/cond/FusedBatchNormV3/Switch_1:1"
  input: "conv_block_stage4/bn4a_branch1/cond/FusedBatchNormV3/Switch_2:1"
  input: "conv_block_stage4/bn4a_branch1/cond/Const"
  input: "conv_block_stage4/bn4a_branch1/cond/Const_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "U"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.0010000000474974513
    }
  }
  attr {
    key: "is_training"
    value {
      b: true
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch1/cond/FusedBatchNormV3/Switch"
  op: "Switch"
  input: "conv_block_stage4/res4a_branch1/BiasAdd"
  input: "conv_block_stage4/bn4a_branch1/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_block_stage4/res4a_branch1/BiasAdd"
      }
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch1/cond/FusedBatchNormV3/Switch_1"
  op: "Switch"
  input: "bn4a_branch1/gamma/read"
  input: "conv_block_stage4/bn4a_branch1/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch1/gamma"
      }
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch1/cond/FusedBatchNormV3/Switch_2"
  op: "Switch"
  input: "bn4a_branch1/beta/read"
  input: "conv_block_stage4/bn4a_branch1/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch1/beta"
      }
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch1/cond/FusedBatchNormV3_1"
  op: "FusedBatchNormV3"
  input: "conv_block_stage4/bn4a_branch1/cond/FusedBatchNormV3_1/Switch"
  input: "conv_block_stage4/bn4a_branch1/cond/FusedBatchNormV3_1/Switch_1"
  input: "conv_block_stage4/bn4a_branch1/cond/FusedBatchNormV3_1/Switch_2"
  input: "conv_block_stage4/bn4a_branch1/cond/FusedBatchNormV3_1/Switch_3"
  input: "conv_block_stage4/bn4a_branch1/cond/FusedBatchNormV3_1/Switch_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "U"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.0010000000474974513
    }
  }
  attr {
    key: "is_training"
    value {
      b: false
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch1/cond/FusedBatchNormV3_1/Switch"
  op: "Switch"
  input: "conv_block_stage4/res4a_branch1/BiasAdd"
  input: "conv_block_stage4/bn4a_branch1/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_block_stage4/res4a_branch1/BiasAdd"
      }
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch1/cond/FusedBatchNormV3_1/Switch_1"
  op: "Switch"
  input: "bn4a_branch1/gamma/read"
  input: "conv_block_stage4/bn4a_branch1/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch1/gamma"
      }
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch1/cond/FusedBatchNormV3_1/Switch_2"
  op: "Switch"
  input: "bn4a_branch1/beta/read"
  input: "conv_block_stage4/bn4a_branch1/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch1/beta"
      }
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch1/cond/FusedBatchNormV3_1/Switch_3"
  op: "Switch"
  input: "bn4a_branch1/moving_mean/read"
  input: "conv_block_stage4/bn4a_branch1/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch1/moving_mean"
      }
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch1/cond/FusedBatchNormV3_1/Switch_4"
  op: "Switch"
  input: "bn4a_branch1/moving_variance/read"
  input: "conv_block_stage4/bn4a_branch1/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch1/moving_variance"
      }
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch1/cond/Merge"
  op: "Merge"
  input: "conv_block_stage4/bn4a_branch1/cond/FusedBatchNormV3_1"
  input: "conv_block_stage4/bn4a_branch1/cond/FusedBatchNormV3"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch1/cond/Merge_1"
  op: "Merge"
  input: "conv_block_stage4/bn4a_branch1/cond/FusedBatchNormV3_1:1"
  input: "conv_block_stage4/bn4a_branch1/cond/FusedBatchNormV3:1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch1/cond/Merge_2"
  op: "Merge"
  input: "conv_block_stage4/bn4a_branch1/cond/FusedBatchNormV3_1:2"
  input: "conv_block_stage4/bn4a_branch1/cond/FusedBatchNormV3:2"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch1/cond_1/Switch"
  op: "Switch"
  input: "Placeholder_2"
  input: "Placeholder_2"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch1/cond_1/switch_t"
  op: "Identity"
  input: "conv_block_stage4/bn4a_branch1/cond_1/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch1/cond_1/switch_f"
  op: "Identity"
  input: "conv_block_stage4/bn4a_branch1/cond_1/Switch"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch1/cond_1/pred_id"
  op: "Identity"
  input: "Placeholder_2"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch1/cond_1/Const"
  op: "Const"
  input: "^conv_block_stage4/bn4a_branch1/cond_1/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.9900000095367432
      }
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch1/cond_1/Const_1"
  op: "Const"
  input: "^conv_block_stage4/bn4a_branch1/cond_1/switch_f"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch1/cond_1/Merge"
  op: "Merge"
  input: "conv_block_stage4/bn4a_branch1/cond_1/Const_1"
  input: "conv_block_stage4/bn4a_branch1/cond_1/Const"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch1/AssignMovingAvg/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch1/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch1/AssignMovingAvg/sub"
  op: "Sub"
  input: "conv_block_stage4/bn4a_branch1/AssignMovingAvg/sub/x"
  input: "conv_block_stage4/bn4a_branch1/cond_1/Merge"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch1/moving_mean"
      }
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch1/AssignMovingAvg/sub_1"
  op: "Sub"
  input: "bn4a_branch1/moving_mean/read"
  input: "conv_block_stage4/bn4a_branch1/cond/Merge_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch1/moving_mean"
      }
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch1/AssignMovingAvg/mul"
  op: "Mul"
  input: "conv_block_stage4/bn4a_branch1/AssignMovingAvg/sub_1"
  input: "conv_block_stage4/bn4a_branch1/AssignMovingAvg/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch1/moving_mean"
      }
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch1/AssignMovingAvg"
  op: "AssignSub"
  input: "bn4a_branch1/moving_mean"
  input: "conv_block_stage4/bn4a_branch1/AssignMovingAvg/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch1/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch1/AssignMovingAvg_1/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch1/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch1/AssignMovingAvg_1/sub"
  op: "Sub"
  input: "conv_block_stage4/bn4a_branch1/AssignMovingAvg_1/sub/x"
  input: "conv_block_stage4/bn4a_branch1/cond_1/Merge"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch1/moving_variance"
      }
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch1/AssignMovingAvg_1/sub_1"
  op: "Sub"
  input: "bn4a_branch1/moving_variance/read"
  input: "conv_block_stage4/bn4a_branch1/cond/Merge_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch1/moving_variance"
      }
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch1/AssignMovingAvg_1/mul"
  op: "Mul"
  input: "conv_block_stage4/bn4a_branch1/AssignMovingAvg_1/sub_1"
  input: "conv_block_stage4/bn4a_branch1/AssignMovingAvg_1/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch1/moving_variance"
      }
    }
  }
}
node {
  name: "conv_block_stage4/bn4a_branch1/AssignMovingAvg_1"
  op: "AssignSub"
  input: "bn4a_branch1/moving_variance"
  input: "conv_block_stage4/bn4a_branch1/AssignMovingAvg_1/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch1/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "conv_block_stage4/Add"
  op: "Add"
  input: "conv_block_stage4/bn4a_branch1/cond/Merge"
  input: "conv_block_stage4/bn4a_branch2b/cond/Merge"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv_block_stage4/Relu_1"
  op: "Relu"
  input: "conv_block_stage4/Add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "res4b_branch2b/kernel/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res4b_branch2b/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\000\001\000\000\000\001\000\000"
      }
    }
  }
}
node {
  name: "res4b_branch2b/kernel/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res4b_branch2b/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.03608439117670059
      }
    }
  }
}
node {
  name: "res4b_branch2b/kernel/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res4b_branch2b/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.03608439117670059
      }
    }
  }
}
node {
  name: "res4b_branch2b/kernel/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "res4b_branch2b/kernel/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res4b_branch2b/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "res4b_branch2b/kernel/Initializer/random_uniform/sub"
  op: "Sub"
  input: "res4b_branch2b/kernel/Initializer/random_uniform/max"
  input: "res4b_branch2b/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res4b_branch2b/kernel"
      }
    }
  }
}
node {
  name: "res4b_branch2b/kernel/Initializer/random_uniform/mul"
  op: "Mul"
  input: "res4b_branch2b/kernel/Initializer/random_uniform/RandomUniform"
  input: "res4b_branch2b/kernel/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res4b_branch2b/kernel"
      }
    }
  }
}
node {
  name: "res4b_branch2b/kernel/Initializer/random_uniform"
  op: "Add"
  input: "res4b_branch2b/kernel/Initializer/random_uniform/mul"
  input: "res4b_branch2b/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res4b_branch2b/kernel"
      }
    }
  }
}
node {
  name: "res4b_branch2b/kernel"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res4b_branch2b/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 256
        }
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "res4b_branch2b/kernel/Assign"
  op: "Assign"
  input: "res4b_branch2b/kernel"
  input: "res4b_branch2b/kernel/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res4b_branch2b/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "res4b_branch2b/kernel/read"
  op: "Identity"
  input: "res4b_branch2b/kernel"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res4b_branch2b/kernel"
      }
    }
  }
}
node {
  name: "id_block_stage4/res4b_branch2b/kernel/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0005000000237487257
      }
    }
  }
}
node {
  name: "id_block_stage4/res4b_branch2b/kernel/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "res4b_branch2b/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "id_block_stage4/res4b_branch2b/kernel/Regularizer/l2_regularizer"
  op: "Mul"
  input: "id_block_stage4/res4b_branch2b/kernel/Regularizer/l2_regularizer/scale"
  input: "id_block_stage4/res4b_branch2b/kernel/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "res4b_branch2b/bias/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res4b_branch2b/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 256
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "res4b_branch2b/bias"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res4b_branch2b/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "res4b_branch2b/bias/Assign"
  op: "Assign"
  input: "res4b_branch2b/bias"
  input: "res4b_branch2b/bias/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res4b_branch2b/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "res4b_branch2b/bias/read"
  op: "Identity"
  input: "res4b_branch2b/bias"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res4b_branch2b/bias"
      }
    }
  }
}
node {
  name: "id_block_stage4/res4b_branch2b/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "id_block_stage4/res4b_branch2b/Conv2D"
  op: "Conv2D"
  input: "conv_block_stage4/Relu_1"
  input: "res4b_branch2b/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "id_block_stage4/res4b_branch2b/BiasAdd"
  op: "BiasAdd"
  input: "id_block_stage4/res4b_branch2b/Conv2D"
  input: "res4b_branch2b/bias/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "bn4b_branch2b/gamma/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4b_branch2b/gamma"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 256
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "bn4b_branch2b/gamma"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4b_branch2b/gamma"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn4b_branch2b/gamma/Assign"
  op: "Assign"
  input: "bn4b_branch2b/gamma"
  input: "bn4b_branch2b/gamma/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4b_branch2b/gamma"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn4b_branch2b/gamma/read"
  op: "Identity"
  input: "bn4b_branch2b/gamma"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4b_branch2b/gamma"
      }
    }
  }
}
node {
  name: "bn4b_branch2b/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4b_branch2b/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 256
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "bn4b_branch2b/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4b_branch2b/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn4b_branch2b/beta/Assign"
  op: "Assign"
  input: "bn4b_branch2b/beta"
  input: "bn4b_branch2b/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4b_branch2b/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn4b_branch2b/beta/read"
  op: "Identity"
  input: "bn4b_branch2b/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4b_branch2b/beta"
      }
    }
  }
}
node {
  name: "bn4b_branch2b/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4b_branch2b/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 256
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "bn4b_branch2b/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4b_branch2b/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn4b_branch2b/moving_mean/Assign"
  op: "Assign"
  input: "bn4b_branch2b/moving_mean"
  input: "bn4b_branch2b/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4b_branch2b/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn4b_branch2b/moving_mean/read"
  op: "Identity"
  input: "bn4b_branch2b/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4b_branch2b/moving_mean"
      }
    }
  }
}
node {
  name: "bn4b_branch2b/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4b_branch2b/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 256
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "bn4b_branch2b/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4b_branch2b/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn4b_branch2b/moving_variance/Assign"
  op: "Assign"
  input: "bn4b_branch2b/moving_variance"
  input: "bn4b_branch2b/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4b_branch2b/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn4b_branch2b/moving_variance/read"
  op: "Identity"
  input: "bn4b_branch2b/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4b_branch2b/moving_variance"
      }
    }
  }
}
node {
  name: "id_block_stage4/bn4b_branch2b/cond/Switch"
  op: "Switch"
  input: "Placeholder_2"
  input: "Placeholder_2"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "id_block_stage4/bn4b_branch2b/cond/switch_t"
  op: "Identity"
  input: "id_block_stage4/bn4b_branch2b/cond/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "id_block_stage4/bn4b_branch2b/cond/switch_f"
  op: "Identity"
  input: "id_block_stage4/bn4b_branch2b/cond/Switch"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "id_block_stage4/bn4b_branch2b/cond/pred_id"
  op: "Identity"
  input: "Placeholder_2"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "id_block_stage4/bn4b_branch2b/cond/Const"
  op: "Const"
  input: "^id_block_stage4/bn4b_branch2b/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "id_block_stage4/bn4b_branch2b/cond/Const_1"
  op: "Const"
  input: "^id_block_stage4/bn4b_branch2b/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "id_block_stage4/bn4b_branch2b/cond/FusedBatchNormV3"
  op: "FusedBatchNormV3"
  input: "id_block_stage4/bn4b_branch2b/cond/FusedBatchNormV3/Switch:1"
  input: "id_block_stage4/bn4b_branch2b/cond/FusedBatchNormV3/Switch_1:1"
  input: "id_block_stage4/bn4b_branch2b/cond/FusedBatchNormV3/Switch_2:1"
  input: "id_block_stage4/bn4b_branch2b/cond/Const"
  input: "id_block_stage4/bn4b_branch2b/cond/Const_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "U"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.0010000000474974513
    }
  }
  attr {
    key: "is_training"
    value {
      b: true
    }
  }
}
node {
  name: "id_block_stage4/bn4b_branch2b/cond/FusedBatchNormV3/Switch"
  op: "Switch"
  input: "id_block_stage4/res4b_branch2b/BiasAdd"
  input: "id_block_stage4/bn4b_branch2b/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@id_block_stage4/res4b_branch2b/BiasAdd"
      }
    }
  }
}
node {
  name: "id_block_stage4/bn4b_branch2b/cond/FusedBatchNormV3/Switch_1"
  op: "Switch"
  input: "bn4b_branch2b/gamma/read"
  input: "id_block_stage4/bn4b_branch2b/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4b_branch2b/gamma"
      }
    }
  }
}
node {
  name: "id_block_stage4/bn4b_branch2b/cond/FusedBatchNormV3/Switch_2"
  op: "Switch"
  input: "bn4b_branch2b/beta/read"
  input: "id_block_stage4/bn4b_branch2b/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4b_branch2b/beta"
      }
    }
  }
}
node {
  name: "id_block_stage4/bn4b_branch2b/cond/FusedBatchNormV3_1"
  op: "FusedBatchNormV3"
  input: "id_block_stage4/bn4b_branch2b/cond/FusedBatchNormV3_1/Switch"
  input: "id_block_stage4/bn4b_branch2b/cond/FusedBatchNormV3_1/Switch_1"
  input: "id_block_stage4/bn4b_branch2b/cond/FusedBatchNormV3_1/Switch_2"
  input: "id_block_stage4/bn4b_branch2b/cond/FusedBatchNormV3_1/Switch_3"
  input: "id_block_stage4/bn4b_branch2b/cond/FusedBatchNormV3_1/Switch_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "U"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.0010000000474974513
    }
  }
  attr {
    key: "is_training"
    value {
      b: false
    }
  }
}
node {
  name: "id_block_stage4/bn4b_branch2b/cond/FusedBatchNormV3_1/Switch"
  op: "Switch"
  input: "id_block_stage4/res4b_branch2b/BiasAdd"
  input: "id_block_stage4/bn4b_branch2b/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@id_block_stage4/res4b_branch2b/BiasAdd"
      }
    }
  }
}
node {
  name: "id_block_stage4/bn4b_branch2b/cond/FusedBatchNormV3_1/Switch_1"
  op: "Switch"
  input: "bn4b_branch2b/gamma/read"
  input: "id_block_stage4/bn4b_branch2b/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4b_branch2b/gamma"
      }
    }
  }
}
node {
  name: "id_block_stage4/bn4b_branch2b/cond/FusedBatchNormV3_1/Switch_2"
  op: "Switch"
  input: "bn4b_branch2b/beta/read"
  input: "id_block_stage4/bn4b_branch2b/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4b_branch2b/beta"
      }
    }
  }
}
node {
  name: "id_block_stage4/bn4b_branch2b/cond/FusedBatchNormV3_1/Switch_3"
  op: "Switch"
  input: "bn4b_branch2b/moving_mean/read"
  input: "id_block_stage4/bn4b_branch2b/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4b_branch2b/moving_mean"
      }
    }
  }
}
node {
  name: "id_block_stage4/bn4b_branch2b/cond/FusedBatchNormV3_1/Switch_4"
  op: "Switch"
  input: "bn4b_branch2b/moving_variance/read"
  input: "id_block_stage4/bn4b_branch2b/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4b_branch2b/moving_variance"
      }
    }
  }
}
node {
  name: "id_block_stage4/bn4b_branch2b/cond/Merge"
  op: "Merge"
  input: "id_block_stage4/bn4b_branch2b/cond/FusedBatchNormV3_1"
  input: "id_block_stage4/bn4b_branch2b/cond/FusedBatchNormV3"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "id_block_stage4/bn4b_branch2b/cond/Merge_1"
  op: "Merge"
  input: "id_block_stage4/bn4b_branch2b/cond/FusedBatchNormV3_1:1"
  input: "id_block_stage4/bn4b_branch2b/cond/FusedBatchNormV3:1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "id_block_stage4/bn4b_branch2b/cond/Merge_2"
  op: "Merge"
  input: "id_block_stage4/bn4b_branch2b/cond/FusedBatchNormV3_1:2"
  input: "id_block_stage4/bn4b_branch2b/cond/FusedBatchNormV3:2"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "id_block_stage4/bn4b_branch2b/cond_1/Switch"
  op: "Switch"
  input: "Placeholder_2"
  input: "Placeholder_2"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "id_block_stage4/bn4b_branch2b/cond_1/switch_t"
  op: "Identity"
  input: "id_block_stage4/bn4b_branch2b/cond_1/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "id_block_stage4/bn4b_branch2b/cond_1/switch_f"
  op: "Identity"
  input: "id_block_stage4/bn4b_branch2b/cond_1/Switch"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "id_block_stage4/bn4b_branch2b/cond_1/pred_id"
  op: "Identity"
  input: "Placeholder_2"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "id_block_stage4/bn4b_branch2b/cond_1/Const"
  op: "Const"
  input: "^id_block_stage4/bn4b_branch2b/cond_1/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.9900000095367432
      }
    }
  }
}
node {
  name: "id_block_stage4/bn4b_branch2b/cond_1/Const_1"
  op: "Const"
  input: "^id_block_stage4/bn4b_branch2b/cond_1/switch_f"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "id_block_stage4/bn4b_branch2b/cond_1/Merge"
  op: "Merge"
  input: "id_block_stage4/bn4b_branch2b/cond_1/Const_1"
  input: "id_block_stage4/bn4b_branch2b/cond_1/Const"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "id_block_stage4/bn4b_branch2b/AssignMovingAvg/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4b_branch2b/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "id_block_stage4/bn4b_branch2b/AssignMovingAvg/sub"
  op: "Sub"
  input: "id_block_stage4/bn4b_branch2b/AssignMovingAvg/sub/x"
  input: "id_block_stage4/bn4b_branch2b/cond_1/Merge"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4b_branch2b/moving_mean"
      }
    }
  }
}
node {
  name: "id_block_stage4/bn4b_branch2b/AssignMovingAvg/sub_1"
  op: "Sub"
  input: "bn4b_branch2b/moving_mean/read"
  input: "id_block_stage4/bn4b_branch2b/cond/Merge_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4b_branch2b/moving_mean"
      }
    }
  }
}
node {
  name: "id_block_stage4/bn4b_branch2b/AssignMovingAvg/mul"
  op: "Mul"
  input: "id_block_stage4/bn4b_branch2b/AssignMovingAvg/sub_1"
  input: "id_block_stage4/bn4b_branch2b/AssignMovingAvg/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4b_branch2b/moving_mean"
      }
    }
  }
}
node {
  name: "id_block_stage4/bn4b_branch2b/AssignMovingAvg"
  op: "AssignSub"
  input: "bn4b_branch2b/moving_mean"
  input: "id_block_stage4/bn4b_branch2b/AssignMovingAvg/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4b_branch2b/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "id_block_stage4/bn4b_branch2b/AssignMovingAvg_1/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4b_branch2b/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "id_block_stage4/bn4b_branch2b/AssignMovingAvg_1/sub"
  op: "Sub"
  input: "id_block_stage4/bn4b_branch2b/AssignMovingAvg_1/sub/x"
  input: "id_block_stage4/bn4b_branch2b/cond_1/Merge"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4b_branch2b/moving_variance"
      }
    }
  }
}
node {
  name: "id_block_stage4/bn4b_branch2b/AssignMovingAvg_1/sub_1"
  op: "Sub"
  input: "bn4b_branch2b/moving_variance/read"
  input: "id_block_stage4/bn4b_branch2b/cond/Merge_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4b_branch2b/moving_variance"
      }
    }
  }
}
node {
  name: "id_block_stage4/bn4b_branch2b/AssignMovingAvg_1/mul"
  op: "Mul"
  input: "id_block_stage4/bn4b_branch2b/AssignMovingAvg_1/sub_1"
  input: "id_block_stage4/bn4b_branch2b/AssignMovingAvg_1/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4b_branch2b/moving_variance"
      }
    }
  }
}
node {
  name: "id_block_stage4/bn4b_branch2b/AssignMovingAvg_1"
  op: "AssignSub"
  input: "bn4b_branch2b/moving_variance"
  input: "id_block_stage4/bn4b_branch2b/AssignMovingAvg_1/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4b_branch2b/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "id_block_stage4/Relu"
  op: "Relu"
  input: "id_block_stage4/bn4b_branch2b/cond/Merge"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "res4b_branch2c/kernel/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res4b_branch2c/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\000\001\000\000\000\001\000\000"
      }
    }
  }
}
node {
  name: "res4b_branch2c/kernel/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res4b_branch2c/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.03608439117670059
      }
    }
  }
}
node {
  name: "res4b_branch2c/kernel/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res4b_branch2c/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.03608439117670059
      }
    }
  }
}
node {
  name: "res4b_branch2c/kernel/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "res4b_branch2c/kernel/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res4b_branch2c/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "res4b_branch2c/kernel/Initializer/random_uniform/sub"
  op: "Sub"
  input: "res4b_branch2c/kernel/Initializer/random_uniform/max"
  input: "res4b_branch2c/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res4b_branch2c/kernel"
      }
    }
  }
}
node {
  name: "res4b_branch2c/kernel/Initializer/random_uniform/mul"
  op: "Mul"
  input: "res4b_branch2c/kernel/Initializer/random_uniform/RandomUniform"
  input: "res4b_branch2c/kernel/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res4b_branch2c/kernel"
      }
    }
  }
}
node {
  name: "res4b_branch2c/kernel/Initializer/random_uniform"
  op: "Add"
  input: "res4b_branch2c/kernel/Initializer/random_uniform/mul"
  input: "res4b_branch2c/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res4b_branch2c/kernel"
      }
    }
  }
}
node {
  name: "res4b_branch2c/kernel"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res4b_branch2c/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 256
        }
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "res4b_branch2c/kernel/Assign"
  op: "Assign"
  input: "res4b_branch2c/kernel"
  input: "res4b_branch2c/kernel/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res4b_branch2c/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "res4b_branch2c/kernel/read"
  op: "Identity"
  input: "res4b_branch2c/kernel"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res4b_branch2c/kernel"
      }
    }
  }
}
node {
  name: "id_block_stage4/res4b_branch2c/kernel/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0005000000237487257
      }
    }
  }
}
node {
  name: "id_block_stage4/res4b_branch2c/kernel/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "res4b_branch2c/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "id_block_stage4/res4b_branch2c/kernel/Regularizer/l2_regularizer"
  op: "Mul"
  input: "id_block_stage4/res4b_branch2c/kernel/Regularizer/l2_regularizer/scale"
  input: "id_block_stage4/res4b_branch2c/kernel/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "res4b_branch2c/bias/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res4b_branch2c/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 256
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "res4b_branch2c/bias"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res4b_branch2c/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "res4b_branch2c/bias/Assign"
  op: "Assign"
  input: "res4b_branch2c/bias"
  input: "res4b_branch2c/bias/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res4b_branch2c/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "res4b_branch2c/bias/read"
  op: "Identity"
  input: "res4b_branch2c/bias"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res4b_branch2c/bias"
      }
    }
  }
}
node {
  name: "id_block_stage4/res4b_branch2c/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "id_block_stage4/res4b_branch2c/Conv2D"
  op: "Conv2D"
  input: "id_block_stage4/Relu"
  input: "res4b_branch2c/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "id_block_stage4/res4b_branch2c/BiasAdd"
  op: "BiasAdd"
  input: "id_block_stage4/res4b_branch2c/Conv2D"
  input: "res4b_branch2c/bias/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "bn4b_branch2c/gamma/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4b_branch2c/gamma"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 256
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "bn4b_branch2c/gamma"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4b_branch2c/gamma"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn4b_branch2c/gamma/Assign"
  op: "Assign"
  input: "bn4b_branch2c/gamma"
  input: "bn4b_branch2c/gamma/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4b_branch2c/gamma"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn4b_branch2c/gamma/read"
  op: "Identity"
  input: "bn4b_branch2c/gamma"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4b_branch2c/gamma"
      }
    }
  }
}
node {
  name: "bn4b_branch2c/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4b_branch2c/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 256
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "bn4b_branch2c/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4b_branch2c/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn4b_branch2c/beta/Assign"
  op: "Assign"
  input: "bn4b_branch2c/beta"
  input: "bn4b_branch2c/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4b_branch2c/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn4b_branch2c/beta/read"
  op: "Identity"
  input: "bn4b_branch2c/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4b_branch2c/beta"
      }
    }
  }
}
node {
  name: "bn4b_branch2c/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4b_branch2c/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 256
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "bn4b_branch2c/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4b_branch2c/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn4b_branch2c/moving_mean/Assign"
  op: "Assign"
  input: "bn4b_branch2c/moving_mean"
  input: "bn4b_branch2c/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4b_branch2c/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn4b_branch2c/moving_mean/read"
  op: "Identity"
  input: "bn4b_branch2c/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4b_branch2c/moving_mean"
      }
    }
  }
}
node {
  name: "bn4b_branch2c/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4b_branch2c/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 256
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "bn4b_branch2c/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4b_branch2c/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn4b_branch2c/moving_variance/Assign"
  op: "Assign"
  input: "bn4b_branch2c/moving_variance"
  input: "bn4b_branch2c/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4b_branch2c/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn4b_branch2c/moving_variance/read"
  op: "Identity"
  input: "bn4b_branch2c/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4b_branch2c/moving_variance"
      }
    }
  }
}
node {
  name: "id_block_stage4/bn4b_branch2c/cond/Switch"
  op: "Switch"
  input: "Placeholder_2"
  input: "Placeholder_2"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "id_block_stage4/bn4b_branch2c/cond/switch_t"
  op: "Identity"
  input: "id_block_stage4/bn4b_branch2c/cond/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "id_block_stage4/bn4b_branch2c/cond/switch_f"
  op: "Identity"
  input: "id_block_stage4/bn4b_branch2c/cond/Switch"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "id_block_stage4/bn4b_branch2c/cond/pred_id"
  op: "Identity"
  input: "Placeholder_2"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "id_block_stage4/bn4b_branch2c/cond/Const"
  op: "Const"
  input: "^id_block_stage4/bn4b_branch2c/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "id_block_stage4/bn4b_branch2c/cond/Const_1"
  op: "Const"
  input: "^id_block_stage4/bn4b_branch2c/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "id_block_stage4/bn4b_branch2c/cond/FusedBatchNormV3"
  op: "FusedBatchNormV3"
  input: "id_block_stage4/bn4b_branch2c/cond/FusedBatchNormV3/Switch:1"
  input: "id_block_stage4/bn4b_branch2c/cond/FusedBatchNormV3/Switch_1:1"
  input: "id_block_stage4/bn4b_branch2c/cond/FusedBatchNormV3/Switch_2:1"
  input: "id_block_stage4/bn4b_branch2c/cond/Const"
  input: "id_block_stage4/bn4b_branch2c/cond/Const_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "U"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.0010000000474974513
    }
  }
  attr {
    key: "is_training"
    value {
      b: true
    }
  }
}
node {
  name: "id_block_stage4/bn4b_branch2c/cond/FusedBatchNormV3/Switch"
  op: "Switch"
  input: "id_block_stage4/res4b_branch2c/BiasAdd"
  input: "id_block_stage4/bn4b_branch2c/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@id_block_stage4/res4b_branch2c/BiasAdd"
      }
    }
  }
}
node {
  name: "id_block_stage4/bn4b_branch2c/cond/FusedBatchNormV3/Switch_1"
  op: "Switch"
  input: "bn4b_branch2c/gamma/read"
  input: "id_block_stage4/bn4b_branch2c/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4b_branch2c/gamma"
      }
    }
  }
}
node {
  name: "id_block_stage4/bn4b_branch2c/cond/FusedBatchNormV3/Switch_2"
  op: "Switch"
  input: "bn4b_branch2c/beta/read"
  input: "id_block_stage4/bn4b_branch2c/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4b_branch2c/beta"
      }
    }
  }
}
node {
  name: "id_block_stage4/bn4b_branch2c/cond/FusedBatchNormV3_1"
  op: "FusedBatchNormV3"
  input: "id_block_stage4/bn4b_branch2c/cond/FusedBatchNormV3_1/Switch"
  input: "id_block_stage4/bn4b_branch2c/cond/FusedBatchNormV3_1/Switch_1"
  input: "id_block_stage4/bn4b_branch2c/cond/FusedBatchNormV3_1/Switch_2"
  input: "id_block_stage4/bn4b_branch2c/cond/FusedBatchNormV3_1/Switch_3"
  input: "id_block_stage4/bn4b_branch2c/cond/FusedBatchNormV3_1/Switch_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "U"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.0010000000474974513
    }
  }
  attr {
    key: "is_training"
    value {
      b: false
    }
  }
}
node {
  name: "id_block_stage4/bn4b_branch2c/cond/FusedBatchNormV3_1/Switch"
  op: "Switch"
  input: "id_block_stage4/res4b_branch2c/BiasAdd"
  input: "id_block_stage4/bn4b_branch2c/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@id_block_stage4/res4b_branch2c/BiasAdd"
      }
    }
  }
}
node {
  name: "id_block_stage4/bn4b_branch2c/cond/FusedBatchNormV3_1/Switch_1"
  op: "Switch"
  input: "bn4b_branch2c/gamma/read"
  input: "id_block_stage4/bn4b_branch2c/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4b_branch2c/gamma"
      }
    }
  }
}
node {
  name: "id_block_stage4/bn4b_branch2c/cond/FusedBatchNormV3_1/Switch_2"
  op: "Switch"
  input: "bn4b_branch2c/beta/read"
  input: "id_block_stage4/bn4b_branch2c/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4b_branch2c/beta"
      }
    }
  }
}
node {
  name: "id_block_stage4/bn4b_branch2c/cond/FusedBatchNormV3_1/Switch_3"
  op: "Switch"
  input: "bn4b_branch2c/moving_mean/read"
  input: "id_block_stage4/bn4b_branch2c/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4b_branch2c/moving_mean"
      }
    }
  }
}
node {
  name: "id_block_stage4/bn4b_branch2c/cond/FusedBatchNormV3_1/Switch_4"
  op: "Switch"
  input: "bn4b_branch2c/moving_variance/read"
  input: "id_block_stage4/bn4b_branch2c/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4b_branch2c/moving_variance"
      }
    }
  }
}
node {
  name: "id_block_stage4/bn4b_branch2c/cond/Merge"
  op: "Merge"
  input: "id_block_stage4/bn4b_branch2c/cond/FusedBatchNormV3_1"
  input: "id_block_stage4/bn4b_branch2c/cond/FusedBatchNormV3"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "id_block_stage4/bn4b_branch2c/cond/Merge_1"
  op: "Merge"
  input: "id_block_stage4/bn4b_branch2c/cond/FusedBatchNormV3_1:1"
  input: "id_block_stage4/bn4b_branch2c/cond/FusedBatchNormV3:1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "id_block_stage4/bn4b_branch2c/cond/Merge_2"
  op: "Merge"
  input: "id_block_stage4/bn4b_branch2c/cond/FusedBatchNormV3_1:2"
  input: "id_block_stage4/bn4b_branch2c/cond/FusedBatchNormV3:2"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "id_block_stage4/bn4b_branch2c/cond_1/Switch"
  op: "Switch"
  input: "Placeholder_2"
  input: "Placeholder_2"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "id_block_stage4/bn4b_branch2c/cond_1/switch_t"
  op: "Identity"
  input: "id_block_stage4/bn4b_branch2c/cond_1/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "id_block_stage4/bn4b_branch2c/cond_1/switch_f"
  op: "Identity"
  input: "id_block_stage4/bn4b_branch2c/cond_1/Switch"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "id_block_stage4/bn4b_branch2c/cond_1/pred_id"
  op: "Identity"
  input: "Placeholder_2"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "id_block_stage4/bn4b_branch2c/cond_1/Const"
  op: "Const"
  input: "^id_block_stage4/bn4b_branch2c/cond_1/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.9900000095367432
      }
    }
  }
}
node {
  name: "id_block_stage4/bn4b_branch2c/cond_1/Const_1"
  op: "Const"
  input: "^id_block_stage4/bn4b_branch2c/cond_1/switch_f"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "id_block_stage4/bn4b_branch2c/cond_1/Merge"
  op: "Merge"
  input: "id_block_stage4/bn4b_branch2c/cond_1/Const_1"
  input: "id_block_stage4/bn4b_branch2c/cond_1/Const"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "id_block_stage4/bn4b_branch2c/AssignMovingAvg/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4b_branch2c/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "id_block_stage4/bn4b_branch2c/AssignMovingAvg/sub"
  op: "Sub"
  input: "id_block_stage4/bn4b_branch2c/AssignMovingAvg/sub/x"
  input: "id_block_stage4/bn4b_branch2c/cond_1/Merge"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4b_branch2c/moving_mean"
      }
    }
  }
}
node {
  name: "id_block_stage4/bn4b_branch2c/AssignMovingAvg/sub_1"
  op: "Sub"
  input: "bn4b_branch2c/moving_mean/read"
  input: "id_block_stage4/bn4b_branch2c/cond/Merge_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4b_branch2c/moving_mean"
      }
    }
  }
}
node {
  name: "id_block_stage4/bn4b_branch2c/AssignMovingAvg/mul"
  op: "Mul"
  input: "id_block_stage4/bn4b_branch2c/AssignMovingAvg/sub_1"
  input: "id_block_stage4/bn4b_branch2c/AssignMovingAvg/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4b_branch2c/moving_mean"
      }
    }
  }
}
node {
  name: "id_block_stage4/bn4b_branch2c/AssignMovingAvg"
  op: "AssignSub"
  input: "bn4b_branch2c/moving_mean"
  input: "id_block_stage4/bn4b_branch2c/AssignMovingAvg/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4b_branch2c/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "id_block_stage4/bn4b_branch2c/AssignMovingAvg_1/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4b_branch2c/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "id_block_stage4/bn4b_branch2c/AssignMovingAvg_1/sub"
  op: "Sub"
  input: "id_block_stage4/bn4b_branch2c/AssignMovingAvg_1/sub/x"
  input: "id_block_stage4/bn4b_branch2c/cond_1/Merge"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4b_branch2c/moving_variance"
      }
    }
  }
}
node {
  name: "id_block_stage4/bn4b_branch2c/AssignMovingAvg_1/sub_1"
  op: "Sub"
  input: "bn4b_branch2c/moving_variance/read"
  input: "id_block_stage4/bn4b_branch2c/cond/Merge_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4b_branch2c/moving_variance"
      }
    }
  }
}
node {
  name: "id_block_stage4/bn4b_branch2c/AssignMovingAvg_1/mul"
  op: "Mul"
  input: "id_block_stage4/bn4b_branch2c/AssignMovingAvg_1/sub_1"
  input: "id_block_stage4/bn4b_branch2c/AssignMovingAvg_1/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4b_branch2c/moving_variance"
      }
    }
  }
}
node {
  name: "id_block_stage4/bn4b_branch2c/AssignMovingAvg_1"
  op: "AssignSub"
  input: "bn4b_branch2c/moving_variance"
  input: "id_block_stage4/bn4b_branch2c/AssignMovingAvg_1/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4b_branch2c/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "id_block_stage4/Add"
  op: "Add"
  input: "id_block_stage4/bn4b_branch2c/cond/Merge"
  input: "conv_block_stage4/Relu_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "id_block_stage4/Relu_1"
  op: "Relu"
  input: "id_block_stage4/Add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "res5a_branch2a/kernel/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res5a_branch2a/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\000\001\000\000\000\002\000\000"
      }
    }
  }
}
node {
  name: "res5a_branch2a/kernel/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res5a_branch2a/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.02946278266608715
      }
    }
  }
}
node {
  name: "res5a_branch2a/kernel/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res5a_branch2a/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.02946278266608715
      }
    }
  }
}
node {
  name: "res5a_branch2a/kernel/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "res5a_branch2a/kernel/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res5a_branch2a/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "res5a_branch2a/kernel/Initializer/random_uniform/sub"
  op: "Sub"
  input: "res5a_branch2a/kernel/Initializer/random_uniform/max"
  input: "res5a_branch2a/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res5a_branch2a/kernel"
      }
    }
  }
}
node {
  name: "res5a_branch2a/kernel/Initializer/random_uniform/mul"
  op: "Mul"
  input: "res5a_branch2a/kernel/Initializer/random_uniform/RandomUniform"
  input: "res5a_branch2a/kernel/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res5a_branch2a/kernel"
      }
    }
  }
}
node {
  name: "res5a_branch2a/kernel/Initializer/random_uniform"
  op: "Add"
  input: "res5a_branch2a/kernel/Initializer/random_uniform/mul"
  input: "res5a_branch2a/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res5a_branch2a/kernel"
      }
    }
  }
}
node {
  name: "res5a_branch2a/kernel"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res5a_branch2a/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 256
        }
        dim {
          size: 512
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "res5a_branch2a/kernel/Assign"
  op: "Assign"
  input: "res5a_branch2a/kernel"
  input: "res5a_branch2a/kernel/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res5a_branch2a/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "res5a_branch2a/kernel/read"
  op: "Identity"
  input: "res5a_branch2a/kernel"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res5a_branch2a/kernel"
      }
    }
  }
}
node {
  name: "conv_block_stage5/res5a_branch2a/kernel/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0005000000237487257
      }
    }
  }
}
node {
  name: "conv_block_stage5/res5a_branch2a/kernel/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "res5a_branch2a/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv_block_stage5/res5a_branch2a/kernel/Regularizer/l2_regularizer"
  op: "Mul"
  input: "conv_block_stage5/res5a_branch2a/kernel/Regularizer/l2_regularizer/scale"
  input: "conv_block_stage5/res5a_branch2a/kernel/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "res5a_branch2a/bias/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res5a_branch2a/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 512
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "res5a_branch2a/bias"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res5a_branch2a/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 512
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "res5a_branch2a/bias/Assign"
  op: "Assign"
  input: "res5a_branch2a/bias"
  input: "res5a_branch2a/bias/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res5a_branch2a/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "res5a_branch2a/bias/read"
  op: "Identity"
  input: "res5a_branch2a/bias"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res5a_branch2a/bias"
      }
    }
  }
}
node {
  name: "conv_block_stage5/res5a_branch2a/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "conv_block_stage5/res5a_branch2a/Conv2D"
  op: "Conv2D"
  input: "id_block_stage4/Relu_1"
  input: "res5a_branch2a/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "conv_block_stage5/res5a_branch2a/BiasAdd"
  op: "BiasAdd"
  input: "conv_block_stage5/res5a_branch2a/Conv2D"
  input: "res5a_branch2a/bias/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "bn5a_branch2a/gamma/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch2a/gamma"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 512
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "bn5a_branch2a/gamma"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch2a/gamma"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 512
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn5a_branch2a/gamma/Assign"
  op: "Assign"
  input: "bn5a_branch2a/gamma"
  input: "bn5a_branch2a/gamma/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch2a/gamma"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn5a_branch2a/gamma/read"
  op: "Identity"
  input: "bn5a_branch2a/gamma"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch2a/gamma"
      }
    }
  }
}
node {
  name: "bn5a_branch2a/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch2a/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 512
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "bn5a_branch2a/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch2a/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 512
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn5a_branch2a/beta/Assign"
  op: "Assign"
  input: "bn5a_branch2a/beta"
  input: "bn5a_branch2a/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch2a/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn5a_branch2a/beta/read"
  op: "Identity"
  input: "bn5a_branch2a/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch2a/beta"
      }
    }
  }
}
node {
  name: "bn5a_branch2a/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch2a/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 512
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "bn5a_branch2a/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch2a/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 512
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn5a_branch2a/moving_mean/Assign"
  op: "Assign"
  input: "bn5a_branch2a/moving_mean"
  input: "bn5a_branch2a/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch2a/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn5a_branch2a/moving_mean/read"
  op: "Identity"
  input: "bn5a_branch2a/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch2a/moving_mean"
      }
    }
  }
}
node {
  name: "bn5a_branch2a/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch2a/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 512
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "bn5a_branch2a/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch2a/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 512
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn5a_branch2a/moving_variance/Assign"
  op: "Assign"
  input: "bn5a_branch2a/moving_variance"
  input: "bn5a_branch2a/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch2a/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn5a_branch2a/moving_variance/read"
  op: "Identity"
  input: "bn5a_branch2a/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch2a/moving_variance"
      }
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch2a/cond/Switch"
  op: "Switch"
  input: "Placeholder_2"
  input: "Placeholder_2"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch2a/cond/switch_t"
  op: "Identity"
  input: "conv_block_stage5/bn5a_branch2a/cond/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch2a/cond/switch_f"
  op: "Identity"
  input: "conv_block_stage5/bn5a_branch2a/cond/Switch"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch2a/cond/pred_id"
  op: "Identity"
  input: "Placeholder_2"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch2a/cond/Const"
  op: "Const"
  input: "^conv_block_stage5/bn5a_branch2a/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch2a/cond/Const_1"
  op: "Const"
  input: "^conv_block_stage5/bn5a_branch2a/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch2a/cond/FusedBatchNormV3"
  op: "FusedBatchNormV3"
  input: "conv_block_stage5/bn5a_branch2a/cond/FusedBatchNormV3/Switch:1"
  input: "conv_block_stage5/bn5a_branch2a/cond/FusedBatchNormV3/Switch_1:1"
  input: "conv_block_stage5/bn5a_branch2a/cond/FusedBatchNormV3/Switch_2:1"
  input: "conv_block_stage5/bn5a_branch2a/cond/Const"
  input: "conv_block_stage5/bn5a_branch2a/cond/Const_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "U"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.0010000000474974513
    }
  }
  attr {
    key: "is_training"
    value {
      b: true
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch2a/cond/FusedBatchNormV3/Switch"
  op: "Switch"
  input: "conv_block_stage5/res5a_branch2a/BiasAdd"
  input: "conv_block_stage5/bn5a_branch2a/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_block_stage5/res5a_branch2a/BiasAdd"
      }
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch2a/cond/FusedBatchNormV3/Switch_1"
  op: "Switch"
  input: "bn5a_branch2a/gamma/read"
  input: "conv_block_stage5/bn5a_branch2a/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch2a/gamma"
      }
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch2a/cond/FusedBatchNormV3/Switch_2"
  op: "Switch"
  input: "bn5a_branch2a/beta/read"
  input: "conv_block_stage5/bn5a_branch2a/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch2a/beta"
      }
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch2a/cond/FusedBatchNormV3_1"
  op: "FusedBatchNormV3"
  input: "conv_block_stage5/bn5a_branch2a/cond/FusedBatchNormV3_1/Switch"
  input: "conv_block_stage5/bn5a_branch2a/cond/FusedBatchNormV3_1/Switch_1"
  input: "conv_block_stage5/bn5a_branch2a/cond/FusedBatchNormV3_1/Switch_2"
  input: "conv_block_stage5/bn5a_branch2a/cond/FusedBatchNormV3_1/Switch_3"
  input: "conv_block_stage5/bn5a_branch2a/cond/FusedBatchNormV3_1/Switch_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "U"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.0010000000474974513
    }
  }
  attr {
    key: "is_training"
    value {
      b: false
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch2a/cond/FusedBatchNormV3_1/Switch"
  op: "Switch"
  input: "conv_block_stage5/res5a_branch2a/BiasAdd"
  input: "conv_block_stage5/bn5a_branch2a/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_block_stage5/res5a_branch2a/BiasAdd"
      }
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch2a/cond/FusedBatchNormV3_1/Switch_1"
  op: "Switch"
  input: "bn5a_branch2a/gamma/read"
  input: "conv_block_stage5/bn5a_branch2a/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch2a/gamma"
      }
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch2a/cond/FusedBatchNormV3_1/Switch_2"
  op: "Switch"
  input: "bn5a_branch2a/beta/read"
  input: "conv_block_stage5/bn5a_branch2a/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch2a/beta"
      }
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch2a/cond/FusedBatchNormV3_1/Switch_3"
  op: "Switch"
  input: "bn5a_branch2a/moving_mean/read"
  input: "conv_block_stage5/bn5a_branch2a/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch2a/moving_mean"
      }
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch2a/cond/FusedBatchNormV3_1/Switch_4"
  op: "Switch"
  input: "bn5a_branch2a/moving_variance/read"
  input: "conv_block_stage5/bn5a_branch2a/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch2a/moving_variance"
      }
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch2a/cond/Merge"
  op: "Merge"
  input: "conv_block_stage5/bn5a_branch2a/cond/FusedBatchNormV3_1"
  input: "conv_block_stage5/bn5a_branch2a/cond/FusedBatchNormV3"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch2a/cond/Merge_1"
  op: "Merge"
  input: "conv_block_stage5/bn5a_branch2a/cond/FusedBatchNormV3_1:1"
  input: "conv_block_stage5/bn5a_branch2a/cond/FusedBatchNormV3:1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch2a/cond/Merge_2"
  op: "Merge"
  input: "conv_block_stage5/bn5a_branch2a/cond/FusedBatchNormV3_1:2"
  input: "conv_block_stage5/bn5a_branch2a/cond/FusedBatchNormV3:2"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch2a/cond_1/Switch"
  op: "Switch"
  input: "Placeholder_2"
  input: "Placeholder_2"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch2a/cond_1/switch_t"
  op: "Identity"
  input: "conv_block_stage5/bn5a_branch2a/cond_1/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch2a/cond_1/switch_f"
  op: "Identity"
  input: "conv_block_stage5/bn5a_branch2a/cond_1/Switch"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch2a/cond_1/pred_id"
  op: "Identity"
  input: "Placeholder_2"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch2a/cond_1/Const"
  op: "Const"
  input: "^conv_block_stage5/bn5a_branch2a/cond_1/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.9900000095367432
      }
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch2a/cond_1/Const_1"
  op: "Const"
  input: "^conv_block_stage5/bn5a_branch2a/cond_1/switch_f"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch2a/cond_1/Merge"
  op: "Merge"
  input: "conv_block_stage5/bn5a_branch2a/cond_1/Const_1"
  input: "conv_block_stage5/bn5a_branch2a/cond_1/Const"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch2a/AssignMovingAvg/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch2a/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch2a/AssignMovingAvg/sub"
  op: "Sub"
  input: "conv_block_stage5/bn5a_branch2a/AssignMovingAvg/sub/x"
  input: "conv_block_stage5/bn5a_branch2a/cond_1/Merge"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch2a/moving_mean"
      }
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch2a/AssignMovingAvg/sub_1"
  op: "Sub"
  input: "bn5a_branch2a/moving_mean/read"
  input: "conv_block_stage5/bn5a_branch2a/cond/Merge_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch2a/moving_mean"
      }
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch2a/AssignMovingAvg/mul"
  op: "Mul"
  input: "conv_block_stage5/bn5a_branch2a/AssignMovingAvg/sub_1"
  input: "conv_block_stage5/bn5a_branch2a/AssignMovingAvg/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch2a/moving_mean"
      }
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch2a/AssignMovingAvg"
  op: "AssignSub"
  input: "bn5a_branch2a/moving_mean"
  input: "conv_block_stage5/bn5a_branch2a/AssignMovingAvg/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch2a/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch2a/AssignMovingAvg_1/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch2a/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch2a/AssignMovingAvg_1/sub"
  op: "Sub"
  input: "conv_block_stage5/bn5a_branch2a/AssignMovingAvg_1/sub/x"
  input: "conv_block_stage5/bn5a_branch2a/cond_1/Merge"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch2a/moving_variance"
      }
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch2a/AssignMovingAvg_1/sub_1"
  op: "Sub"
  input: "bn5a_branch2a/moving_variance/read"
  input: "conv_block_stage5/bn5a_branch2a/cond/Merge_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch2a/moving_variance"
      }
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch2a/AssignMovingAvg_1/mul"
  op: "Mul"
  input: "conv_block_stage5/bn5a_branch2a/AssignMovingAvg_1/sub_1"
  input: "conv_block_stage5/bn5a_branch2a/AssignMovingAvg_1/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch2a/moving_variance"
      }
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch2a/AssignMovingAvg_1"
  op: "AssignSub"
  input: "bn5a_branch2a/moving_variance"
  input: "conv_block_stage5/bn5a_branch2a/AssignMovingAvg_1/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch2a/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "conv_block_stage5/Relu"
  op: "Relu"
  input: "conv_block_stage5/bn5a_branch2a/cond/Merge"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "res5a_branch2b/kernel/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res5a_branch2b/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\000\002\000\000\000\002\000\000"
      }
    }
  }
}
node {
  name: "res5a_branch2b/kernel/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res5a_branch2b/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.025515519082546234
      }
    }
  }
}
node {
  name: "res5a_branch2b/kernel/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res5a_branch2b/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.025515519082546234
      }
    }
  }
}
node {
  name: "res5a_branch2b/kernel/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "res5a_branch2b/kernel/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res5a_branch2b/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "res5a_branch2b/kernel/Initializer/random_uniform/sub"
  op: "Sub"
  input: "res5a_branch2b/kernel/Initializer/random_uniform/max"
  input: "res5a_branch2b/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res5a_branch2b/kernel"
      }
    }
  }
}
node {
  name: "res5a_branch2b/kernel/Initializer/random_uniform/mul"
  op: "Mul"
  input: "res5a_branch2b/kernel/Initializer/random_uniform/RandomUniform"
  input: "res5a_branch2b/kernel/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res5a_branch2b/kernel"
      }
    }
  }
}
node {
  name: "res5a_branch2b/kernel/Initializer/random_uniform"
  op: "Add"
  input: "res5a_branch2b/kernel/Initializer/random_uniform/mul"
  input: "res5a_branch2b/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res5a_branch2b/kernel"
      }
    }
  }
}
node {
  name: "res5a_branch2b/kernel"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res5a_branch2b/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 512
        }
        dim {
          size: 512
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "res5a_branch2b/kernel/Assign"
  op: "Assign"
  input: "res5a_branch2b/kernel"
  input: "res5a_branch2b/kernel/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res5a_branch2b/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "res5a_branch2b/kernel/read"
  op: "Identity"
  input: "res5a_branch2b/kernel"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res5a_branch2b/kernel"
      }
    }
  }
}
node {
  name: "conv_block_stage5/res5a_branch2b/kernel/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0005000000237487257
      }
    }
  }
}
node {
  name: "conv_block_stage5/res5a_branch2b/kernel/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "res5a_branch2b/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv_block_stage5/res5a_branch2b/kernel/Regularizer/l2_regularizer"
  op: "Mul"
  input: "conv_block_stage5/res5a_branch2b/kernel/Regularizer/l2_regularizer/scale"
  input: "conv_block_stage5/res5a_branch2b/kernel/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "res5a_branch2b/bias/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res5a_branch2b/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 512
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "res5a_branch2b/bias"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res5a_branch2b/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 512
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "res5a_branch2b/bias/Assign"
  op: "Assign"
  input: "res5a_branch2b/bias"
  input: "res5a_branch2b/bias/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res5a_branch2b/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "res5a_branch2b/bias/read"
  op: "Identity"
  input: "res5a_branch2b/bias"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res5a_branch2b/bias"
      }
    }
  }
}
node {
  name: "conv_block_stage5/res5a_branch2b/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "conv_block_stage5/res5a_branch2b/Conv2D"
  op: "Conv2D"
  input: "conv_block_stage5/Relu"
  input: "res5a_branch2b/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "conv_block_stage5/res5a_branch2b/BiasAdd"
  op: "BiasAdd"
  input: "conv_block_stage5/res5a_branch2b/Conv2D"
  input: "res5a_branch2b/bias/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "bn5a_branch2b/gamma/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch2b/gamma"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 512
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "bn5a_branch2b/gamma"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch2b/gamma"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 512
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn5a_branch2b/gamma/Assign"
  op: "Assign"
  input: "bn5a_branch2b/gamma"
  input: "bn5a_branch2b/gamma/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch2b/gamma"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn5a_branch2b/gamma/read"
  op: "Identity"
  input: "bn5a_branch2b/gamma"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch2b/gamma"
      }
    }
  }
}
node {
  name: "bn5a_branch2b/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch2b/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 512
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "bn5a_branch2b/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch2b/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 512
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn5a_branch2b/beta/Assign"
  op: "Assign"
  input: "bn5a_branch2b/beta"
  input: "bn5a_branch2b/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch2b/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn5a_branch2b/beta/read"
  op: "Identity"
  input: "bn5a_branch2b/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch2b/beta"
      }
    }
  }
}
node {
  name: "bn5a_branch2b/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch2b/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 512
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "bn5a_branch2b/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch2b/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 512
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn5a_branch2b/moving_mean/Assign"
  op: "Assign"
  input: "bn5a_branch2b/moving_mean"
  input: "bn5a_branch2b/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch2b/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn5a_branch2b/moving_mean/read"
  op: "Identity"
  input: "bn5a_branch2b/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch2b/moving_mean"
      }
    }
  }
}
node {
  name: "bn5a_branch2b/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch2b/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 512
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "bn5a_branch2b/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch2b/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 512
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn5a_branch2b/moving_variance/Assign"
  op: "Assign"
  input: "bn5a_branch2b/moving_variance"
  input: "bn5a_branch2b/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch2b/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn5a_branch2b/moving_variance/read"
  op: "Identity"
  input: "bn5a_branch2b/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch2b/moving_variance"
      }
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch2b/cond/Switch"
  op: "Switch"
  input: "Placeholder_2"
  input: "Placeholder_2"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch2b/cond/switch_t"
  op: "Identity"
  input: "conv_block_stage5/bn5a_branch2b/cond/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch2b/cond/switch_f"
  op: "Identity"
  input: "conv_block_stage5/bn5a_branch2b/cond/Switch"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch2b/cond/pred_id"
  op: "Identity"
  input: "Placeholder_2"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch2b/cond/Const"
  op: "Const"
  input: "^conv_block_stage5/bn5a_branch2b/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch2b/cond/Const_1"
  op: "Const"
  input: "^conv_block_stage5/bn5a_branch2b/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch2b/cond/FusedBatchNormV3"
  op: "FusedBatchNormV3"
  input: "conv_block_stage5/bn5a_branch2b/cond/FusedBatchNormV3/Switch:1"
  input: "conv_block_stage5/bn5a_branch2b/cond/FusedBatchNormV3/Switch_1:1"
  input: "conv_block_stage5/bn5a_branch2b/cond/FusedBatchNormV3/Switch_2:1"
  input: "conv_block_stage5/bn5a_branch2b/cond/Const"
  input: "conv_block_stage5/bn5a_branch2b/cond/Const_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "U"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.0010000000474974513
    }
  }
  attr {
    key: "is_training"
    value {
      b: true
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch2b/cond/FusedBatchNormV3/Switch"
  op: "Switch"
  input: "conv_block_stage5/res5a_branch2b/BiasAdd"
  input: "conv_block_stage5/bn5a_branch2b/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_block_stage5/res5a_branch2b/BiasAdd"
      }
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch2b/cond/FusedBatchNormV3/Switch_1"
  op: "Switch"
  input: "bn5a_branch2b/gamma/read"
  input: "conv_block_stage5/bn5a_branch2b/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch2b/gamma"
      }
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch2b/cond/FusedBatchNormV3/Switch_2"
  op: "Switch"
  input: "bn5a_branch2b/beta/read"
  input: "conv_block_stage5/bn5a_branch2b/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch2b/beta"
      }
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch2b/cond/FusedBatchNormV3_1"
  op: "FusedBatchNormV3"
  input: "conv_block_stage5/bn5a_branch2b/cond/FusedBatchNormV3_1/Switch"
  input: "conv_block_stage5/bn5a_branch2b/cond/FusedBatchNormV3_1/Switch_1"
  input: "conv_block_stage5/bn5a_branch2b/cond/FusedBatchNormV3_1/Switch_2"
  input: "conv_block_stage5/bn5a_branch2b/cond/FusedBatchNormV3_1/Switch_3"
  input: "conv_block_stage5/bn5a_branch2b/cond/FusedBatchNormV3_1/Switch_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "U"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.0010000000474974513
    }
  }
  attr {
    key: "is_training"
    value {
      b: false
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch2b/cond/FusedBatchNormV3_1/Switch"
  op: "Switch"
  input: "conv_block_stage5/res5a_branch2b/BiasAdd"
  input: "conv_block_stage5/bn5a_branch2b/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_block_stage5/res5a_branch2b/BiasAdd"
      }
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch2b/cond/FusedBatchNormV3_1/Switch_1"
  op: "Switch"
  input: "bn5a_branch2b/gamma/read"
  input: "conv_block_stage5/bn5a_branch2b/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch2b/gamma"
      }
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch2b/cond/FusedBatchNormV3_1/Switch_2"
  op: "Switch"
  input: "bn5a_branch2b/beta/read"
  input: "conv_block_stage5/bn5a_branch2b/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch2b/beta"
      }
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch2b/cond/FusedBatchNormV3_1/Switch_3"
  op: "Switch"
  input: "bn5a_branch2b/moving_mean/read"
  input: "conv_block_stage5/bn5a_branch2b/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch2b/moving_mean"
      }
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch2b/cond/FusedBatchNormV3_1/Switch_4"
  op: "Switch"
  input: "bn5a_branch2b/moving_variance/read"
  input: "conv_block_stage5/bn5a_branch2b/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch2b/moving_variance"
      }
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch2b/cond/Merge"
  op: "Merge"
  input: "conv_block_stage5/bn5a_branch2b/cond/FusedBatchNormV3_1"
  input: "conv_block_stage5/bn5a_branch2b/cond/FusedBatchNormV3"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch2b/cond/Merge_1"
  op: "Merge"
  input: "conv_block_stage5/bn5a_branch2b/cond/FusedBatchNormV3_1:1"
  input: "conv_block_stage5/bn5a_branch2b/cond/FusedBatchNormV3:1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch2b/cond/Merge_2"
  op: "Merge"
  input: "conv_block_stage5/bn5a_branch2b/cond/FusedBatchNormV3_1:2"
  input: "conv_block_stage5/bn5a_branch2b/cond/FusedBatchNormV3:2"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch2b/cond_1/Switch"
  op: "Switch"
  input: "Placeholder_2"
  input: "Placeholder_2"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch2b/cond_1/switch_t"
  op: "Identity"
  input: "conv_block_stage5/bn5a_branch2b/cond_1/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch2b/cond_1/switch_f"
  op: "Identity"
  input: "conv_block_stage5/bn5a_branch2b/cond_1/Switch"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch2b/cond_1/pred_id"
  op: "Identity"
  input: "Placeholder_2"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch2b/cond_1/Const"
  op: "Const"
  input: "^conv_block_stage5/bn5a_branch2b/cond_1/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.9900000095367432
      }
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch2b/cond_1/Const_1"
  op: "Const"
  input: "^conv_block_stage5/bn5a_branch2b/cond_1/switch_f"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch2b/cond_1/Merge"
  op: "Merge"
  input: "conv_block_stage5/bn5a_branch2b/cond_1/Const_1"
  input: "conv_block_stage5/bn5a_branch2b/cond_1/Const"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch2b/AssignMovingAvg/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch2b/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch2b/AssignMovingAvg/sub"
  op: "Sub"
  input: "conv_block_stage5/bn5a_branch2b/AssignMovingAvg/sub/x"
  input: "conv_block_stage5/bn5a_branch2b/cond_1/Merge"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch2b/moving_mean"
      }
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch2b/AssignMovingAvg/sub_1"
  op: "Sub"
  input: "bn5a_branch2b/moving_mean/read"
  input: "conv_block_stage5/bn5a_branch2b/cond/Merge_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch2b/moving_mean"
      }
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch2b/AssignMovingAvg/mul"
  op: "Mul"
  input: "conv_block_stage5/bn5a_branch2b/AssignMovingAvg/sub_1"
  input: "conv_block_stage5/bn5a_branch2b/AssignMovingAvg/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch2b/moving_mean"
      }
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch2b/AssignMovingAvg"
  op: "AssignSub"
  input: "bn5a_branch2b/moving_mean"
  input: "conv_block_stage5/bn5a_branch2b/AssignMovingAvg/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch2b/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch2b/AssignMovingAvg_1/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch2b/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch2b/AssignMovingAvg_1/sub"
  op: "Sub"
  input: "conv_block_stage5/bn5a_branch2b/AssignMovingAvg_1/sub/x"
  input: "conv_block_stage5/bn5a_branch2b/cond_1/Merge"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch2b/moving_variance"
      }
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch2b/AssignMovingAvg_1/sub_1"
  op: "Sub"
  input: "bn5a_branch2b/moving_variance/read"
  input: "conv_block_stage5/bn5a_branch2b/cond/Merge_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch2b/moving_variance"
      }
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch2b/AssignMovingAvg_1/mul"
  op: "Mul"
  input: "conv_block_stage5/bn5a_branch2b/AssignMovingAvg_1/sub_1"
  input: "conv_block_stage5/bn5a_branch2b/AssignMovingAvg_1/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch2b/moving_variance"
      }
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch2b/AssignMovingAvg_1"
  op: "AssignSub"
  input: "bn5a_branch2b/moving_variance"
  input: "conv_block_stage5/bn5a_branch2b/AssignMovingAvg_1/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch2b/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "res5a_branch1/kernel/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res5a_branch1/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\000\001\000\000\000\002\000\000"
      }
    }
  }
}
node {
  name: "res5a_branch1/kernel/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res5a_branch1/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.0883883461356163
      }
    }
  }
}
node {
  name: "res5a_branch1/kernel/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res5a_branch1/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0883883461356163
      }
    }
  }
}
node {
  name: "res5a_branch1/kernel/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "res5a_branch1/kernel/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res5a_branch1/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "res5a_branch1/kernel/Initializer/random_uniform/sub"
  op: "Sub"
  input: "res5a_branch1/kernel/Initializer/random_uniform/max"
  input: "res5a_branch1/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res5a_branch1/kernel"
      }
    }
  }
}
node {
  name: "res5a_branch1/kernel/Initializer/random_uniform/mul"
  op: "Mul"
  input: "res5a_branch1/kernel/Initializer/random_uniform/RandomUniform"
  input: "res5a_branch1/kernel/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res5a_branch1/kernel"
      }
    }
  }
}
node {
  name: "res5a_branch1/kernel/Initializer/random_uniform"
  op: "Add"
  input: "res5a_branch1/kernel/Initializer/random_uniform/mul"
  input: "res5a_branch1/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res5a_branch1/kernel"
      }
    }
  }
}
node {
  name: "res5a_branch1/kernel"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res5a_branch1/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
        dim {
          size: 1
        }
        dim {
          size: 256
        }
        dim {
          size: 512
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "res5a_branch1/kernel/Assign"
  op: "Assign"
  input: "res5a_branch1/kernel"
  input: "res5a_branch1/kernel/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res5a_branch1/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "res5a_branch1/kernel/read"
  op: "Identity"
  input: "res5a_branch1/kernel"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res5a_branch1/kernel"
      }
    }
  }
}
node {
  name: "conv_block_stage5/res5a_branch1/kernel/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0005000000237487257
      }
    }
  }
}
node {
  name: "conv_block_stage5/res5a_branch1/kernel/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "res5a_branch1/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv_block_stage5/res5a_branch1/kernel/Regularizer/l2_regularizer"
  op: "Mul"
  input: "conv_block_stage5/res5a_branch1/kernel/Regularizer/l2_regularizer/scale"
  input: "conv_block_stage5/res5a_branch1/kernel/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "res5a_branch1/bias/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res5a_branch1/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 512
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "res5a_branch1/bias"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res5a_branch1/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 512
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "res5a_branch1/bias/Assign"
  op: "Assign"
  input: "res5a_branch1/bias"
  input: "res5a_branch1/bias/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res5a_branch1/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "res5a_branch1/bias/read"
  op: "Identity"
  input: "res5a_branch1/bias"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res5a_branch1/bias"
      }
    }
  }
}
node {
  name: "conv_block_stage5/res5a_branch1/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "conv_block_stage5/res5a_branch1/Conv2D"
  op: "Conv2D"
  input: "id_block_stage4/Relu_1"
  input: "res5a_branch1/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "VALID"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "conv_block_stage5/res5a_branch1/BiasAdd"
  op: "BiasAdd"
  input: "conv_block_stage5/res5a_branch1/Conv2D"
  input: "res5a_branch1/bias/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "bn5a_branch1/gamma/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch1/gamma"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 512
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "bn5a_branch1/gamma"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch1/gamma"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 512
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn5a_branch1/gamma/Assign"
  op: "Assign"
  input: "bn5a_branch1/gamma"
  input: "bn5a_branch1/gamma/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch1/gamma"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn5a_branch1/gamma/read"
  op: "Identity"
  input: "bn5a_branch1/gamma"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch1/gamma"
      }
    }
  }
}
node {
  name: "bn5a_branch1/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch1/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 512
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "bn5a_branch1/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch1/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 512
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn5a_branch1/beta/Assign"
  op: "Assign"
  input: "bn5a_branch1/beta"
  input: "bn5a_branch1/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch1/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn5a_branch1/beta/read"
  op: "Identity"
  input: "bn5a_branch1/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch1/beta"
      }
    }
  }
}
node {
  name: "bn5a_branch1/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch1/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 512
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "bn5a_branch1/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch1/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 512
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn5a_branch1/moving_mean/Assign"
  op: "Assign"
  input: "bn5a_branch1/moving_mean"
  input: "bn5a_branch1/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch1/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn5a_branch1/moving_mean/read"
  op: "Identity"
  input: "bn5a_branch1/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch1/moving_mean"
      }
    }
  }
}
node {
  name: "bn5a_branch1/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch1/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 512
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "bn5a_branch1/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch1/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 512
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn5a_branch1/moving_variance/Assign"
  op: "Assign"
  input: "bn5a_branch1/moving_variance"
  input: "bn5a_branch1/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch1/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn5a_branch1/moving_variance/read"
  op: "Identity"
  input: "bn5a_branch1/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch1/moving_variance"
      }
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch1/cond/Switch"
  op: "Switch"
  input: "Placeholder_2"
  input: "Placeholder_2"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch1/cond/switch_t"
  op: "Identity"
  input: "conv_block_stage5/bn5a_branch1/cond/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch1/cond/switch_f"
  op: "Identity"
  input: "conv_block_stage5/bn5a_branch1/cond/Switch"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch1/cond/pred_id"
  op: "Identity"
  input: "Placeholder_2"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch1/cond/Const"
  op: "Const"
  input: "^conv_block_stage5/bn5a_branch1/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch1/cond/Const_1"
  op: "Const"
  input: "^conv_block_stage5/bn5a_branch1/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch1/cond/FusedBatchNormV3"
  op: "FusedBatchNormV3"
  input: "conv_block_stage5/bn5a_branch1/cond/FusedBatchNormV3/Switch:1"
  input: "conv_block_stage5/bn5a_branch1/cond/FusedBatchNormV3/Switch_1:1"
  input: "conv_block_stage5/bn5a_branch1/cond/FusedBatchNormV3/Switch_2:1"
  input: "conv_block_stage5/bn5a_branch1/cond/Const"
  input: "conv_block_stage5/bn5a_branch1/cond/Const_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "U"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.0010000000474974513
    }
  }
  attr {
    key: "is_training"
    value {
      b: true
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch1/cond/FusedBatchNormV3/Switch"
  op: "Switch"
  input: "conv_block_stage5/res5a_branch1/BiasAdd"
  input: "conv_block_stage5/bn5a_branch1/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_block_stage5/res5a_branch1/BiasAdd"
      }
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch1/cond/FusedBatchNormV3/Switch_1"
  op: "Switch"
  input: "bn5a_branch1/gamma/read"
  input: "conv_block_stage5/bn5a_branch1/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch1/gamma"
      }
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch1/cond/FusedBatchNormV3/Switch_2"
  op: "Switch"
  input: "bn5a_branch1/beta/read"
  input: "conv_block_stage5/bn5a_branch1/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch1/beta"
      }
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch1/cond/FusedBatchNormV3_1"
  op: "FusedBatchNormV3"
  input: "conv_block_stage5/bn5a_branch1/cond/FusedBatchNormV3_1/Switch"
  input: "conv_block_stage5/bn5a_branch1/cond/FusedBatchNormV3_1/Switch_1"
  input: "conv_block_stage5/bn5a_branch1/cond/FusedBatchNormV3_1/Switch_2"
  input: "conv_block_stage5/bn5a_branch1/cond/FusedBatchNormV3_1/Switch_3"
  input: "conv_block_stage5/bn5a_branch1/cond/FusedBatchNormV3_1/Switch_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "U"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.0010000000474974513
    }
  }
  attr {
    key: "is_training"
    value {
      b: false
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch1/cond/FusedBatchNormV3_1/Switch"
  op: "Switch"
  input: "conv_block_stage5/res5a_branch1/BiasAdd"
  input: "conv_block_stage5/bn5a_branch1/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_block_stage5/res5a_branch1/BiasAdd"
      }
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch1/cond/FusedBatchNormV3_1/Switch_1"
  op: "Switch"
  input: "bn5a_branch1/gamma/read"
  input: "conv_block_stage5/bn5a_branch1/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch1/gamma"
      }
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch1/cond/FusedBatchNormV3_1/Switch_2"
  op: "Switch"
  input: "bn5a_branch1/beta/read"
  input: "conv_block_stage5/bn5a_branch1/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch1/beta"
      }
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch1/cond/FusedBatchNormV3_1/Switch_3"
  op: "Switch"
  input: "bn5a_branch1/moving_mean/read"
  input: "conv_block_stage5/bn5a_branch1/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch1/moving_mean"
      }
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch1/cond/FusedBatchNormV3_1/Switch_4"
  op: "Switch"
  input: "bn5a_branch1/moving_variance/read"
  input: "conv_block_stage5/bn5a_branch1/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch1/moving_variance"
      }
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch1/cond/Merge"
  op: "Merge"
  input: "conv_block_stage5/bn5a_branch1/cond/FusedBatchNormV3_1"
  input: "conv_block_stage5/bn5a_branch1/cond/FusedBatchNormV3"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch1/cond/Merge_1"
  op: "Merge"
  input: "conv_block_stage5/bn5a_branch1/cond/FusedBatchNormV3_1:1"
  input: "conv_block_stage5/bn5a_branch1/cond/FusedBatchNormV3:1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch1/cond/Merge_2"
  op: "Merge"
  input: "conv_block_stage5/bn5a_branch1/cond/FusedBatchNormV3_1:2"
  input: "conv_block_stage5/bn5a_branch1/cond/FusedBatchNormV3:2"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch1/cond_1/Switch"
  op: "Switch"
  input: "Placeholder_2"
  input: "Placeholder_2"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch1/cond_1/switch_t"
  op: "Identity"
  input: "conv_block_stage5/bn5a_branch1/cond_1/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch1/cond_1/switch_f"
  op: "Identity"
  input: "conv_block_stage5/bn5a_branch1/cond_1/Switch"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch1/cond_1/pred_id"
  op: "Identity"
  input: "Placeholder_2"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch1/cond_1/Const"
  op: "Const"
  input: "^conv_block_stage5/bn5a_branch1/cond_1/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.9900000095367432
      }
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch1/cond_1/Const_1"
  op: "Const"
  input: "^conv_block_stage5/bn5a_branch1/cond_1/switch_f"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch1/cond_1/Merge"
  op: "Merge"
  input: "conv_block_stage5/bn5a_branch1/cond_1/Const_1"
  input: "conv_block_stage5/bn5a_branch1/cond_1/Const"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch1/AssignMovingAvg/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch1/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch1/AssignMovingAvg/sub"
  op: "Sub"
  input: "conv_block_stage5/bn5a_branch1/AssignMovingAvg/sub/x"
  input: "conv_block_stage5/bn5a_branch1/cond_1/Merge"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch1/moving_mean"
      }
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch1/AssignMovingAvg/sub_1"
  op: "Sub"
  input: "bn5a_branch1/moving_mean/read"
  input: "conv_block_stage5/bn5a_branch1/cond/Merge_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch1/moving_mean"
      }
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch1/AssignMovingAvg/mul"
  op: "Mul"
  input: "conv_block_stage5/bn5a_branch1/AssignMovingAvg/sub_1"
  input: "conv_block_stage5/bn5a_branch1/AssignMovingAvg/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch1/moving_mean"
      }
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch1/AssignMovingAvg"
  op: "AssignSub"
  input: "bn5a_branch1/moving_mean"
  input: "conv_block_stage5/bn5a_branch1/AssignMovingAvg/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch1/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch1/AssignMovingAvg_1/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch1/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch1/AssignMovingAvg_1/sub"
  op: "Sub"
  input: "conv_block_stage5/bn5a_branch1/AssignMovingAvg_1/sub/x"
  input: "conv_block_stage5/bn5a_branch1/cond_1/Merge"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch1/moving_variance"
      }
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch1/AssignMovingAvg_1/sub_1"
  op: "Sub"
  input: "bn5a_branch1/moving_variance/read"
  input: "conv_block_stage5/bn5a_branch1/cond/Merge_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch1/moving_variance"
      }
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch1/AssignMovingAvg_1/mul"
  op: "Mul"
  input: "conv_block_stage5/bn5a_branch1/AssignMovingAvg_1/sub_1"
  input: "conv_block_stage5/bn5a_branch1/AssignMovingAvg_1/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch1/moving_variance"
      }
    }
  }
}
node {
  name: "conv_block_stage5/bn5a_branch1/AssignMovingAvg_1"
  op: "AssignSub"
  input: "bn5a_branch1/moving_variance"
  input: "conv_block_stage5/bn5a_branch1/AssignMovingAvg_1/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch1/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "conv_block_stage5/Add"
  op: "Add"
  input: "conv_block_stage5/bn5a_branch1/cond/Merge"
  input: "conv_block_stage5/bn5a_branch2b/cond/Merge"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv_block_stage5/Relu_1"
  op: "Relu"
  input: "conv_block_stage5/Add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "res5b_branch2b/kernel/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res5b_branch2b/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\000\002\000\000\000\002\000\000"
      }
    }
  }
}
node {
  name: "res5b_branch2b/kernel/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res5b_branch2b/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.025515519082546234
      }
    }
  }
}
node {
  name: "res5b_branch2b/kernel/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res5b_branch2b/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.025515519082546234
      }
    }
  }
}
node {
  name: "res5b_branch2b/kernel/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "res5b_branch2b/kernel/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res5b_branch2b/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "res5b_branch2b/kernel/Initializer/random_uniform/sub"
  op: "Sub"
  input: "res5b_branch2b/kernel/Initializer/random_uniform/max"
  input: "res5b_branch2b/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res5b_branch2b/kernel"
      }
    }
  }
}
node {
  name: "res5b_branch2b/kernel/Initializer/random_uniform/mul"
  op: "Mul"
  input: "res5b_branch2b/kernel/Initializer/random_uniform/RandomUniform"
  input: "res5b_branch2b/kernel/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res5b_branch2b/kernel"
      }
    }
  }
}
node {
  name: "res5b_branch2b/kernel/Initializer/random_uniform"
  op: "Add"
  input: "res5b_branch2b/kernel/Initializer/random_uniform/mul"
  input: "res5b_branch2b/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res5b_branch2b/kernel"
      }
    }
  }
}
node {
  name: "res5b_branch2b/kernel"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res5b_branch2b/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 512
        }
        dim {
          size: 512
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "res5b_branch2b/kernel/Assign"
  op: "Assign"
  input: "res5b_branch2b/kernel"
  input: "res5b_branch2b/kernel/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res5b_branch2b/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "res5b_branch2b/kernel/read"
  op: "Identity"
  input: "res5b_branch2b/kernel"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res5b_branch2b/kernel"
      }
    }
  }
}
node {
  name: "id_block_stage5/res5b_branch2b/kernel/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0005000000237487257
      }
    }
  }
}
node {
  name: "id_block_stage5/res5b_branch2b/kernel/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "res5b_branch2b/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "id_block_stage5/res5b_branch2b/kernel/Regularizer/l2_regularizer"
  op: "Mul"
  input: "id_block_stage5/res5b_branch2b/kernel/Regularizer/l2_regularizer/scale"
  input: "id_block_stage5/res5b_branch2b/kernel/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "res5b_branch2b/bias/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res5b_branch2b/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 512
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "res5b_branch2b/bias"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res5b_branch2b/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 512
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "res5b_branch2b/bias/Assign"
  op: "Assign"
  input: "res5b_branch2b/bias"
  input: "res5b_branch2b/bias/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res5b_branch2b/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "res5b_branch2b/bias/read"
  op: "Identity"
  input: "res5b_branch2b/bias"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res5b_branch2b/bias"
      }
    }
  }
}
node {
  name: "id_block_stage5/res5b_branch2b/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "id_block_stage5/res5b_branch2b/Conv2D"
  op: "Conv2D"
  input: "conv_block_stage5/Relu_1"
  input: "res5b_branch2b/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "id_block_stage5/res5b_branch2b/BiasAdd"
  op: "BiasAdd"
  input: "id_block_stage5/res5b_branch2b/Conv2D"
  input: "res5b_branch2b/bias/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "bn5b_branch2b/gamma/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5b_branch2b/gamma"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 512
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "bn5b_branch2b/gamma"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5b_branch2b/gamma"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 512
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn5b_branch2b/gamma/Assign"
  op: "Assign"
  input: "bn5b_branch2b/gamma"
  input: "bn5b_branch2b/gamma/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5b_branch2b/gamma"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn5b_branch2b/gamma/read"
  op: "Identity"
  input: "bn5b_branch2b/gamma"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5b_branch2b/gamma"
      }
    }
  }
}
node {
  name: "bn5b_branch2b/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5b_branch2b/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 512
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "bn5b_branch2b/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5b_branch2b/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 512
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn5b_branch2b/beta/Assign"
  op: "Assign"
  input: "bn5b_branch2b/beta"
  input: "bn5b_branch2b/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5b_branch2b/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn5b_branch2b/beta/read"
  op: "Identity"
  input: "bn5b_branch2b/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5b_branch2b/beta"
      }
    }
  }
}
node {
  name: "bn5b_branch2b/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5b_branch2b/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 512
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "bn5b_branch2b/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5b_branch2b/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 512
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn5b_branch2b/moving_mean/Assign"
  op: "Assign"
  input: "bn5b_branch2b/moving_mean"
  input: "bn5b_branch2b/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5b_branch2b/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn5b_branch2b/moving_mean/read"
  op: "Identity"
  input: "bn5b_branch2b/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5b_branch2b/moving_mean"
      }
    }
  }
}
node {
  name: "bn5b_branch2b/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5b_branch2b/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 512
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "bn5b_branch2b/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5b_branch2b/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 512
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn5b_branch2b/moving_variance/Assign"
  op: "Assign"
  input: "bn5b_branch2b/moving_variance"
  input: "bn5b_branch2b/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5b_branch2b/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn5b_branch2b/moving_variance/read"
  op: "Identity"
  input: "bn5b_branch2b/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5b_branch2b/moving_variance"
      }
    }
  }
}
node {
  name: "id_block_stage5/bn5b_branch2b/cond/Switch"
  op: "Switch"
  input: "Placeholder_2"
  input: "Placeholder_2"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "id_block_stage5/bn5b_branch2b/cond/switch_t"
  op: "Identity"
  input: "id_block_stage5/bn5b_branch2b/cond/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "id_block_stage5/bn5b_branch2b/cond/switch_f"
  op: "Identity"
  input: "id_block_stage5/bn5b_branch2b/cond/Switch"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "id_block_stage5/bn5b_branch2b/cond/pred_id"
  op: "Identity"
  input: "Placeholder_2"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "id_block_stage5/bn5b_branch2b/cond/Const"
  op: "Const"
  input: "^id_block_stage5/bn5b_branch2b/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "id_block_stage5/bn5b_branch2b/cond/Const_1"
  op: "Const"
  input: "^id_block_stage5/bn5b_branch2b/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "id_block_stage5/bn5b_branch2b/cond/FusedBatchNormV3"
  op: "FusedBatchNormV3"
  input: "id_block_stage5/bn5b_branch2b/cond/FusedBatchNormV3/Switch:1"
  input: "id_block_stage5/bn5b_branch2b/cond/FusedBatchNormV3/Switch_1:1"
  input: "id_block_stage5/bn5b_branch2b/cond/FusedBatchNormV3/Switch_2:1"
  input: "id_block_stage5/bn5b_branch2b/cond/Const"
  input: "id_block_stage5/bn5b_branch2b/cond/Const_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "U"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.0010000000474974513
    }
  }
  attr {
    key: "is_training"
    value {
      b: true
    }
  }
}
node {
  name: "id_block_stage5/bn5b_branch2b/cond/FusedBatchNormV3/Switch"
  op: "Switch"
  input: "id_block_stage5/res5b_branch2b/BiasAdd"
  input: "id_block_stage5/bn5b_branch2b/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@id_block_stage5/res5b_branch2b/BiasAdd"
      }
    }
  }
}
node {
  name: "id_block_stage5/bn5b_branch2b/cond/FusedBatchNormV3/Switch_1"
  op: "Switch"
  input: "bn5b_branch2b/gamma/read"
  input: "id_block_stage5/bn5b_branch2b/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5b_branch2b/gamma"
      }
    }
  }
}
node {
  name: "id_block_stage5/bn5b_branch2b/cond/FusedBatchNormV3/Switch_2"
  op: "Switch"
  input: "bn5b_branch2b/beta/read"
  input: "id_block_stage5/bn5b_branch2b/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5b_branch2b/beta"
      }
    }
  }
}
node {
  name: "id_block_stage5/bn5b_branch2b/cond/FusedBatchNormV3_1"
  op: "FusedBatchNormV3"
  input: "id_block_stage5/bn5b_branch2b/cond/FusedBatchNormV3_1/Switch"
  input: "id_block_stage5/bn5b_branch2b/cond/FusedBatchNormV3_1/Switch_1"
  input: "id_block_stage5/bn5b_branch2b/cond/FusedBatchNormV3_1/Switch_2"
  input: "id_block_stage5/bn5b_branch2b/cond/FusedBatchNormV3_1/Switch_3"
  input: "id_block_stage5/bn5b_branch2b/cond/FusedBatchNormV3_1/Switch_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "U"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.0010000000474974513
    }
  }
  attr {
    key: "is_training"
    value {
      b: false
    }
  }
}
node {
  name: "id_block_stage5/bn5b_branch2b/cond/FusedBatchNormV3_1/Switch"
  op: "Switch"
  input: "id_block_stage5/res5b_branch2b/BiasAdd"
  input: "id_block_stage5/bn5b_branch2b/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@id_block_stage5/res5b_branch2b/BiasAdd"
      }
    }
  }
}
node {
  name: "id_block_stage5/bn5b_branch2b/cond/FusedBatchNormV3_1/Switch_1"
  op: "Switch"
  input: "bn5b_branch2b/gamma/read"
  input: "id_block_stage5/bn5b_branch2b/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5b_branch2b/gamma"
      }
    }
  }
}
node {
  name: "id_block_stage5/bn5b_branch2b/cond/FusedBatchNormV3_1/Switch_2"
  op: "Switch"
  input: "bn5b_branch2b/beta/read"
  input: "id_block_stage5/bn5b_branch2b/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5b_branch2b/beta"
      }
    }
  }
}
node {
  name: "id_block_stage5/bn5b_branch2b/cond/FusedBatchNormV3_1/Switch_3"
  op: "Switch"
  input: "bn5b_branch2b/moving_mean/read"
  input: "id_block_stage5/bn5b_branch2b/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5b_branch2b/moving_mean"
      }
    }
  }
}
node {
  name: "id_block_stage5/bn5b_branch2b/cond/FusedBatchNormV3_1/Switch_4"
  op: "Switch"
  input: "bn5b_branch2b/moving_variance/read"
  input: "id_block_stage5/bn5b_branch2b/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5b_branch2b/moving_variance"
      }
    }
  }
}
node {
  name: "id_block_stage5/bn5b_branch2b/cond/Merge"
  op: "Merge"
  input: "id_block_stage5/bn5b_branch2b/cond/FusedBatchNormV3_1"
  input: "id_block_stage5/bn5b_branch2b/cond/FusedBatchNormV3"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "id_block_stage5/bn5b_branch2b/cond/Merge_1"
  op: "Merge"
  input: "id_block_stage5/bn5b_branch2b/cond/FusedBatchNormV3_1:1"
  input: "id_block_stage5/bn5b_branch2b/cond/FusedBatchNormV3:1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "id_block_stage5/bn5b_branch2b/cond/Merge_2"
  op: "Merge"
  input: "id_block_stage5/bn5b_branch2b/cond/FusedBatchNormV3_1:2"
  input: "id_block_stage5/bn5b_branch2b/cond/FusedBatchNormV3:2"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "id_block_stage5/bn5b_branch2b/cond_1/Switch"
  op: "Switch"
  input: "Placeholder_2"
  input: "Placeholder_2"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "id_block_stage5/bn5b_branch2b/cond_1/switch_t"
  op: "Identity"
  input: "id_block_stage5/bn5b_branch2b/cond_1/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "id_block_stage5/bn5b_branch2b/cond_1/switch_f"
  op: "Identity"
  input: "id_block_stage5/bn5b_branch2b/cond_1/Switch"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "id_block_stage5/bn5b_branch2b/cond_1/pred_id"
  op: "Identity"
  input: "Placeholder_2"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "id_block_stage5/bn5b_branch2b/cond_1/Const"
  op: "Const"
  input: "^id_block_stage5/bn5b_branch2b/cond_1/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.9900000095367432
      }
    }
  }
}
node {
  name: "id_block_stage5/bn5b_branch2b/cond_1/Const_1"
  op: "Const"
  input: "^id_block_stage5/bn5b_branch2b/cond_1/switch_f"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "id_block_stage5/bn5b_branch2b/cond_1/Merge"
  op: "Merge"
  input: "id_block_stage5/bn5b_branch2b/cond_1/Const_1"
  input: "id_block_stage5/bn5b_branch2b/cond_1/Const"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "id_block_stage5/bn5b_branch2b/AssignMovingAvg/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5b_branch2b/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "id_block_stage5/bn5b_branch2b/AssignMovingAvg/sub"
  op: "Sub"
  input: "id_block_stage5/bn5b_branch2b/AssignMovingAvg/sub/x"
  input: "id_block_stage5/bn5b_branch2b/cond_1/Merge"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5b_branch2b/moving_mean"
      }
    }
  }
}
node {
  name: "id_block_stage5/bn5b_branch2b/AssignMovingAvg/sub_1"
  op: "Sub"
  input: "bn5b_branch2b/moving_mean/read"
  input: "id_block_stage5/bn5b_branch2b/cond/Merge_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5b_branch2b/moving_mean"
      }
    }
  }
}
node {
  name: "id_block_stage5/bn5b_branch2b/AssignMovingAvg/mul"
  op: "Mul"
  input: "id_block_stage5/bn5b_branch2b/AssignMovingAvg/sub_1"
  input: "id_block_stage5/bn5b_branch2b/AssignMovingAvg/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5b_branch2b/moving_mean"
      }
    }
  }
}
node {
  name: "id_block_stage5/bn5b_branch2b/AssignMovingAvg"
  op: "AssignSub"
  input: "bn5b_branch2b/moving_mean"
  input: "id_block_stage5/bn5b_branch2b/AssignMovingAvg/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5b_branch2b/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "id_block_stage5/bn5b_branch2b/AssignMovingAvg_1/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5b_branch2b/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "id_block_stage5/bn5b_branch2b/AssignMovingAvg_1/sub"
  op: "Sub"
  input: "id_block_stage5/bn5b_branch2b/AssignMovingAvg_1/sub/x"
  input: "id_block_stage5/bn5b_branch2b/cond_1/Merge"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5b_branch2b/moving_variance"
      }
    }
  }
}
node {
  name: "id_block_stage5/bn5b_branch2b/AssignMovingAvg_1/sub_1"
  op: "Sub"
  input: "bn5b_branch2b/moving_variance/read"
  input: "id_block_stage5/bn5b_branch2b/cond/Merge_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5b_branch2b/moving_variance"
      }
    }
  }
}
node {
  name: "id_block_stage5/bn5b_branch2b/AssignMovingAvg_1/mul"
  op: "Mul"
  input: "id_block_stage5/bn5b_branch2b/AssignMovingAvg_1/sub_1"
  input: "id_block_stage5/bn5b_branch2b/AssignMovingAvg_1/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5b_branch2b/moving_variance"
      }
    }
  }
}
node {
  name: "id_block_stage5/bn5b_branch2b/AssignMovingAvg_1"
  op: "AssignSub"
  input: "bn5b_branch2b/moving_variance"
  input: "id_block_stage5/bn5b_branch2b/AssignMovingAvg_1/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5b_branch2b/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "id_block_stage5/Relu"
  op: "Relu"
  input: "id_block_stage5/bn5b_branch2b/cond/Merge"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "res5b_branch2c/kernel/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res5b_branch2c/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\000\002\000\000\000\002\000\000"
      }
    }
  }
}
node {
  name: "res5b_branch2c/kernel/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res5b_branch2c/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.025515519082546234
      }
    }
  }
}
node {
  name: "res5b_branch2c/kernel/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res5b_branch2c/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.025515519082546234
      }
    }
  }
}
node {
  name: "res5b_branch2c/kernel/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "res5b_branch2c/kernel/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res5b_branch2c/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "res5b_branch2c/kernel/Initializer/random_uniform/sub"
  op: "Sub"
  input: "res5b_branch2c/kernel/Initializer/random_uniform/max"
  input: "res5b_branch2c/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res5b_branch2c/kernel"
      }
    }
  }
}
node {
  name: "res5b_branch2c/kernel/Initializer/random_uniform/mul"
  op: "Mul"
  input: "res5b_branch2c/kernel/Initializer/random_uniform/RandomUniform"
  input: "res5b_branch2c/kernel/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res5b_branch2c/kernel"
      }
    }
  }
}
node {
  name: "res5b_branch2c/kernel/Initializer/random_uniform"
  op: "Add"
  input: "res5b_branch2c/kernel/Initializer/random_uniform/mul"
  input: "res5b_branch2c/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res5b_branch2c/kernel"
      }
    }
  }
}
node {
  name: "res5b_branch2c/kernel"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res5b_branch2c/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 512
        }
        dim {
          size: 512
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "res5b_branch2c/kernel/Assign"
  op: "Assign"
  input: "res5b_branch2c/kernel"
  input: "res5b_branch2c/kernel/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res5b_branch2c/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "res5b_branch2c/kernel/read"
  op: "Identity"
  input: "res5b_branch2c/kernel"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res5b_branch2c/kernel"
      }
    }
  }
}
node {
  name: "id_block_stage5/res5b_branch2c/kernel/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0005000000237487257
      }
    }
  }
}
node {
  name: "id_block_stage5/res5b_branch2c/kernel/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "res5b_branch2c/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "id_block_stage5/res5b_branch2c/kernel/Regularizer/l2_regularizer"
  op: "Mul"
  input: "id_block_stage5/res5b_branch2c/kernel/Regularizer/l2_regularizer/scale"
  input: "id_block_stage5/res5b_branch2c/kernel/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "res5b_branch2c/bias/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res5b_branch2c/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 512
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "res5b_branch2c/bias"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res5b_branch2c/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 512
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "res5b_branch2c/bias/Assign"
  op: "Assign"
  input: "res5b_branch2c/bias"
  input: "res5b_branch2c/bias/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res5b_branch2c/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "res5b_branch2c/bias/read"
  op: "Identity"
  input: "res5b_branch2c/bias"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res5b_branch2c/bias"
      }
    }
  }
}
node {
  name: "id_block_stage5/res5b_branch2c/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "id_block_stage5/res5b_branch2c/Conv2D"
  op: "Conv2D"
  input: "id_block_stage5/Relu"
  input: "res5b_branch2c/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "id_block_stage5/res5b_branch2c/BiasAdd"
  op: "BiasAdd"
  input: "id_block_stage5/res5b_branch2c/Conv2D"
  input: "res5b_branch2c/bias/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "bn5b_branch2c/gamma/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5b_branch2c/gamma"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 512
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "bn5b_branch2c/gamma"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5b_branch2c/gamma"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 512
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn5b_branch2c/gamma/Assign"
  op: "Assign"
  input: "bn5b_branch2c/gamma"
  input: "bn5b_branch2c/gamma/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5b_branch2c/gamma"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn5b_branch2c/gamma/read"
  op: "Identity"
  input: "bn5b_branch2c/gamma"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5b_branch2c/gamma"
      }
    }
  }
}
node {
  name: "bn5b_branch2c/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5b_branch2c/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 512
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "bn5b_branch2c/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5b_branch2c/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 512
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn5b_branch2c/beta/Assign"
  op: "Assign"
  input: "bn5b_branch2c/beta"
  input: "bn5b_branch2c/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5b_branch2c/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn5b_branch2c/beta/read"
  op: "Identity"
  input: "bn5b_branch2c/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5b_branch2c/beta"
      }
    }
  }
}
node {
  name: "bn5b_branch2c/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5b_branch2c/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 512
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "bn5b_branch2c/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5b_branch2c/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 512
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn5b_branch2c/moving_mean/Assign"
  op: "Assign"
  input: "bn5b_branch2c/moving_mean"
  input: "bn5b_branch2c/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5b_branch2c/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn5b_branch2c/moving_mean/read"
  op: "Identity"
  input: "bn5b_branch2c/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5b_branch2c/moving_mean"
      }
    }
  }
}
node {
  name: "bn5b_branch2c/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5b_branch2c/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 512
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "bn5b_branch2c/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5b_branch2c/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 512
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn5b_branch2c/moving_variance/Assign"
  op: "Assign"
  input: "bn5b_branch2c/moving_variance"
  input: "bn5b_branch2c/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5b_branch2c/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn5b_branch2c/moving_variance/read"
  op: "Identity"
  input: "bn5b_branch2c/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5b_branch2c/moving_variance"
      }
    }
  }
}
node {
  name: "id_block_stage5/bn5b_branch2c/cond/Switch"
  op: "Switch"
  input: "Placeholder_2"
  input: "Placeholder_2"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "id_block_stage5/bn5b_branch2c/cond/switch_t"
  op: "Identity"
  input: "id_block_stage5/bn5b_branch2c/cond/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "id_block_stage5/bn5b_branch2c/cond/switch_f"
  op: "Identity"
  input: "id_block_stage5/bn5b_branch2c/cond/Switch"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "id_block_stage5/bn5b_branch2c/cond/pred_id"
  op: "Identity"
  input: "Placeholder_2"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "id_block_stage5/bn5b_branch2c/cond/Const"
  op: "Const"
  input: "^id_block_stage5/bn5b_branch2c/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "id_block_stage5/bn5b_branch2c/cond/Const_1"
  op: "Const"
  input: "^id_block_stage5/bn5b_branch2c/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "id_block_stage5/bn5b_branch2c/cond/FusedBatchNormV3"
  op: "FusedBatchNormV3"
  input: "id_block_stage5/bn5b_branch2c/cond/FusedBatchNormV3/Switch:1"
  input: "id_block_stage5/bn5b_branch2c/cond/FusedBatchNormV3/Switch_1:1"
  input: "id_block_stage5/bn5b_branch2c/cond/FusedBatchNormV3/Switch_2:1"
  input: "id_block_stage5/bn5b_branch2c/cond/Const"
  input: "id_block_stage5/bn5b_branch2c/cond/Const_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "U"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.0010000000474974513
    }
  }
  attr {
    key: "is_training"
    value {
      b: true
    }
  }
}
node {
  name: "id_block_stage5/bn5b_branch2c/cond/FusedBatchNormV3/Switch"
  op: "Switch"
  input: "id_block_stage5/res5b_branch2c/BiasAdd"
  input: "id_block_stage5/bn5b_branch2c/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@id_block_stage5/res5b_branch2c/BiasAdd"
      }
    }
  }
}
node {
  name: "id_block_stage5/bn5b_branch2c/cond/FusedBatchNormV3/Switch_1"
  op: "Switch"
  input: "bn5b_branch2c/gamma/read"
  input: "id_block_stage5/bn5b_branch2c/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5b_branch2c/gamma"
      }
    }
  }
}
node {
  name: "id_block_stage5/bn5b_branch2c/cond/FusedBatchNormV3/Switch_2"
  op: "Switch"
  input: "bn5b_branch2c/beta/read"
  input: "id_block_stage5/bn5b_branch2c/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5b_branch2c/beta"
      }
    }
  }
}
node {
  name: "id_block_stage5/bn5b_branch2c/cond/FusedBatchNormV3_1"
  op: "FusedBatchNormV3"
  input: "id_block_stage5/bn5b_branch2c/cond/FusedBatchNormV3_1/Switch"
  input: "id_block_stage5/bn5b_branch2c/cond/FusedBatchNormV3_1/Switch_1"
  input: "id_block_stage5/bn5b_branch2c/cond/FusedBatchNormV3_1/Switch_2"
  input: "id_block_stage5/bn5b_branch2c/cond/FusedBatchNormV3_1/Switch_3"
  input: "id_block_stage5/bn5b_branch2c/cond/FusedBatchNormV3_1/Switch_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "U"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.0010000000474974513
    }
  }
  attr {
    key: "is_training"
    value {
      b: false
    }
  }
}
node {
  name: "id_block_stage5/bn5b_branch2c/cond/FusedBatchNormV3_1/Switch"
  op: "Switch"
  input: "id_block_stage5/res5b_branch2c/BiasAdd"
  input: "id_block_stage5/bn5b_branch2c/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@id_block_stage5/res5b_branch2c/BiasAdd"
      }
    }
  }
}
node {
  name: "id_block_stage5/bn5b_branch2c/cond/FusedBatchNormV3_1/Switch_1"
  op: "Switch"
  input: "bn5b_branch2c/gamma/read"
  input: "id_block_stage5/bn5b_branch2c/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5b_branch2c/gamma"
      }
    }
  }
}
node {
  name: "id_block_stage5/bn5b_branch2c/cond/FusedBatchNormV3_1/Switch_2"
  op: "Switch"
  input: "bn5b_branch2c/beta/read"
  input: "id_block_stage5/bn5b_branch2c/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5b_branch2c/beta"
      }
    }
  }
}
node {
  name: "id_block_stage5/bn5b_branch2c/cond/FusedBatchNormV3_1/Switch_3"
  op: "Switch"
  input: "bn5b_branch2c/moving_mean/read"
  input: "id_block_stage5/bn5b_branch2c/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5b_branch2c/moving_mean"
      }
    }
  }
}
node {
  name: "id_block_stage5/bn5b_branch2c/cond/FusedBatchNormV3_1/Switch_4"
  op: "Switch"
  input: "bn5b_branch2c/moving_variance/read"
  input: "id_block_stage5/bn5b_branch2c/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5b_branch2c/moving_variance"
      }
    }
  }
}
node {
  name: "id_block_stage5/bn5b_branch2c/cond/Merge"
  op: "Merge"
  input: "id_block_stage5/bn5b_branch2c/cond/FusedBatchNormV3_1"
  input: "id_block_stage5/bn5b_branch2c/cond/FusedBatchNormV3"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "id_block_stage5/bn5b_branch2c/cond/Merge_1"
  op: "Merge"
  input: "id_block_stage5/bn5b_branch2c/cond/FusedBatchNormV3_1:1"
  input: "id_block_stage5/bn5b_branch2c/cond/FusedBatchNormV3:1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "id_block_stage5/bn5b_branch2c/cond/Merge_2"
  op: "Merge"
  input: "id_block_stage5/bn5b_branch2c/cond/FusedBatchNormV3_1:2"
  input: "id_block_stage5/bn5b_branch2c/cond/FusedBatchNormV3:2"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "id_block_stage5/bn5b_branch2c/cond_1/Switch"
  op: "Switch"
  input: "Placeholder_2"
  input: "Placeholder_2"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "id_block_stage5/bn5b_branch2c/cond_1/switch_t"
  op: "Identity"
  input: "id_block_stage5/bn5b_branch2c/cond_1/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "id_block_stage5/bn5b_branch2c/cond_1/switch_f"
  op: "Identity"
  input: "id_block_stage5/bn5b_branch2c/cond_1/Switch"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "id_block_stage5/bn5b_branch2c/cond_1/pred_id"
  op: "Identity"
  input: "Placeholder_2"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "id_block_stage5/bn5b_branch2c/cond_1/Const"
  op: "Const"
  input: "^id_block_stage5/bn5b_branch2c/cond_1/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.9900000095367432
      }
    }
  }
}
node {
  name: "id_block_stage5/bn5b_branch2c/cond_1/Const_1"
  op: "Const"
  input: "^id_block_stage5/bn5b_branch2c/cond_1/switch_f"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "id_block_stage5/bn5b_branch2c/cond_1/Merge"
  op: "Merge"
  input: "id_block_stage5/bn5b_branch2c/cond_1/Const_1"
  input: "id_block_stage5/bn5b_branch2c/cond_1/Const"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "id_block_stage5/bn5b_branch2c/AssignMovingAvg/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5b_branch2c/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "id_block_stage5/bn5b_branch2c/AssignMovingAvg/sub"
  op: "Sub"
  input: "id_block_stage5/bn5b_branch2c/AssignMovingAvg/sub/x"
  input: "id_block_stage5/bn5b_branch2c/cond_1/Merge"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5b_branch2c/moving_mean"
      }
    }
  }
}
node {
  name: "id_block_stage5/bn5b_branch2c/AssignMovingAvg/sub_1"
  op: "Sub"
  input: "bn5b_branch2c/moving_mean/read"
  input: "id_block_stage5/bn5b_branch2c/cond/Merge_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5b_branch2c/moving_mean"
      }
    }
  }
}
node {
  name: "id_block_stage5/bn5b_branch2c/AssignMovingAvg/mul"
  op: "Mul"
  input: "id_block_stage5/bn5b_branch2c/AssignMovingAvg/sub_1"
  input: "id_block_stage5/bn5b_branch2c/AssignMovingAvg/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5b_branch2c/moving_mean"
      }
    }
  }
}
node {
  name: "id_block_stage5/bn5b_branch2c/AssignMovingAvg"
  op: "AssignSub"
  input: "bn5b_branch2c/moving_mean"
  input: "id_block_stage5/bn5b_branch2c/AssignMovingAvg/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5b_branch2c/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "id_block_stage5/bn5b_branch2c/AssignMovingAvg_1/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5b_branch2c/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "id_block_stage5/bn5b_branch2c/AssignMovingAvg_1/sub"
  op: "Sub"
  input: "id_block_stage5/bn5b_branch2c/AssignMovingAvg_1/sub/x"
  input: "id_block_stage5/bn5b_branch2c/cond_1/Merge"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5b_branch2c/moving_variance"
      }
    }
  }
}
node {
  name: "id_block_stage5/bn5b_branch2c/AssignMovingAvg_1/sub_1"
  op: "Sub"
  input: "bn5b_branch2c/moving_variance/read"
  input: "id_block_stage5/bn5b_branch2c/cond/Merge_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5b_branch2c/moving_variance"
      }
    }
  }
}
node {
  name: "id_block_stage5/bn5b_branch2c/AssignMovingAvg_1/mul"
  op: "Mul"
  input: "id_block_stage5/bn5b_branch2c/AssignMovingAvg_1/sub_1"
  input: "id_block_stage5/bn5b_branch2c/AssignMovingAvg_1/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5b_branch2c/moving_variance"
      }
    }
  }
}
node {
  name: "id_block_stage5/bn5b_branch2c/AssignMovingAvg_1"
  op: "AssignSub"
  input: "bn5b_branch2c/moving_variance"
  input: "id_block_stage5/bn5b_branch2c/AssignMovingAvg_1/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5b_branch2c/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "id_block_stage5/Add"
  op: "Add"
  input: "id_block_stage5/bn5b_branch2c/cond/Merge"
  input: "conv_block_stage5/Relu_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "id_block_stage5/Relu_1"
  op: "Relu"
  input: "id_block_stage5/Add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "average_pooling2d/AvgPool"
  op: "AvgPool"
  input: "id_block_stage5/Relu_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "ksize"
    value {
      list {
        i: 1
        i: 7
        i: 7
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "VALID"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
}
node {
  name: "flatten/Shape"
  op: "Shape"
  input: "average_pooling2d/AvgPool"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "flatten/strided_slice/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "flatten/strided_slice/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "flatten/strided_slice/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "flatten/strided_slice"
  op: "StridedSlice"
  input: "flatten/Shape"
  input: "flatten/strided_slice/stack"
  input: "flatten/strided_slice/stack_1"
  input: "flatten/strided_slice/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "flatten/Reshape/shape/1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: -1
      }
    }
  }
}
node {
  name: "flatten/Reshape/shape"
  op: "Pack"
  input: "flatten/strided_slice"
  input: "flatten/Reshape/shape/1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "flatten/Reshape"
  op: "Reshape"
  input: "average_pooling2d/AvgPool"
  input: "flatten/Reshape/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "dense/kernel/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\000\002\000\000\007\000\000\000"
      }
    }
  }
}
node {
  name: "dense/kernel/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.10752066969871521
      }
    }
  }
}
node {
  name: "dense/kernel/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.10752066969871521
      }
    }
  }
}
node {
  name: "dense/kernel/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "dense/kernel/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "dense/kernel/Initializer/random_uniform/sub"
  op: "Sub"
  input: "dense/kernel/Initializer/random_uniform/max"
  input: "dense/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense/kernel"
      }
    }
  }
}
node {
  name: "dense/kernel/Initializer/random_uniform/mul"
  op: "Mul"
  input: "dense/kernel/Initializer/random_uniform/RandomUniform"
  input: "dense/kernel/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense/kernel"
      }
    }
  }
}
node {
  name: "dense/kernel/Initializer/random_uniform"
  op: "Add"
  input: "dense/kernel/Initializer/random_uniform/mul"
  input: "dense/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense/kernel"
      }
    }
  }
}
node {
  name: "dense/kernel"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 512
        }
        dim {
          size: 7
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "dense/kernel/Assign"
  op: "Assign"
  input: "dense/kernel"
  input: "dense/kernel/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "dense/kernel/read"
  op: "Identity"
  input: "dense/kernel"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense/kernel"
      }
    }
  }
}
node {
  name: "dense/kernel/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0005000000237487257
      }
    }
  }
}
node {
  name: "dense/kernel/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "dense/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dense/kernel/Regularizer/l2_regularizer"
  op: "Mul"
  input: "dense/kernel/Regularizer/l2_regularizer/scale"
  input: "dense/kernel/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dense/bias/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 7
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "dense/bias"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 7
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "dense/bias/Assign"
  op: "Assign"
  input: "dense/bias"
  input: "dense/bias/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "dense/bias/read"
  op: "Identity"
  input: "dense/bias"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense/bias"
      }
    }
  }
}
node {
  name: "dense/MatMul"
  op: "MatMul"
  input: "flatten/Reshape"
  input: "dense/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "dense/BiasAdd"
  op: "BiasAdd"
  input: "dense/MatMul"
  input: "dense/bias/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "save/filename/input"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: "model"
      }
    }
  }
}
node {
  name: "save/filename"
  op: "PlaceholderWithDefault"
  input: "save/filename/input"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
}
node {
  name: "save/Const"
  op: "PlaceholderWithDefault"
  input: "save/filename"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
}
node {
  name: "save/SaveV2/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 122
          }
        }
        string_val: "bn2a_branch2b/beta"
        string_val: "bn2a_branch2b/gamma"
        string_val: "bn2a_branch2b/moving_mean"
        string_val: "bn2a_branch2b/moving_variance"
        string_val: "bn2a_branch2c/beta"
        string_val: "bn2a_branch2c/gamma"
        string_val: "bn2a_branch2c/moving_mean"
        string_val: "bn2a_branch2c/moving_variance"
        string_val: "bn2b_branch2b/beta"
        string_val: "bn2b_branch2b/gamma"
        string_val: "bn2b_branch2b/moving_mean"
        string_val: "bn2b_branch2b/moving_variance"
        string_val: "bn2b_branch2c/beta"
        string_val: "bn2b_branch2c/gamma"
        string_val: "bn2b_branch2c/moving_mean"
        string_val: "bn2b_branch2c/moving_variance"
        string_val: "bn3a_branch1/beta"
        string_val: "bn3a_branch1/gamma"
        string_val: "bn3a_branch1/moving_mean"
        string_val: "bn3a_branch1/moving_variance"
        string_val: "bn3a_branch2a/beta"
        string_val: "bn3a_branch2a/gamma"
        string_val: "bn3a_branch2a/moving_mean"
        string_val: "bn3a_branch2a/moving_variance"
        string_val: "bn3a_branch2b/beta"
        string_val: "bn3a_branch2b/gamma"
        string_val: "bn3a_branch2b/moving_mean"
        string_val: "bn3a_branch2b/moving_variance"
        string_val: "bn3b_branch2b/beta"
        string_val: "bn3b_branch2b/gamma"
        string_val: "bn3b_branch2b/moving_mean"
        string_val: "bn3b_branch2b/moving_variance"
        string_val: "bn3b_branch2c/beta"
        string_val: "bn3b_branch2c/gamma"
        string_val: "bn3b_branch2c/moving_mean"
        string_val: "bn3b_branch2c/moving_variance"
        string_val: "bn4a_branch1/beta"
        string_val: "bn4a_branch1/gamma"
        string_val: "bn4a_branch1/moving_mean"
        string_val: "bn4a_branch1/moving_variance"
        string_val: "bn4a_branch2a/beta"
        string_val: "bn4a_branch2a/gamma"
        string_val: "bn4a_branch2a/moving_mean"
        string_val: "bn4a_branch2a/moving_variance"
        string_val: "bn4a_branch2b/beta"
        string_val: "bn4a_branch2b/gamma"
        string_val: "bn4a_branch2b/moving_mean"
        string_val: "bn4a_branch2b/moving_variance"
        string_val: "bn4b_branch2b/beta"
        string_val: "bn4b_branch2b/gamma"
        string_val: "bn4b_branch2b/moving_mean"
        string_val: "bn4b_branch2b/moving_variance"
        string_val: "bn4b_branch2c/beta"
        string_val: "bn4b_branch2c/gamma"
        string_val: "bn4b_branch2c/moving_mean"
        string_val: "bn4b_branch2c/moving_variance"
        string_val: "bn5a_branch1/beta"
        string_val: "bn5a_branch1/gamma"
        string_val: "bn5a_branch1/moving_mean"
        string_val: "bn5a_branch1/moving_variance"
        string_val: "bn5a_branch2a/beta"
        string_val: "bn5a_branch2a/gamma"
        string_val: "bn5a_branch2a/moving_mean"
        string_val: "bn5a_branch2a/moving_variance"
        string_val: "bn5a_branch2b/beta"
        string_val: "bn5a_branch2b/gamma"
        string_val: "bn5a_branch2b/moving_mean"
        string_val: "bn5a_branch2b/moving_variance"
        string_val: "bn5b_branch2b/beta"
        string_val: "bn5b_branch2b/gamma"
        string_val: "bn5b_branch2b/moving_mean"
        string_val: "bn5b_branch2b/moving_variance"
        string_val: "bn5b_branch2c/beta"
        string_val: "bn5b_branch2c/gamma"
        string_val: "bn5b_branch2c/moving_mean"
        string_val: "bn5b_branch2c/moving_variance"
        string_val: "bn_conv1/beta"
        string_val: "bn_conv1/gamma"
        string_val: "bn_conv1/moving_mean"
        string_val: "bn_conv1/moving_variance"
        string_val: "conv1/bias"
        string_val: "conv1/kernel"
        string_val: "dense/bias"
        string_val: "dense/kernel"
        string_val: "res2a_branch2b/bias"
        string_val: "res2a_branch2b/kernel"
        string_val: "res2a_branch2c/bias"
        string_val: "res2a_branch2c/kernel"
        string_val: "res2b_branch2b/bias"
        string_val: "res2b_branch2b/kernel"
        string_val: "res2b_branch2c/bias"
        string_val: "res2b_branch2c/kernel"
        string_val: "res3a_branch1/bias"
        string_val: "res3a_branch1/kernel"
        string_val: "res3a_branch2a/bias"
        string_val: "res3a_branch2a/kernel"
        string_val: "res3a_branch2b/bias"
        string_val: "res3a_branch2b/kernel"
        string_val: "res3b_branch2b/bias"
        string_val: "res3b_branch2b/kernel"
        string_val: "res3b_branch2c/bias"
        string_val: "res3b_branch2c/kernel"
        string_val: "res4a_branch1/bias"
        string_val: "res4a_branch1/kernel"
        string_val: "res4a_branch2a/bias"
        string_val: "res4a_branch2a/kernel"
        string_val: "res4a_branch2b/bias"
        string_val: "res4a_branch2b/kernel"
        string_val: "res4b_branch2b/bias"
        string_val: "res4b_branch2b/kernel"
        string_val: "res4b_branch2c/bias"
        string_val: "res4b_branch2c/kernel"
        string_val: "res5a_branch1/bias"
        string_val: "res5a_branch1/kernel"
        string_val: "res5a_branch2a/bias"
        string_val: "res5a_branch2a/kernel"
        string_val: "res5a_branch2b/bias"
        string_val: "res5a_branch2b/kernel"
        string_val: "res5b_branch2b/bias"
        string_val: "res5b_branch2b/kernel"
        string_val: "res5b_branch2c/bias"
        string_val: "res5b_branch2c/kernel"
      }
    }
  }
}
node {
  name: "save/SaveV2/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 122
          }
        }
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
      }
    }
  }
}
node {
  name: "save/SaveV2"
  op: "SaveV2"
  input: "save/Const"
  input: "save/SaveV2/tensor_names"
  input: "save/SaveV2/shape_and_slices"
  input: "bn2a_branch2b/beta"
  input: "bn2a_branch2b/gamma"
  input: "bn2a_branch2b/moving_mean"
  input: "bn2a_branch2b/moving_variance"
  input: "bn2a_branch2c/beta"
  input: "bn2a_branch2c/gamma"
  input: "bn2a_branch2c/moving_mean"
  input: "bn2a_branch2c/moving_variance"
  input: "bn2b_branch2b/beta"
  input: "bn2b_branch2b/gamma"
  input: "bn2b_branch2b/moving_mean"
  input: "bn2b_branch2b/moving_variance"
  input: "bn2b_branch2c/beta"
  input: "bn2b_branch2c/gamma"
  input: "bn2b_branch2c/moving_mean"
  input: "bn2b_branch2c/moving_variance"
  input: "bn3a_branch1/beta"
  input: "bn3a_branch1/gamma"
  input: "bn3a_branch1/moving_mean"
  input: "bn3a_branch1/moving_variance"
  input: "bn3a_branch2a/beta"
  input: "bn3a_branch2a/gamma"
  input: "bn3a_branch2a/moving_mean"
  input: "bn3a_branch2a/moving_variance"
  input: "bn3a_branch2b/beta"
  input: "bn3a_branch2b/gamma"
  input: "bn3a_branch2b/moving_mean"
  input: "bn3a_branch2b/moving_variance"
  input: "bn3b_branch2b/beta"
  input: "bn3b_branch2b/gamma"
  input: "bn3b_branch2b/moving_mean"
  input: "bn3b_branch2b/moving_variance"
  input: "bn3b_branch2c/beta"
  input: "bn3b_branch2c/gamma"
  input: "bn3b_branch2c/moving_mean"
  input: "bn3b_branch2c/moving_variance"
  input: "bn4a_branch1/beta"
  input: "bn4a_branch1/gamma"
  input: "bn4a_branch1/moving_mean"
  input: "bn4a_branch1/moving_variance"
  input: "bn4a_branch2a/beta"
  input: "bn4a_branch2a/gamma"
  input: "bn4a_branch2a/moving_mean"
  input: "bn4a_branch2a/moving_variance"
  input: "bn4a_branch2b/beta"
  input: "bn4a_branch2b/gamma"
  input: "bn4a_branch2b/moving_mean"
  input: "bn4a_branch2b/moving_variance"
  input: "bn4b_branch2b/beta"
  input: "bn4b_branch2b/gamma"
  input: "bn4b_branch2b/moving_mean"
  input: "bn4b_branch2b/moving_variance"
  input: "bn4b_branch2c/beta"
  input: "bn4b_branch2c/gamma"
  input: "bn4b_branch2c/moving_mean"
  input: "bn4b_branch2c/moving_variance"
  input: "bn5a_branch1/beta"
  input: "bn5a_branch1/gamma"
  input: "bn5a_branch1/moving_mean"
  input: "bn5a_branch1/moving_variance"
  input: "bn5a_branch2a/beta"
  input: "bn5a_branch2a/gamma"
  input: "bn5a_branch2a/moving_mean"
  input: "bn5a_branch2a/moving_variance"
  input: "bn5a_branch2b/beta"
  input: "bn5a_branch2b/gamma"
  input: "bn5a_branch2b/moving_mean"
  input: "bn5a_branch2b/moving_variance"
  input: "bn5b_branch2b/beta"
  input: "bn5b_branch2b/gamma"
  input: "bn5b_branch2b/moving_mean"
  input: "bn5b_branch2b/moving_variance"
  input: "bn5b_branch2c/beta"
  input: "bn5b_branch2c/gamma"
  input: "bn5b_branch2c/moving_mean"
  input: "bn5b_branch2c/moving_variance"
  input: "bn_conv1/beta"
  input: "bn_conv1/gamma"
  input: "bn_conv1/moving_mean"
  input: "bn_conv1/moving_variance"
  input: "conv1/bias"
  input: "conv1/kernel"
  input: "dense/bias"
  input: "dense/kernel"
  input: "res2a_branch2b/bias"
  input: "res2a_branch2b/kernel"
  input: "res2a_branch2c/bias"
  input: "res2a_branch2c/kernel"
  input: "res2b_branch2b/bias"
  input: "res2b_branch2b/kernel"
  input: "res2b_branch2c/bias"
  input: "res2b_branch2c/kernel"
  input: "res3a_branch1/bias"
  input: "res3a_branch1/kernel"
  input: "res3a_branch2a/bias"
  input: "res3a_branch2a/kernel"
  input: "res3a_branch2b/bias"
  input: "res3a_branch2b/kernel"
  input: "res3b_branch2b/bias"
  input: "res3b_branch2b/kernel"
  input: "res3b_branch2c/bias"
  input: "res3b_branch2c/kernel"
  input: "res4a_branch1/bias"
  input: "res4a_branch1/kernel"
  input: "res4a_branch2a/bias"
  input: "res4a_branch2a/kernel"
  input: "res4a_branch2b/bias"
  input: "res4a_branch2b/kernel"
  input: "res4b_branch2b/bias"
  input: "res4b_branch2b/kernel"
  input: "res4b_branch2c/bias"
  input: "res4b_branch2c/kernel"
  input: "res5a_branch1/bias"
  input: "res5a_branch1/kernel"
  input: "res5a_branch2a/bias"
  input: "res5a_branch2a/kernel"
  input: "res5a_branch2b/bias"
  input: "res5a_branch2b/kernel"
  input: "res5b_branch2b/bias"
  input: "res5b_branch2b/kernel"
  input: "res5b_branch2c/bias"
  input: "res5b_branch2c/kernel"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/control_dependency"
  op: "Identity"
  input: "save/Const"
  input: "^save/SaveV2"
  attr {
    key: "T"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@save/Const"
      }
    }
  }
}
node {
  name: "save/RestoreV2/tensor_names"
  op: "Const"
  device: "/device:CPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 122
          }
        }
        string_val: "bn2a_branch2b/beta"
        string_val: "bn2a_branch2b/gamma"
        string_val: "bn2a_branch2b/moving_mean"
        string_val: "bn2a_branch2b/moving_variance"
        string_val: "bn2a_branch2c/beta"
        string_val: "bn2a_branch2c/gamma"
        string_val: "bn2a_branch2c/moving_mean"
        string_val: "bn2a_branch2c/moving_variance"
        string_val: "bn2b_branch2b/beta"
        string_val: "bn2b_branch2b/gamma"
        string_val: "bn2b_branch2b/moving_mean"
        string_val: "bn2b_branch2b/moving_variance"
        string_val: "bn2b_branch2c/beta"
        string_val: "bn2b_branch2c/gamma"
        string_val: "bn2b_branch2c/moving_mean"
        string_val: "bn2b_branch2c/moving_variance"
        string_val: "bn3a_branch1/beta"
        string_val: "bn3a_branch1/gamma"
        string_val: "bn3a_branch1/moving_mean"
        string_val: "bn3a_branch1/moving_variance"
        string_val: "bn3a_branch2a/beta"
        string_val: "bn3a_branch2a/gamma"
        string_val: "bn3a_branch2a/moving_mean"
        string_val: "bn3a_branch2a/moving_variance"
        string_val: "bn3a_branch2b/beta"
        string_val: "bn3a_branch2b/gamma"
        string_val: "bn3a_branch2b/moving_mean"
        string_val: "bn3a_branch2b/moving_variance"
        string_val: "bn3b_branch2b/beta"
        string_val: "bn3b_branch2b/gamma"
        string_val: "bn3b_branch2b/moving_mean"
        string_val: "bn3b_branch2b/moving_variance"
        string_val: "bn3b_branch2c/beta"
        string_val: "bn3b_branch2c/gamma"
        string_val: "bn3b_branch2c/moving_mean"
        string_val: "bn3b_branch2c/moving_variance"
        string_val: "bn4a_branch1/beta"
        string_val: "bn4a_branch1/gamma"
        string_val: "bn4a_branch1/moving_mean"
        string_val: "bn4a_branch1/moving_variance"
        string_val: "bn4a_branch2a/beta"
        string_val: "bn4a_branch2a/gamma"
        string_val: "bn4a_branch2a/moving_mean"
        string_val: "bn4a_branch2a/moving_variance"
        string_val: "bn4a_branch2b/beta"
        string_val: "bn4a_branch2b/gamma"
        string_val: "bn4a_branch2b/moving_mean"
        string_val: "bn4a_branch2b/moving_variance"
        string_val: "bn4b_branch2b/beta"
        string_val: "bn4b_branch2b/gamma"
        string_val: "bn4b_branch2b/moving_mean"
        string_val: "bn4b_branch2b/moving_variance"
        string_val: "bn4b_branch2c/beta"
        string_val: "bn4b_branch2c/gamma"
        string_val: "bn4b_branch2c/moving_mean"
        string_val: "bn4b_branch2c/moving_variance"
        string_val: "bn5a_branch1/beta"
        string_val: "bn5a_branch1/gamma"
        string_val: "bn5a_branch1/moving_mean"
        string_val: "bn5a_branch1/moving_variance"
        string_val: "bn5a_branch2a/beta"
        string_val: "bn5a_branch2a/gamma"
        string_val: "bn5a_branch2a/moving_mean"
        string_val: "bn5a_branch2a/moving_variance"
        string_val: "bn5a_branch2b/beta"
        string_val: "bn5a_branch2b/gamma"
        string_val: "bn5a_branch2b/moving_mean"
        string_val: "bn5a_branch2b/moving_variance"
        string_val: "bn5b_branch2b/beta"
        string_val: "bn5b_branch2b/gamma"
        string_val: "bn5b_branch2b/moving_mean"
        string_val: "bn5b_branch2b/moving_variance"
        string_val: "bn5b_branch2c/beta"
        string_val: "bn5b_branch2c/gamma"
        string_val: "bn5b_branch2c/moving_mean"
        string_val: "bn5b_branch2c/moving_variance"
        string_val: "bn_conv1/beta"
        string_val: "bn_conv1/gamma"
        string_val: "bn_conv1/moving_mean"
        string_val: "bn_conv1/moving_variance"
        string_val: "conv1/bias"
        string_val: "conv1/kernel"
        string_val: "dense/bias"
        string_val: "dense/kernel"
        string_val: "res2a_branch2b/bias"
        string_val: "res2a_branch2b/kernel"
        string_val: "res2a_branch2c/bias"
        string_val: "res2a_branch2c/kernel"
        string_val: "res2b_branch2b/bias"
        string_val: "res2b_branch2b/kernel"
        string_val: "res2b_branch2c/bias"
        string_val: "res2b_branch2c/kernel"
        string_val: "res3a_branch1/bias"
        string_val: "res3a_branch1/kernel"
        string_val: "res3a_branch2a/bias"
        string_val: "res3a_branch2a/kernel"
        string_val: "res3a_branch2b/bias"
        string_val: "res3a_branch2b/kernel"
        string_val: "res3b_branch2b/bias"
        string_val: "res3b_branch2b/kernel"
        string_val: "res3b_branch2c/bias"
        string_val: "res3b_branch2c/kernel"
        string_val: "res4a_branch1/bias"
        string_val: "res4a_branch1/kernel"
        string_val: "res4a_branch2a/bias"
        string_val: "res4a_branch2a/kernel"
        string_val: "res4a_branch2b/bias"
        string_val: "res4a_branch2b/kernel"
        string_val: "res4b_branch2b/bias"
        string_val: "res4b_branch2b/kernel"
        string_val: "res4b_branch2c/bias"
        string_val: "res4b_branch2c/kernel"
        string_val: "res5a_branch1/bias"
        string_val: "res5a_branch1/kernel"
        string_val: "res5a_branch2a/bias"
        string_val: "res5a_branch2a/kernel"
        string_val: "res5a_branch2b/bias"
        string_val: "res5a_branch2b/kernel"
        string_val: "res5b_branch2b/bias"
        string_val: "res5b_branch2b/kernel"
        string_val: "res5b_branch2c/bias"
        string_val: "res5b_branch2c/kernel"
      }
    }
  }
}
node {
  name: "save/RestoreV2/shape_and_slices"
  op: "Const"
  device: "/device:CPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 122
          }
        }
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2/tensor_names"
  input: "save/RestoreV2/shape_and_slices"
  device: "/device:CPU:0"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign"
  op: "Assign"
  input: "bn2a_branch2b/beta"
  input: "save/RestoreV2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2a_branch2b/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_1"
  op: "Assign"
  input: "bn2a_branch2b/gamma"
  input: "save/RestoreV2:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2a_branch2b/gamma"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_2"
  op: "Assign"
  input: "bn2a_branch2b/moving_mean"
  input: "save/RestoreV2:2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2a_branch2b/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_3"
  op: "Assign"
  input: "bn2a_branch2b/moving_variance"
  input: "save/RestoreV2:3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2a_branch2b/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_4"
  op: "Assign"
  input: "bn2a_branch2c/beta"
  input: "save/RestoreV2:4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2a_branch2c/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_5"
  op: "Assign"
  input: "bn2a_branch2c/gamma"
  input: "save/RestoreV2:5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2a_branch2c/gamma"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_6"
  op: "Assign"
  input: "bn2a_branch2c/moving_mean"
  input: "save/RestoreV2:6"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2a_branch2c/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_7"
  op: "Assign"
  input: "bn2a_branch2c/moving_variance"
  input: "save/RestoreV2:7"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2a_branch2c/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_8"
  op: "Assign"
  input: "bn2b_branch2b/beta"
  input: "save/RestoreV2:8"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2b_branch2b/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_9"
  op: "Assign"
  input: "bn2b_branch2b/gamma"
  input: "save/RestoreV2:9"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2b_branch2b/gamma"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_10"
  op: "Assign"
  input: "bn2b_branch2b/moving_mean"
  input: "save/RestoreV2:10"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2b_branch2b/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_11"
  op: "Assign"
  input: "bn2b_branch2b/moving_variance"
  input: "save/RestoreV2:11"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2b_branch2b/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_12"
  op: "Assign"
  input: "bn2b_branch2c/beta"
  input: "save/RestoreV2:12"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2b_branch2c/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_13"
  op: "Assign"
  input: "bn2b_branch2c/gamma"
  input: "save/RestoreV2:13"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2b_branch2c/gamma"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_14"
  op: "Assign"
  input: "bn2b_branch2c/moving_mean"
  input: "save/RestoreV2:14"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2b_branch2c/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_15"
  op: "Assign"
  input: "bn2b_branch2c/moving_variance"
  input: "save/RestoreV2:15"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn2b_branch2c/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_16"
  op: "Assign"
  input: "bn3a_branch1/beta"
  input: "save/RestoreV2:16"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch1/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_17"
  op: "Assign"
  input: "bn3a_branch1/gamma"
  input: "save/RestoreV2:17"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch1/gamma"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_18"
  op: "Assign"
  input: "bn3a_branch1/moving_mean"
  input: "save/RestoreV2:18"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch1/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_19"
  op: "Assign"
  input: "bn3a_branch1/moving_variance"
  input: "save/RestoreV2:19"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch1/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_20"
  op: "Assign"
  input: "bn3a_branch2a/beta"
  input: "save/RestoreV2:20"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch2a/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_21"
  op: "Assign"
  input: "bn3a_branch2a/gamma"
  input: "save/RestoreV2:21"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch2a/gamma"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_22"
  op: "Assign"
  input: "bn3a_branch2a/moving_mean"
  input: "save/RestoreV2:22"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch2a/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_23"
  op: "Assign"
  input: "bn3a_branch2a/moving_variance"
  input: "save/RestoreV2:23"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch2a/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_24"
  op: "Assign"
  input: "bn3a_branch2b/beta"
  input: "save/RestoreV2:24"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch2b/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_25"
  op: "Assign"
  input: "bn3a_branch2b/gamma"
  input: "save/RestoreV2:25"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch2b/gamma"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_26"
  op: "Assign"
  input: "bn3a_branch2b/moving_mean"
  input: "save/RestoreV2:26"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch2b/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_27"
  op: "Assign"
  input: "bn3a_branch2b/moving_variance"
  input: "save/RestoreV2:27"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3a_branch2b/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_28"
  op: "Assign"
  input: "bn3b_branch2b/beta"
  input: "save/RestoreV2:28"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3b_branch2b/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_29"
  op: "Assign"
  input: "bn3b_branch2b/gamma"
  input: "save/RestoreV2:29"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3b_branch2b/gamma"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_30"
  op: "Assign"
  input: "bn3b_branch2b/moving_mean"
  input: "save/RestoreV2:30"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3b_branch2b/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_31"
  op: "Assign"
  input: "bn3b_branch2b/moving_variance"
  input: "save/RestoreV2:31"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3b_branch2b/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_32"
  op: "Assign"
  input: "bn3b_branch2c/beta"
  input: "save/RestoreV2:32"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3b_branch2c/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_33"
  op: "Assign"
  input: "bn3b_branch2c/gamma"
  input: "save/RestoreV2:33"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3b_branch2c/gamma"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_34"
  op: "Assign"
  input: "bn3b_branch2c/moving_mean"
  input: "save/RestoreV2:34"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3b_branch2c/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_35"
  op: "Assign"
  input: "bn3b_branch2c/moving_variance"
  input: "save/RestoreV2:35"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn3b_branch2c/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_36"
  op: "Assign"
  input: "bn4a_branch1/beta"
  input: "save/RestoreV2:36"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch1/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_37"
  op: "Assign"
  input: "bn4a_branch1/gamma"
  input: "save/RestoreV2:37"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch1/gamma"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_38"
  op: "Assign"
  input: "bn4a_branch1/moving_mean"
  input: "save/RestoreV2:38"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch1/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_39"
  op: "Assign"
  input: "bn4a_branch1/moving_variance"
  input: "save/RestoreV2:39"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch1/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_40"
  op: "Assign"
  input: "bn4a_branch2a/beta"
  input: "save/RestoreV2:40"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch2a/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_41"
  op: "Assign"
  input: "bn4a_branch2a/gamma"
  input: "save/RestoreV2:41"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch2a/gamma"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_42"
  op: "Assign"
  input: "bn4a_branch2a/moving_mean"
  input: "save/RestoreV2:42"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch2a/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_43"
  op: "Assign"
  input: "bn4a_branch2a/moving_variance"
  input: "save/RestoreV2:43"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch2a/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_44"
  op: "Assign"
  input: "bn4a_branch2b/beta"
  input: "save/RestoreV2:44"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch2b/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_45"
  op: "Assign"
  input: "bn4a_branch2b/gamma"
  input: "save/RestoreV2:45"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch2b/gamma"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_46"
  op: "Assign"
  input: "bn4a_branch2b/moving_mean"
  input: "save/RestoreV2:46"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch2b/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_47"
  op: "Assign"
  input: "bn4a_branch2b/moving_variance"
  input: "save/RestoreV2:47"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4a_branch2b/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_48"
  op: "Assign"
  input: "bn4b_branch2b/beta"
  input: "save/RestoreV2:48"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4b_branch2b/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_49"
  op: "Assign"
  input: "bn4b_branch2b/gamma"
  input: "save/RestoreV2:49"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4b_branch2b/gamma"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_50"
  op: "Assign"
  input: "bn4b_branch2b/moving_mean"
  input: "save/RestoreV2:50"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4b_branch2b/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_51"
  op: "Assign"
  input: "bn4b_branch2b/moving_variance"
  input: "save/RestoreV2:51"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4b_branch2b/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_52"
  op: "Assign"
  input: "bn4b_branch2c/beta"
  input: "save/RestoreV2:52"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4b_branch2c/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_53"
  op: "Assign"
  input: "bn4b_branch2c/gamma"
  input: "save/RestoreV2:53"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4b_branch2c/gamma"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_54"
  op: "Assign"
  input: "bn4b_branch2c/moving_mean"
  input: "save/RestoreV2:54"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4b_branch2c/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_55"
  op: "Assign"
  input: "bn4b_branch2c/moving_variance"
  input: "save/RestoreV2:55"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn4b_branch2c/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_56"
  op: "Assign"
  input: "bn5a_branch1/beta"
  input: "save/RestoreV2:56"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch1/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_57"
  op: "Assign"
  input: "bn5a_branch1/gamma"
  input: "save/RestoreV2:57"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch1/gamma"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_58"
  op: "Assign"
  input: "bn5a_branch1/moving_mean"
  input: "save/RestoreV2:58"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch1/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_59"
  op: "Assign"
  input: "bn5a_branch1/moving_variance"
  input: "save/RestoreV2:59"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch1/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_60"
  op: "Assign"
  input: "bn5a_branch2a/beta"
  input: "save/RestoreV2:60"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch2a/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_61"
  op: "Assign"
  input: "bn5a_branch2a/gamma"
  input: "save/RestoreV2:61"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch2a/gamma"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_62"
  op: "Assign"
  input: "bn5a_branch2a/moving_mean"
  input: "save/RestoreV2:62"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch2a/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_63"
  op: "Assign"
  input: "bn5a_branch2a/moving_variance"
  input: "save/RestoreV2:63"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch2a/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_64"
  op: "Assign"
  input: "bn5a_branch2b/beta"
  input: "save/RestoreV2:64"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch2b/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_65"
  op: "Assign"
  input: "bn5a_branch2b/gamma"
  input: "save/RestoreV2:65"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch2b/gamma"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_66"
  op: "Assign"
  input: "bn5a_branch2b/moving_mean"
  input: "save/RestoreV2:66"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch2b/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_67"
  op: "Assign"
  input: "bn5a_branch2b/moving_variance"
  input: "save/RestoreV2:67"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5a_branch2b/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_68"
  op: "Assign"
  input: "bn5b_branch2b/beta"
  input: "save/RestoreV2:68"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5b_branch2b/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_69"
  op: "Assign"
  input: "bn5b_branch2b/gamma"
  input: "save/RestoreV2:69"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5b_branch2b/gamma"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_70"
  op: "Assign"
  input: "bn5b_branch2b/moving_mean"
  input: "save/RestoreV2:70"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5b_branch2b/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_71"
  op: "Assign"
  input: "bn5b_branch2b/moving_variance"
  input: "save/RestoreV2:71"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5b_branch2b/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_72"
  op: "Assign"
  input: "bn5b_branch2c/beta"
  input: "save/RestoreV2:72"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5b_branch2c/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_73"
  op: "Assign"
  input: "bn5b_branch2c/gamma"
  input: "save/RestoreV2:73"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5b_branch2c/gamma"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_74"
  op: "Assign"
  input: "bn5b_branch2c/moving_mean"
  input: "save/RestoreV2:74"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5b_branch2c/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_75"
  op: "Assign"
  input: "bn5b_branch2c/moving_variance"
  input: "save/RestoreV2:75"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn5b_branch2c/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_76"
  op: "Assign"
  input: "bn_conv1/beta"
  input: "save/RestoreV2:76"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_conv1/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_77"
  op: "Assign"
  input: "bn_conv1/gamma"
  input: "save/RestoreV2:77"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_conv1/gamma"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_78"
  op: "Assign"
  input: "bn_conv1/moving_mean"
  input: "save/RestoreV2:78"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_conv1/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_79"
  op: "Assign"
  input: "bn_conv1/moving_variance"
  input: "save/RestoreV2:79"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_conv1/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_80"
  op: "Assign"
  input: "conv1/bias"
  input: "save/RestoreV2:80"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_81"
  op: "Assign"
  input: "conv1/kernel"
  input: "save/RestoreV2:81"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_82"
  op: "Assign"
  input: "dense/bias"
  input: "save/RestoreV2:82"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_83"
  op: "Assign"
  input: "dense/kernel"
  input: "save/RestoreV2:83"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_84"
  op: "Assign"
  input: "res2a_branch2b/bias"
  input: "save/RestoreV2:84"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res2a_branch2b/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_85"
  op: "Assign"
  input: "res2a_branch2b/kernel"
  input: "save/RestoreV2:85"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res2a_branch2b/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_86"
  op: "Assign"
  input: "res2a_branch2c/bias"
  input: "save/RestoreV2:86"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res2a_branch2c/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_87"
  op: "Assign"
  input: "res2a_branch2c/kernel"
  input: "save/RestoreV2:87"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res2a_branch2c/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_88"
  op: "Assign"
  input: "res2b_branch2b/bias"
  input: "save/RestoreV2:88"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res2b_branch2b/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_89"
  op: "Assign"
  input: "res2b_branch2b/kernel"
  input: "save/RestoreV2:89"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res2b_branch2b/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_90"
  op: "Assign"
  input: "res2b_branch2c/bias"
  input: "save/RestoreV2:90"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res2b_branch2c/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_91"
  op: "Assign"
  input: "res2b_branch2c/kernel"
  input: "save/RestoreV2:91"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res2b_branch2c/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_92"
  op: "Assign"
  input: "res3a_branch1/bias"
  input: "save/RestoreV2:92"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res3a_branch1/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_93"
  op: "Assign"
  input: "res3a_branch1/kernel"
  input: "save/RestoreV2:93"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res3a_branch1/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_94"
  op: "Assign"
  input: "res3a_branch2a/bias"
  input: "save/RestoreV2:94"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res3a_branch2a/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_95"
  op: "Assign"
  input: "res3a_branch2a/kernel"
  input: "save/RestoreV2:95"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res3a_branch2a/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_96"
  op: "Assign"
  input: "res3a_branch2b/bias"
  input: "save/RestoreV2:96"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res3a_branch2b/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_97"
  op: "Assign"
  input: "res3a_branch2b/kernel"
  input: "save/RestoreV2:97"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res3a_branch2b/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_98"
  op: "Assign"
  input: "res3b_branch2b/bias"
  input: "save/RestoreV2:98"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res3b_branch2b/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_99"
  op: "Assign"
  input: "res3b_branch2b/kernel"
  input: "save/RestoreV2:99"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res3b_branch2b/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_100"
  op: "Assign"
  input: "res3b_branch2c/bias"
  input: "save/RestoreV2:100"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res3b_branch2c/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_101"
  op: "Assign"
  input: "res3b_branch2c/kernel"
  input: "save/RestoreV2:101"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res3b_branch2c/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_102"
  op: "Assign"
  input: "res4a_branch1/bias"
  input: "save/RestoreV2:102"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res4a_branch1/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_103"
  op: "Assign"
  input: "res4a_branch1/kernel"
  input: "save/RestoreV2:103"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res4a_branch1/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_104"
  op: "Assign"
  input: "res4a_branch2a/bias"
  input: "save/RestoreV2:104"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res4a_branch2a/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_105"
  op: "Assign"
  input: "res4a_branch2a/kernel"
  input: "save/RestoreV2:105"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res4a_branch2a/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_106"
  op: "Assign"
  input: "res4a_branch2b/bias"
  input: "save/RestoreV2:106"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res4a_branch2b/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_107"
  op: "Assign"
  input: "res4a_branch2b/kernel"
  input: "save/RestoreV2:107"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res4a_branch2b/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_108"
  op: "Assign"
  input: "res4b_branch2b/bias"
  input: "save/RestoreV2:108"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res4b_branch2b/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_109"
  op: "Assign"
  input: "res4b_branch2b/kernel"
  input: "save/RestoreV2:109"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res4b_branch2b/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_110"
  op: "Assign"
  input: "res4b_branch2c/bias"
  input: "save/RestoreV2:110"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res4b_branch2c/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_111"
  op: "Assign"
  input: "res4b_branch2c/kernel"
  input: "save/RestoreV2:111"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res4b_branch2c/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_112"
  op: "Assign"
  input: "res5a_branch1/bias"
  input: "save/RestoreV2:112"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res5a_branch1/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_113"
  op: "Assign"
  input: "res5a_branch1/kernel"
  input: "save/RestoreV2:113"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res5a_branch1/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_114"
  op: "Assign"
  input: "res5a_branch2a/bias"
  input: "save/RestoreV2:114"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res5a_branch2a/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_115"
  op: "Assign"
  input: "res5a_branch2a/kernel"
  input: "save/RestoreV2:115"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res5a_branch2a/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_116"
  op: "Assign"
  input: "res5a_branch2b/bias"
  input: "save/RestoreV2:116"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res5a_branch2b/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_117"
  op: "Assign"
  input: "res5a_branch2b/kernel"
  input: "save/RestoreV2:117"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res5a_branch2b/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_118"
  op: "Assign"
  input: "res5b_branch2b/bias"
  input: "save/RestoreV2:118"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res5b_branch2b/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_119"
  op: "Assign"
  input: "res5b_branch2b/kernel"
  input: "save/RestoreV2:119"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res5b_branch2b/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_120"
  op: "Assign"
  input: "res5b_branch2c/bias"
  input: "save/RestoreV2:120"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res5b_branch2c/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_121"
  op: "Assign"
  input: "res5b_branch2c/kernel"
  input: "save/RestoreV2:121"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@res5b_branch2c/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/restore_all"
  op: "NoOp"
  input: "^save/Assign"
  input: "^save/Assign_1"
  input: "^save/Assign_10"
  input: "^save/Assign_100"
  input: "^save/Assign_101"
  input: "^save/Assign_102"
  input: "^save/Assign_103"
  input: "^save/Assign_104"
  input: "^save/Assign_105"
  input: "^save/Assign_106"
  input: "^save/Assign_107"
  input: "^save/Assign_108"
  input: "^save/Assign_109"
  input: "^save/Assign_11"
  input: "^save/Assign_110"
  input: "^save/Assign_111"
  input: "^save/Assign_112"
  input: "^save/Assign_113"
  input: "^save/Assign_114"
  input: "^save/Assign_115"
  input: "^save/Assign_116"
  input: "^save/Assign_117"
  input: "^save/Assign_118"
  input: "^save/Assign_119"
  input: "^save/Assign_12"
  input: "^save/Assign_120"
  input: "^save/Assign_121"
  input: "^save/Assign_13"
  input: "^save/Assign_14"
  input: "^save/Assign_15"
  input: "^save/Assign_16"
  input: "^save/Assign_17"
  input: "^save/Assign_18"
  input: "^save/Assign_19"
  input: "^save/Assign_2"
  input: "^save/Assign_20"
  input: "^save/Assign_21"
  input: "^save/Assign_22"
  input: "^save/Assign_23"
  input: "^save/Assign_24"
  input: "^save/Assign_25"
  input: "^save/Assign_26"
  input: "^save/Assign_27"
  input: "^save/Assign_28"
  input: "^save/Assign_29"
  input: "^save/Assign_3"
  input: "^save/Assign_30"
  input: "^save/Assign_31"
  input: "^save/Assign_32"
  input: "^save/Assign_33"
  input: "^save/Assign_34"
  input: "^save/Assign_35"
  input: "^save/Assign_36"
  input: "^save/Assign_37"
  input: "^save/Assign_38"
  input: "^save/Assign_39"
  input: "^save/Assign_4"
  input: "^save/Assign_40"
  input: "^save/Assign_41"
  input: "^save/Assign_42"
  input: "^save/Assign_43"
  input: "^save/Assign_44"
  input: "^save/Assign_45"
  input: "^save/Assign_46"
  input: "^save/Assign_47"
  input: "^save/Assign_48"
  input: "^save/Assign_49"
  input: "^save/Assign_5"
  input: "^save/Assign_50"
  input: "^save/Assign_51"
  input: "^save/Assign_52"
  input: "^save/Assign_53"
  input: "^save/Assign_54"
  input: "^save/Assign_55"
  input: "^save/Assign_56"
  input: "^save/Assign_57"
  input: "^save/Assign_58"
  input: "^save/Assign_59"
  input: "^save/Assign_6"
  input: "^save/Assign_60"
  input: "^save/Assign_61"
  input: "^save/Assign_62"
  input: "^save/Assign_63"
  input: "^save/Assign_64"
  input: "^save/Assign_65"
  input: "^save/Assign_66"
  input: "^save/Assign_67"
  input: "^save/Assign_68"
  input: "^save/Assign_69"
  input: "^save/Assign_7"
  input: "^save/Assign_70"
  input: "^save/Assign_71"
  input: "^save/Assign_72"
  input: "^save/Assign_73"
  input: "^save/Assign_74"
  input: "^save/Assign_75"
  input: "^save/Assign_76"
  input: "^save/Assign_77"
  input: "^save/Assign_78"
  input: "^save/Assign_79"
  input: "^save/Assign_8"
  input: "^save/Assign_80"
  input: "^save/Assign_81"
  input: "^save/Assign_82"
  input: "^save/Assign_83"
  input: "^save/Assign_84"
  input: "^save/Assign_85"
  input: "^save/Assign_86"
  input: "^save/Assign_87"
  input: "^save/Assign_88"
  input: "^save/Assign_89"
  input: "^save/Assign_9"
  input: "^save/Assign_90"
  input: "^save/Assign_91"
  input: "^save/Assign_92"
  input: "^save/Assign_93"
  input: "^save/Assign_94"
  input: "^save/Assign_95"
  input: "^save/Assign_96"
  input: "^save/Assign_97"
  input: "^save/Assign_98"
  input: "^save/Assign_99"
}
versions {
  producer: 134
}
