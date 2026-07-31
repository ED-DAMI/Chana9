import 'package:dio/dio.dart';
import 'package:ma_chana9_app/core/constants/api_constants.dart';
import 'package:ma_chana9_app/core/network/dio_client.dart';
import 'package:ma_chana9_app/core/network/token_storage.dart';
import 'package:ma_chana9_app/shared/model/paginated/paginated_response.dart';
import '../models/annonce_model.dart';
import '../models/annonce_media_model.dart';
import '../models/annonce_report_request_model.dart';
import '../models/annonce_request_model.dart';
import '../models/annonce_search_request_model.dart';
import '../models/annonce_alert_request_model.dart';

abstract class AnnonceRemoteDataSource {
  Future<AnnonceModel> create(AnnonceRequestModel request);
  Future<AnnonceModel> update(String id, AnnonceRequestModel request);
  Future<void> delete(String id);
  Future<AnnonceModel> findById(String id);
  Future<PaginatedResponse<AnnonceModel>> search(
      AnnonceSearchRequestModel request, {
        int page = 0,
        int size = 20});
  Future<PaginatedResponse<AnnonceModel>> findBySeller(
      String sellerId, {
        int page = 0,
        int size = 20});
  Future<AnnonceModel> suspend(String id);
  Future<AnnonceModel> reactivate(String id);
  Future<AnnonceModel> markAsSold(String id);
  Future<AnnonceModel> activateTopLot(String id, int durationDays);
  Future<void> addFavorite(String id);
  Future<void> removeFavorite(String id);
  Future<PaginatedResponse<AnnonceModel>> findFavorites({
    int page = 0,
    int size = 20});
  Future<void> reportAnnonce(String id, AnnonceReportRequestModel request);
  Future<void> createAlert(AnnonceAlertRequestModel request);
  Future<void> deleteAlert(String alertId);
  Future<List<Map<String, dynamic>>> findAlertsByBuyer();
  Future<AnnonceMediaModel> uploadMedia(String annonceId, String filePath);
  Future<void> deleteMedia(String annonceId, String mediaId);
}

class AnnonceRemoteDataSourceImpl implements AnnonceRemoteDataSource {
  final DioClient dioClient;
  final TokenStorage tokenStorage;

  static const String _base = ApiConstants.annonces;

  AnnonceRemoteDataSourceImpl({
    required this.dioClient,
    required this.tokenStorage,
  });

  Map<String, dynamic> _extractData(dynamic responseData) {
    if (responseData is Map && responseData.containsKey('data')) {
      return responseData['data'] as Map<String, dynamic>;
    }
    return responseData as Map<String, dynamic>;
  }

  @override
  Future<AnnonceModel> create(AnnonceRequestModel request) async {
    final response = await dioClient.post(_base, data: request.toJson());
    return AnnonceModel.fromJson(_extractData(response.data));
  }

  @override
  Future<AnnonceModel> update(String id, AnnonceRequestModel request) async {
    final response = await dioClient.put('$_base/$id', data: request.toJson());
    return AnnonceModel.fromJson(_extractData(response.data));
  }

  @override
  Future<void> delete(String id) async {
    await dioClient.delete('$_base/$id');
  }

  @override
  Future<AnnonceModel> findById(String id) async {
    final response = await dioClient.get('$_base/$id');
    return AnnonceModel.fromJson(_extractData(response.data));
  }

  @override
  Future<PaginatedResponse<AnnonceModel>> search(
      AnnonceSearchRequestModel request, {
        int page = 0,
        int size = 20}) async {
    final response = await dioClient.get(
      '$_base/search',
      queryParameters: {
        ...request.toQueryParams(),
        'page': page,
        'size': size,
      },
    );
    return PaginatedResponse.fromJson(
      _extractData(response.data),
          (json) => AnnonceModel.fromJson(json as Map<String, dynamic>),
    );
  }
  @override
  Future<PaginatedResponse<AnnonceModel>> findBySeller(
      String sellerId, {
        int page = 0,
        int size = 20}) async {
    final response = await dioClient.get(
      '$_base/seller/$sellerId',
      queryParameters: {'page': page, 'size': size},
    );
    return PaginatedResponse.fromJson(
      _extractData(response.data),
          (json) => AnnonceModel.fromJson(json as Map<String, dynamic>),
    );
  }
  @override
  Future<AnnonceModel> suspend(String id) async {
    final response = await dioClient.patch('$_base/$id/suspend');
    return AnnonceModel.fromJson(_extractData(response.data));
  }
  @override
  Future<AnnonceModel> reactivate(String id) async {
    final response = await dioClient.patch('$_base/$id/reactivate');
    return AnnonceModel.fromJson(_extractData(response.data));
  }

  @override
  Future<AnnonceModel> markAsSold(String id) async {
    final response = await dioClient.patch('$_base/$id/sold');
    return AnnonceModel.fromJson(_extractData(response.data));
  }

  @override
  Future<AnnonceModel> activateTopLot(String id, int durationDays) async {
    final response = await dioClient.post('$_base/$id/top-lot/$durationDays');
    return AnnonceModel.fromJson(_extractData(response.data));
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
  Future<PaginatedResponse<AnnonceModel>> findFavorites({
    int page = 0,
    int size = 20}) async {
    final response = await dioClient.get(
      '$_base/favorites',
      queryParameters: {'page': page, 'size': size},
    );
    return PaginatedResponse.fromJson(
      _extractData(response.data),
          (json) => AnnonceModel.fromJson(json as Map<String, dynamic>),
    );
  }

  @override
  Future<void> reportAnnonce(String id, AnnonceReportRequestModel request) async {
    await dioClient.post('$_base/$id/reports', data: request.toJson());
  }

  @override
  Future<void> createAlert(AnnonceAlertRequestModel request) async {
    await dioClient.post('$_base/alerts', data: request.toJson());
  }

  @override
  Future<void> deleteAlert(String alertId) async {
    await dioClient.delete('$_base/alerts/$alertId');
  }

  @override
  Future<List<Map<String, dynamic>>> findAlertsByBuyer() async {
    final response = await dioClient.get('$_base/alerts');
    final data = response.data is Map && response.data.containsKey('data')
        ? response.data['data']
        : response.data;
    return (data as List).cast<Map<String, dynamic>>();
  }

  @override
  Future<AnnonceMediaModel> uploadMedia(String annonceId, String filePath) async {
    final fileName = filePath.split('/').last;
    final formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(filePath, filename: fileName),
    });
    final response = await dioClient.post(
      '$_base/$annonceId/medias',
      data: formData,
    );
    return AnnonceMediaModel.fromJson(_extractData(response.data));
  }

  @override
  Future<void> deleteMedia(String annonceId, String mediaId) async {
    await dioClient.delete('$_base/$annonceId/medias/$mediaId');
  }
}