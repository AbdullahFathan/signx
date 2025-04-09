import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:signx/features/ai_scan/domain/usecase/ai_scan_usecase.dart';
import 'ai_scan_state.dart';

class AiScanCubit extends Cubit<AiScanState> {
  final AiScanUsecase _classifySignUseCase;
  CameraController? _cameraController;
  List<CameraDescription>? _cameras;
  Timer? _timer;

  AiScanCubit(this._classifySignUseCase) : super(AiScanInitial());

  Future<void> initializeCamera() async {
    emit(AiScanLoading());
    try {
      _cameras = await availableCameras();
      if (_cameras!.isNotEmpty) {
        _cameraController = CameraController(
          _cameras![0],
          ResolutionPreset.medium,
          imageFormatGroup: ImageFormatGroup.yuv420,
        );
        await _cameraController!.initialize();
        emit(AiScanCameraInitialized(_cameraController!));
      } else {
        emit(AiScanError("Tidak ada kamera tersedia."));
      }
    } catch (e) {
      emit(AiScanError("Gagal menginisialisasi kamera: $e"));
    }
  }

  Future<void> classifySingleFrame(File imageFile) async {
    emit(AiScanPredictionLoading()); // Emit loading state
    final result = await _classifySignUseCase(imageFile);
    result.fold(
      (error) => emit(AiScanPredictionError(error)),
      (signLetter) => emit(AiScanPredictionLoaded(signLetter)),
    );
  }

  Future<void> stopLivePrediction() async {
    _timer?.cancel();
    await _cameraController?.stopImageStream();
    emit(AiScanLiveStreamStopped());
  }

  @override
  Future<void> close() {
    stopLivePrediction();
    _cameraController?.dispose();
    return super.close();
  }
}
