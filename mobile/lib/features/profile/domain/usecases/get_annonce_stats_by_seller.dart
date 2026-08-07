import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ma_chana9_app/core/error/failure.dart';
import 'package:ma_chana9_app/core/usecases/usecase.dart';
import '../entities/annonce_stats.dart';
import '../repositories/stats_repository.dart';

part 'get_annonce_stats_by_seller.freezed.dart';

@freezed
abstract class GetAnnonceStatsBySellerParams
    with _$GetAnnonceStatsBySellerParams {
  const factory GetAnnonceStatsBySellerParams({required String sellerId}) =
  _GetAnnonceStatsBySellerParams;
}

class GetAnnonceStatsBySeller
    implements
        UseCase<List<AnnonceStats>, GetAnnonceStatsBySellerParams> {
  final StatsRepository repository;

  GetAnnonceStatsBySeller(this.repository);

  @override
  Future<Either<Failure, List<AnnonceStats>>> call(
      GetAnnonceStatsBySellerParams params) =>
      repository.getAnnonceStatsBySeller(params.sellerId);
}