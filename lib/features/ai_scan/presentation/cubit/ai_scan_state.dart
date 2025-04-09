import 'package:camera/camera.dart';
import 'package:signx/features/ai_scan/domain/entities/sign_leter.dart';

abstract class AiScanState {}

class AiScanInitial extends AiScanState {}

class AiScanLoading extends AiScanState {}

class AiScanCameraInitialized extends AiScanState {
  final CameraController cameraController;
  AiScanCameraInitialized(this.cameraController);
}

class AiScanLiveStreamStarted extends AiScanState {}

class AiScanLiveStreamStopped extends AiScanState {}

class AiScanPredictionLoading extends AiScanState {}

class AiScanPredictionLoaded extends AiScanState {
  final SignLetter signLetter;
  AiScanPredictionLoaded(this.signLetter);
}

class AiScanError extends AiScanState {
  final String message;
  AiScanError(this.message);
}

class AiScanPredictionError extends AiScanState {
  final String message;
  AiScanPredictionError(this.message);
}
