import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ma_chana9_app/core/error/failure.dart';
import 'package:ma_chana9_app/core/usecases/usecase.dart';
import '../entities/annonce_media.dart';
import '../repositories/annonce_repository.dart';

part 'upload_media.freezed.dart';

@freezed
abstract class UploadMediaParams with _$UploadMediaParams {
  const factory UploadMediaParams({
    required String annonceId,
    required String filePath,
  }) = _UploadMediaParams;
}

class UploadMedia implements UseCase<AnnonceMedia, UploadMediaParams> {
  final AnnonceRepository repository;

  UploadMedia(this.repository);

  @override
  Future<Either<Failure, AnnonceMedia>> call(UploadMediaParams params) {
    return repository.uploadMedia(params.annonceId, params.filePath);
  }
}