import 'package:ma_chana9_app/core/constants/api_constants.dart';
import 'package:ma_chana9_app/core/network/dio_client.dart';
import 'package:ma_chana9_app/shared/model/paginated/paginated_response.dart';
import '../models/annonce_model.dart';
import '../models/annonce_search_request_model.dart';

abstract class AnnonceRemoteDataSource {
  Future<AnnonceModel> createAnnonce(Map<String, dynamic> body);
  Future<AnnonceModel> updateAnnonce(String id, Map<String, dynamic> body);
  Future<void> deleteAnnonce(String id);
  Future<AnnonceModel> getAnnonceById(String id);
  Future<PaginatedResponse<AnnonceModel>> searchAnnonces(
    AnnonceSearchRequestModel request, {
    int page = 0,
    int size = 20,
  });
  Future<PaginatedResponse<AnnonceModel>> getAnnoncesBySeller(
    String sellerId, {
    int page = 0,
    int size = 20,
  });
  Future<void> suspendAnnonce(String id);
  Future<void> reactivateAnnonce(String id);
  Future<void> markAsSold(String id);
  Future<void> activateTopLot(String id, int durationDays);
  Future<void> flagAnnonce(String id, Map<String, dynamic> body);
  Future<void> addFavorite(String id);
  Future<void> removeFavorite(String id);
  Future<PaginatedResponse<AnnonceModel>> getFavorites({
    int page = 0,
    int size = 20,
  });
  Future<void> createAlert(Map<String, dynamic> body);
  Future<void> deleteAlert(String alertId);
  Future<List<Map<String, dynamic>>> getAlertsByBuyer();
}

class AnnonceRemoteDataSourceImpl implements AnnonceRemoteDataSource {
  final DioClient dioClient;

  static const String _base = ApiConstants.annonces;

  AnnonceRemoteDataSourceImpl(this.dioClient);

  @override
  Future<AnnonceModel> createAnnonce(Map<String, dynamic> body) async {
    final response = await dioClient.post(_base, data: body);
    return AnnonceModel.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<AnnonceModel> updateAnnonce(String id, Map<String, dynamic> body) async {
    final response = await dioClient.put('$_base/$id', data: body);
    return AnnonceModel.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<void> deleteAnnonce(String id) async {
    await dioClient.delete('$_base/$id');
  }

  @override
  Future<AnnonceModel> getAnnonceById(String id) async {
    final response = await dioClient.get('$_base/$id');
    return AnnonceModel.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<PaginatedResponse<AnnonceModel>> searchAnnonces(
    AnnonceSearchRequestModel request, {
    int page = 0,
    int size = 20,
  }) async {
    final queryParams = {
      ...request.toQueryParams(),
      'page': page,
      'size': size,
    };
    final response =
        await dioClient.get('$_base/search', queryParameters: queryParams);
    return PaginatedResponse.fromJson(
      response.data as Map<String, dynamic>,
      (json) => AnnonceModel.fromJson(json as Map<String, dynamic>),
    );
  }

  @override
  Future<PaginatedResponse<AnnonceModel>> getAnnoncesBySeller(
    String sellerId, {
    int page = 0,
    int size = 20,
  }) async {
    final response = await dioClient.get(
      '$_base/seller/$sellerId',
      queryParameters: {'page': page, 'size': size},
    );
    return PaginatedResponse.fromJson(
      response.data as Map<String, dynamic>,
      (json) => AnnonceModel.fromJson(json as Map<String, dynamic>),
    );
  }

  @override
  Future<void> suspendAnnonce(String id) async {
    await dioClient.patch('$_base/$id/suspend');
  }

  @override
  Future<void> reactivateAnnonce(String id) async {
    await dioClient.patch('$_base/$id/reactivate');
  }

  @override
  Future<void> markAsSold(String id) async {
    await dioClient.patch('$_base/$id/sold');
  }

  @override
  Future<void> activateTopLot(String id, int durationDays) async {
    await dioClient.patch(
      '$_base/$id/top-lot',
      queryParameters: {'durationDays': durationDays},
    );
  }

  @override
  Future<void> flagAnnonce(String id, Map<String, dynamic> body) async {
    await dioClient.post('$_base/$id/flag', data: body);
  }

  @override
  Future<void> addFavorite(String id) async {
    await dioClient.post('$_base/$id/favorites');
  }

  @override
  Future<void> removeFavorite(String id) async {
    await dioClient.delete('$_base/$id/favorites');
  }

  @override
  Future<PaginatedResponse<AnnonceModel>> getFavorites({
    int page = 0,
    int size = 20,
  }) async {
    final response = await dioClient.get(
      '$_base/favorites',
      queryParameters: {'page': page, 'size': size},
    );
    return PaginatedResponse.fromJson(
      response.data as Map<String, dynamic>,
      (json) => AnnonceModel.fromJson(json as Map<String, dynamic>),
    );
  }

  @override
  Future<void> createAlert(Map<String, dynamic> body) async {
    await dioClient.post('$_base/alerts', data: body);
  }

  @override
  Future<void> deleteAlert(String alertId) async {
    await dioClient.delete('$_base/alerts/$alertId');
  }

  @override
  Future<List<Map<String, dynamic>>> getAlertsByBuyer() async {
    final response = await dioClient.get('$_base/alerts');
    return (response.data as List)
        .cast<Map<String, dynamic>>();
  }
}
