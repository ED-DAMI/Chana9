import 'package:dartz/dartz.dart';
import 'package:ma_chana9_app/core/error/failure.dart';
import 'package:ma_chana9_app/core/usecases/usecase.dart';
import '../entities/user_stats.dart';
import '../repositories/user_repository.dart';

class GetUserStats implements UseCase<UserStats, String> {
  final UserRepository repository;

  GetUserStats(this.repository);

  @override
  Future<Either<Failure, UserStats>> call(String userId) =>
      repository.getUserStats(userId);
}
