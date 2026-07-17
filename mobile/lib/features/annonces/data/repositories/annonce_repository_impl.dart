import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ma_chana9_app/core/error/failure.dart';
import '../../../../shared/enums/animal_gender.dart';
import '../../../../shared/model/paginated/paginated_response.dart';
import '../models/annonce_alert_request_model.dart';
import '../models/annonce_request_model.dart';
import '../../domain/entities/annonce.dart';
import '../../domain/entities/annonce_media.dart';
import '../../domain/repositories/annonce_repository.dart';
import '../datasources/annonce_remote_datasource.dart';
import '../models/annonce_search_request_model.dart';

class AnnonceRepositoryImpl implements AnnonceRepository {
  final AnnonceRemoteDataSource remoteDataSource;

  AnnonceRepositoryImpl(this.remoteDataSource);

  Future<Either<Failure, T>> _execute<T>(Future<T> Function() call) async {
    try {
      return Right(await call());
    } on DioException catch (e) {
      return Left(Failure.fromDioException(e));
    } catch (e) {
      return Left(Failure.unknown(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Annonce>> createAnnonce(
      Map<String, dynamic> body) =>
      _execute(() async {
        final request = _bodyToRequest(body);
        return (await remoteDataSource.create(request)).toEntity();
      });

  @override
  Future<Either<Failure, Annonce>> updateAnnonce(
      String id, Map<String, dynamic> body) =>
      _execute(() async {
        final request = _bodyToRequest(body);
        return (await remoteDataSource.update(id, request)).toEntity();
      });

  @override
  Future<Either<Failure, Unit>> deleteAnnonce(String id) =>
      _execute(() async {
        await remoteDataSource.delete(id);
        return unit;
      });

  @override
  Future<Either<Failure, Annonce>> getAnnonceById(String id) =>
      _execute(() async =>
          (await remoteDataSource.findById(id)).toEntity());

  @override
  Future<Either<Failure, PaginatedResponse<Annonce>>> searchAnnonces(
      AnnonceSearchRequestModel request,
      {int page = 0, int size = 20}) =>
      _execute(() async {
        final result = await remoteDataSource.search(
          request,
          page: page,
          size: size,
        );
        return result.map((m) => m.toEntity());
      });

  @override
  Future<Either<Failure, PaginatedResponse<Annonce>>> getAnnoncesBySeller(
      String sellerId,
      {int page = 0, int size = 20}) =>
      _execute(() async {
        final result = await remoteDataSource.findBySeller(
          sellerId,
          page: page,
          size: size,
        );
        return result.map((m) => m.toEntity());
      });

  @override
  Future<Either<Failure, Unit>> suspendAnnonce(String id) =>
      _execute(() async {
        await remoteDataSource.suspend(id);
        return unit;
      });

  @override
  Future<Either<Failure, Unit>> reactivateAnnonce(String id) =>
      _execute(() async {
        await remoteDataSource.reactivate(id);
        return unit;
      });

  @override
  Future<Either<Failure, Unit>> markAsSold(String id) =>
      _execute(() async {
        await remoteDataSource.markAsSold(id);
        return unit;
      });

  @override
  Future<Either<Failure, Unit>> activateTopLot(
      String id, int durationDays) =>
      _execute(() async {
        await remoteDataSource.activateTopLot(id, durationDays);
        return unit;
      });

  @override
  Future<Either<Failure, Unit>> flagAnnonce(
      String id, Map<String, dynamic> body) =>
      _execute(() async {
        await remoteDataSource.flag(id, body);
        return unit;
      });

  @override
  Future<Either<Failure, Unit>> addFavorite(String id) =>
      _execute(() async {
        await remoteDataSource.addFavorite(id);
        return unit;
      });

  @override
  Future<Either<Failure, Unit>> removeFavorite(String id) =>
      _execute(() async {
        await remoteDataSource.removeFavorite(id);
        return unit;
      });

  @override
  Future<Either<Failure, PaginatedResponse<Annonce>>> getFavorites(
      {int page = 0, int size = 20}) =>
      _execute(() async {
        final result = await remoteDataSource.findFavorites(
          page: page,
          size: size,
        );
        return result.map((m) => m.toEntity());
      });

  @override
  Future<Either<Failure, Unit>> createAlert(Map<String, dynamic> body) =>
      _execute(() async {
        final request = AnnonceAlertRequestModel(
          breed: body['breed'] as String?,
          region: body['region'] as String?,
          radiusKm: body['radiusKm'] as int?,
          maxPrice: (body['maxPrice'] as num?)?.toDouble(),
          minAgeMonths: body['minAgeMonths'] as int?,
        );
        await remoteDataSource.createAlert(request);
        return unit;
      });

  @override
  Future<Either<Failure, Unit>> deleteAlert(String alertId) =>
      _execute(() async {
        await remoteDataSource.deleteAlert(alertId);
        return unit;
      });

  @override
  Future<Either<Failure, List<Map<String, dynamic>>>> getAlertsByBuyer() =>
      _execute(() => remoteDataSource.findAlertsByBuyer());

  @override
  Future<Either<Failure, AnnonceMedia>> uploadMedia(
      String annonceId, String filePath) =>
      _execute(() async {
        final model =
        await remoteDataSource.uploadMedia(annonceId, filePath);
        return model.toEntity();
      });


  AnnonceRequestModel _bodyToRequest(Map<String, dynamic> body) {
    return AnnonceRequestModel(
      title: body['title'] as String,
      description: body['description'] as String?,
      breed: body['breed'] as String,
      estimatedWeight: (body['estimatedWeight'] as num?)?.toDouble(),
      price: (body['price'] as num).toDouble(),
      priceNegotiable: body['priceNegotiable'] as bool?,
      region: body['region'] as String,
      gender: body['gender'] != null
          ? AnimalGenderExtension.fromString(body['gender'] as String)
          : null,
      birthDate: body['birthDate'] as String?,
      ageMonths: body['ageMonths'] as int?,
      latitude: (body['latitude'] as num?)?.toDouble(),
      longitude: (body['longitude'] as num?)?.toDouble(),
      addressLabel: body['addressLabel'] as String?,
      deliveryAvailable: body['deliveryAvailable'] as bool?,
      deliveryRadiusKm: body['deliveryRadiusKm'] as int?,
      deliveryPrice: (body['deliveryPrice'] as num?)?.toDouble(),
    );
  }
}