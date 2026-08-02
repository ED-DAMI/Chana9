import 'package:dartz/dartz.dart';
import 'package:ma_chana9_app/core/error/failure.dart';
import 'package:ma_chana9_app/core/usecases/usecase.dart';
import '../repositories/user_repository.dart';

class UploadAvatar implements UseCase<String, String> {
  final UserRepository repository;

  UploadAvatar(this.repository);

  @override
  Future<Either<Failure, String>> call(String filePath) =>
      repository.uploadAvatar(filePath);
}
