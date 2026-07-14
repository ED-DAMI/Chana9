import 'package:dartz/dartz.dart';
import 'package:ma_chana9_app/core/error/failure.dart';
import 'package:ma_chana9_app/shared/model/paginated/paginated_response.dart';
import '../entities/annonce.dart';
import '../../data/models/annonce_search_request_model.dart';

abstract class AnnonceRepository {
  Future<Either<Failure, Annonce>> createAnnonce(Map<String, dynamic> body);
  Future<Either<Failure, Annonce>> updateAnnonce(String id, Map<String, dynamic> body);
  Future<Either<Failure, Unit>> deleteAnnonce(String id);
  Future<Either<Failure, Annonce>> getAnnonceById(String id);
  Future<Either<Failure, PaginatedResponse<Annonce>>> searchAnnonces(
    AnnonceSearchRequestModel request, {
    int page = 0,
    int size = 20,
  });
  Future<Either<Failure, PaginatedResponse<Annonce>>> getAnnoncesBySeller(
    String sellerId, {
    int page = 0,
    int size = 20,
  });
  Future<Either<Failure, Unit>> suspendAnnonce(String id);
  Future<Either<Failure, Unit>> reactivateAnnonce(String id);
  Future<Either<Failure, Unit>> markAsSold(String id);
  Future<Either<Failure, Unit>> activateTopLot(String id, int durationDays);
  Future<Either<Failure, Unit>> flagAnnonce(String id, Map<String, dynamic> body);
  Future<Either<Failure, Unit>> addFavorite(String id);
  Future<Either<Failure, Unit>> removeFavorite(String id);
  Future<Either<Failure, PaginatedResponse<Annonce>>> getFavorites({
    int page = 0,
    int size = 20,
  });
  Future<Either<Failure, Unit>> createAlert(Map<String, dynamic> body);
  Future<Either<Failure, Unit>> deleteAlert(String alertId);
  Future<Either<Failure, List<Map<String, dynamic>>>> getAlertsByBuyer();
}
