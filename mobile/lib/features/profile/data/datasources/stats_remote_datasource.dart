import 'package:ma_chana9_app/core/network/dio_client.dart';
import '../models/annonce_stats_model.dart';
import '../models/revenue_point_model.dart';
import '../models/seller_global_stats_model.dart';
import '../models/seller_revenue_model.dart';

abstract class StatsRemoteDataSource {
  Future<SellerGlobalStatsModel> getSellerGlobalStats(String sellerId);
  Future<SellerRevenueModel> getSellerRevenue(
      String sellerId, String period);
  Future<List<RevenuePointModel>> getRevenueTimeline(
      String sellerId, String period);
  Future<List<AnnonceStatsModel>> getAnnonceStatsBySeller(String sellerId);
}

class StatsRemoteDataSourceImpl implements StatsRemoteDataSource {
  final DioClient dioClient;

  StatsRemoteDataSourceImpl({required this.dioClient});

  static const String _base = '/annonces/stats';

  Map<String, dynamic> _data(dynamic response) =>
      response['data'] as Map<String, dynamic>;

  List<dynamic> _dataList(dynamic response) =>
      response['data'] as List<dynamic>;

  @override
  Future<SellerGlobalStatsModel> getSellerGlobalStats(
      String sellerId) async {
    final response = await dioClient.get('$_base/me');
    return SellerGlobalStatsModel.fromJson(_data(response.data));
  }

  @override
  Future<SellerRevenueModel> getSellerRevenue(
      String sellerId, String period) async {
    final response = await dioClient.get(
      '$_base/me/revenue',
      queryParameters: {'period': period},
    );
    return SellerRevenueModel.fromJson(_data(response.data));
  }

  @override
  Future<List<RevenuePointModel>> getRevenueTimeline(
      String sellerId, String period) async {
    final response = await dioClient.get(
      '$_base/me/revenue/chart',
      queryParameters: {'period': period},
    );
    return _dataList(response.data)
        .map((e) => RevenuePointModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<List<AnnonceStatsModel>> getAnnonceStatsBySeller(
      String sellerId) async {
    final response = await dioClient.get('$_base/me/annonces');
    return _dataList(response.data)
        .map((e) => AnnonceStatsModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}