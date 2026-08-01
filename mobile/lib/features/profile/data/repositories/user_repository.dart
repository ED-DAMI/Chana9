import 'package:dartz/dartz.dart';
import 'package:ma_chana9_app/core/error/failure.dart';
import 'package:ma_chana9_app/features/auth/domain/entities/user.dart';

import '../../domain/entities/user_stats.dart';


abstract class UserRepository {
  Future<Either<Failure, User>> getProfile();
  Future<Either<Failure, User>> updateProfile({
    String? fullName,
    String? region,
  });
  Future<Either<Failure, Unit>> changePassword({
    required String currentPassword,
    required String newPassword,
  });
  Future<Either<Failure, String>> uploadAvatar(String filePath);
  Future<Either<Failure, UserStats>> getUserStats(String userId);
}
