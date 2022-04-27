from polygraphy.backend.onnxrt import OnnxrtRunner, SessionFromOnnx
from polygraphy.backend.trt import EngineFromNetwork, NetworkFromOnnxPath, TrtRunner
from polygraphy.comparator import Comparator, CompareFunc

def main():
    build_onnxrt_session = SessionFromOnnx("model_wa2.onnx")
    build_engine = EngineFromNetwork(NetworkFromOnnxPath("model_wa.onnx"))

    runners = [
        TrtRunner(build_engine),
        OnnxrtRunner(build_onnxrt_session)
    ]
    
    run_result = Comparator.run(runners)

    assert bool(Comparator.compare_accuracy(run_results=run_result, compare_func=CompareFunc().simple(atol=1e-8)))
    run_result.save("inference_result.json")

if __name__ == "__main__":
    main()