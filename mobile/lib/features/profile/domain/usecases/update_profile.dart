import 'package:dartz/dartz.dart';
import 'package:ma_chana9_app/core/error/failure.dart';
import 'package:ma_chana9_app/core/usecases/usecase.dart';
import 'package:ma_chana9_app/features/auth/domain/entities/user.dart';
import '../repositories/user_repository.dart';

class UpdateProfileParams {
  final String? fullName;
  final String? region;

  const UpdateProfileParams({this.fullName, this.region});
}

class UpdateProfile implements UseCase<User, UpdateProfileParams> {
  final UserRepository repository;

  UpdateProfile(this.repository);

  @override
  Future<Either<Failure, User>> call(UpdateProfileParams params) =>
      repository.updateProfile(
        fullName: params.fullName,
        region: params.region,
      );
}
