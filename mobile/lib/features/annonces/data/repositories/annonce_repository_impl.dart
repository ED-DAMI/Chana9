import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ma_chana9_app/core/error/failure.dart';
import 'package:ma_chana9_app/shared/model/paginated/paginated_response.dart';
import '../../domain/entities/annonce.dart';
import '../../domain/repositories/annonce_repository.dart';
import '../datasources/annonce_remote_datasource.dart';
import '../models/annonce_search_request_model.dart';

class AnnonceRepositoryImpl implements AnnonceRepository {
  final AnnonceRemoteDataSource remoteDataSource;

  AnnonceRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, Annonce>> createAnnonce(
      Map<String, dynamic> body) async {
    try {
      final model = await remoteDataSource.createAnnonce(body);
      return Right(model.toEntity());
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Server error'));
    }
  }

  @override
  Future<Either<Failure, Annonce>> updateAnnonce(
      String id, Map<String, dynamic> body) async {
    try {
      final model = await remoteDataSource.updateAnnonce(id, body);
      return Right(model.toEntity());
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Server error'));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteAnnonce(String id) async {
    try {
      await remoteDataSource.deleteAnnonce(id);
      return const Right(unit);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Server error'));
    }
  }

  @override
  Future<Either<Failure, Annonce>> getAnnonceById(String id) async {
    try {
      final model = await remoteDataSource.getAnnonceById(id);
      return Right(model.toEntity());
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Server error'));
    }
  }

  @override
  Future<Either<Failure, PaginatedResponse<Annonce>>> searchAnnonces(
    AnnonceSearchRequestModel request, {
    int page = 0,
    int size = 20,
  }) async {
    try {
      final result = await remoteDataSource.searchAnnonces(
        request,
        page: page,
        size: size,
      );
      return Right(result.map((m) => m.toEntity()));
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Server error'));
    }
  }

  @override
  Future<Either<Failure, PaginatedResponse<Annonce>>> getAnnoncesBySeller(
    String sellerId, {
    int page = 0,
    int size = 20,
  }) async {
    try {
      final result = await remoteDataSource.getAnnoncesBySeller(
        sellerId,
        page: page,
        size: size,
      );
      return Right(result.map((m) => m.toEntity()));
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Server error'));
    }
  }

  @override
  Future<Either<Failure, Unit>> suspendAnnonce(String id) async {
    try {
      await remoteDataSource.suspendAnnonce(id);
      return const Right(unit);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Server error'));
    }
  }

  @override
  Future<Either<Failure, Unit>> reactivateAnnonce(String id) async {
    try {
      await remoteDataSource.reactivateAnnonce(id);
      return const Right(unit);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Server error'));
    }
  }

  @override
  Future<Either<Failure, Unit>> markAsSold(String id) async {
    try {
      await remoteDataSource.markAsSold(id);
      return const Right(unit);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Server error'));
    }
  }

  @override
  Future<Either<Failure, Unit>> activateTopLot(
      String id, int durationDays) async {
    try {
      await remoteDataSource.activateTopLot(id, durationDays);
      return const Right(unit);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Server error'));
    }
  }

  @override
  Future<Either<Failure, Unit>> flagAnnonce(
      String id, Map<String, dynamic> body) async {
    try {
      await remoteDataSource.flagAnnonce(id, body);
      return const Right(unit);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Server error'));
    }
  }

  @override
  Future<Either<Failure, Unit>> addFavorite(String id) async {
    try {
      await remoteDataSource.addFavorite(id);
      return const Right(unit);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Server error'));
    }
  }

  @override
  Future<Either<Failure, Unit>> removeFavorite(String id) async {
    try {
      await remoteDataSource.removeFavorite(id);
      return const Right(unit);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Server error'));
    }
  }

  @override
  Future<Either<Failure, PaginatedResponse<Annonce>>> getFavorites({
    int page = 0,
    int size = 20,
  }) async {
    try {
      final result = await remoteDataSource.getFavorites(
        page: page,
        size: size,
      );
      return Right(result.map((m) => m.toEntity()));
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Server error'));
    }
  }

  @override
  Future<Either<Failure, Unit>> createAlert(Map<String, dynamic> body) async {
    try {
      await remoteDataSource.createAlert(body);
      return const Right(unit);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Server error'));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteAlert(String alertId) async {
    try {
      await remoteDataSource.deleteAlert(alertId);
      return const Right(unit);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Server error'));
    }
  }

  @override
  Future<Either<Failure, List<Map<String, dynamic>>>> getAlertsByBuyer() async {
    try {
      final result = await remoteDataSource.getAlertsByBuyer();
      return Right(result);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Server error'));
    }
  }
}
