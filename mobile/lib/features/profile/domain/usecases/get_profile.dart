import 'package:dartz/dartz.dart';
import 'package:ma_chana9_app/core/error/failure.dart';
import 'package:ma_chana9_app/core/usecases/usecase.dart';
import 'package:ma_chana9_app/features/auth/domain/entities/user.dart';
import '../../../annonces/domain/usecases/get_alerts_by_buyer.dart';
import '../repositories/user_repository.dart';

class GetProfile implements UseCase<User, NoParams> {
  final UserRepository repository;

  GetProfile(this.repository);

  @override
  Future<Either<Failure, User>> call(NoParams params) =>
      repository.getProfile();
}
