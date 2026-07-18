import 'package:dio/dio.dart';
import 'package:ma_chana9_app/core/network/dio_client.dart';
import 'package:ma_chana9_app/core/network/token_storage.dart';
import 'package:ma_chana9_app/shared/model/paginated/paginated_response.dart';
import '../models/annonce_model.dart';
import '../models/annonce_media_model.dart';
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
        int size = 20,
      });
  Future<PaginatedResponse<AnnonceModel>> findBySeller(
      String sellerId, {
        int page = 0,
        int size = 20,
      });
  Future<AnnonceModel> suspend(String id);
  Future<AnnonceModel> reactivate(String id);
  Future<AnnonceModel> markAsSold(String id);
  Future<AnnonceModel> activateTopLot(String id, int durationDays);
  Future<void> flag(String id, Map<String, dynamic> body);
  Future<void> addFavorite(String id);
  Future<void> removeFavorite(String id);
  Future<PaginatedResponse<AnnonceModel>> findFavorites({
    int page = 0,
    int size = 20,
  });
  Future<void> createAlert(AnnonceAlertRequestModel request);
  Future<void> deleteAlert(String alertId);
  Future<List<Map<String, dynamic>>> findAlertsByBuyer();
  Future<AnnonceMediaModel> uploadMedia(String annonceId, String filePath);
  Future<void> deleteMedia(String annonceId, String mediaId);
}

class AnnonceRemoteDataSourceImpl implements AnnonceRemoteDataSource {
  final DioClient dioClient;
  final TokenStorage tokenStorage;

  static const String _base = '/api/v1/annonces';

  AnnonceRemoteDataSourceImpl({
    required this.dioClient,
    required this.tokenStorage,
  });

  Future<Options> _userIdHeader() async {
    final user = await tokenStorage.getCachedUser();
    return Options(headers: {'X-User-Id': user?.id ?? ''});
  }

  @override
  Future<AnnonceModel> create(AnnonceRequestModel request) async {
    final response = await dioClient.post(
      _base,
      data: request.toJson(),
      options: await _userIdHeader(),
    );
    return AnnonceModel.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<AnnonceModel> update(String id, AnnonceRequestModel request) async {
    final response = await dioClient.put(
      '$_base/$id',
      data: request.toJson(),
      options: await _userIdHeader(),
    );
    return AnnonceModel.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<void> delete(String id) async {
    await dioClient.delete('$_base/$id', options: await _userIdHeader());
  }

  @override
  Future<AnnonceModel> findById(String id) async {
    final response = await dioClient.get('$_base/$id');
    return AnnonceModel.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<PaginatedResponse<AnnonceModel>> search(
      AnnonceSearchRequestModel request, {
        int page = 0,
        int size = 20,
      }) async {
    final response = await dioClient.get(
      '$_base/search',
      queryParameters: {
        ...request.toQueryParams(),
        'page': page,
        'size': size,
      },
    );
    return PaginatedResponse.fromJson(
      response.data as Map<String, dynamic>,
          (json) => AnnonceModel.fromJson(json as Map<String, dynamic>),
    );
  }

  @override
  Future<PaginatedResponse<AnnonceModel>> findBySeller(
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
  Future<AnnonceModel> suspend(String id) async {
    final response = await dioClient.patch(
      '$_base/$id/suspend',
      options: await _userIdHeader(),
    );
    return AnnonceModel.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<AnnonceModel> reactivate(String id) async {
    final response = await dioClient.patch(
      '$_base/$id/reactivate',
      options: await _userIdHeader(),
    );
    return AnnonceModel.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<AnnonceModel> markAsSold(String id) async {
    final response = await dioClient.patch(
      '$_base/$id/sold',
      options: await _userIdHeader(),
    );
    return AnnonceModel.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<AnnonceModel> activateTopLot(String id, int durationDays) async {
    final response = await dioClient.post(
      '$_base/$id/top-lot/$durationDays',
      options: await _userIdHeader(),
    );
    return AnnonceModel.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<void> flag(String id, Map<String, dynamic> body) async {
    await dioClient.post(
      '$_base/$id/flag',
      data: body,
      options: await _userIdHeader(),
    );
  }

  @override
  Future<void> addFavorite(String id) async {
    await dioClient.post(
      '$_base/$id/favorites',
      options: await _userIdHeader(),
    );
  }

  @override
  Future<void> removeFavorite(String id) async {
    await dioClient.delete(
      '$_base/$id/favorites',
      options: await _userIdHeader(),
    );
  }

  @override
  Future<PaginatedResponse<AnnonceModel>> findFavorites({
    int page = 0,
    int size = 20,
  }) async {
    final response = await dioClient.get(
      '$_base/favorites',
      queryParameters: {'page': page, 'size': size},
      options: await _userIdHeader(),
    );
    return PaginatedResponse.fromJson(
      response.data as Map<String, dynamic>,
          (json) => AnnonceModel.fromJson(json as Map<String, dynamic>),
    );
  }

  @override
  Future<void> createAlert(AnnonceAlertRequestModel request) async {
    await dioClient.post(
      '$_base/alerts',
      data: request.toJson(),
      options: await _userIdHeader(),
    );
  }

  @override
  Future<void> deleteAlert(String alertId) async {
    await dioClient.delete(
      '$_base/alerts/$alertId',
      options: await _userIdHeader(),
    );
  }

  @override
  Future<List<Map<String, dynamic>>> findAlertsByBuyer() async {
    final response = await dioClient.get(
      '$_base/alerts',
      options: await _userIdHeader(),
    );
    return (response.data as List).cast<Map<String, dynamic>>();
  }

  @override

  Future<AnnonceMediaModel> uploadMedia(
      String annonceId, String filePath) async {
    final fileName = filePath.split('/').last;

    final formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(
        filePath,
        filename: fileName,
      ),
    });

    final response = await dioClient.post(
      '$_base/$annonceId/medias',
      data: formData,
    );
    final raw = response.data;
    final json = raw is Map && raw.containsKey('data')
        ? raw['data'] as Map<String, dynamic>
        : raw as Map<String, dynamic>;

    return AnnonceMediaModel.fromJson(json);
  }

  @override
  Future<void> deleteMedia(String annonceId, String mediaId) async {
    await dioClient.delete('$_base/$annonceId/medias/$mediaId');
  }
}
