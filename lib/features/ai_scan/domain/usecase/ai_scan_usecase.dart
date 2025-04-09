import 'package:fpdart/fpdart.dart';
import 'package:signx/features/ai_scan/domain/entities/sign_leter.dart';
import 'package:signx/features/ai_scan/domain/repository/ai_scan_repo.dart';

import 'dart:io';

class AiScanUsecase {
  final AiScanRepo _repository;

  AiScanUsecase(this._repository);

  Future<Either<String, SignLetter>> call(File imageFile) {
    return _repository.classifySignFromImage(imageFile);
  }
}
