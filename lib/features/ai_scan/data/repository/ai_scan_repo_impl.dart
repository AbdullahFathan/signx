import 'dart:io';
import 'package:fpdart/fpdart.dart';

import 'package:signx/features/ai_scan/data/data_source/local/image_classified.dart';
import 'package:signx/features/ai_scan/domain/entities/sign_leter.dart';
import 'package:signx/features/ai_scan/domain/repository/ai_scan_repo.dart';
import 'package:signx/utils/constans.dart';

class AiScanRepoImpl implements AiScanRepo {
  final TFLiteLocalDataSource _localDataSource;

  AiScanRepoImpl(this._localDataSource);

  @override
  Future<Either<String, SignLetter>> classifySignFromImage(
    File imageFile,
  ) async {
    final result = await _localDataSource.classifyImage(imageFile);
    return result.fold((error) => Left(error), (predictedIndex) {
      if (predictedIndex >= 0 &&
          predictedIndex < Constants.alphabetLabels.length) {
        return Right(SignLetter(Constants.alphabetLabels[predictedIndex], 1.0));
      } else {
        return const Left("Indeks prediksi tidak valid");
      }
    });
  }
}
