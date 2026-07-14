import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ma_chana9_app/core/error/failure.dart';
import 'package:ma_chana9_app/core/usecases/usecase.dart';
import 'package:ma_chana9_app/shared/model/paginated/paginated_response.dart';
import '../entities/annonce.dart';
import '../repositories/annonce_repository.dart';

part 'get_annonces_by_seller.freezed.dart';

@freezed
abstract class GetAnnoncesBySellerParams with _$GetAnnoncesBySellerParams {
  const factory GetAnnoncesBySellerParams({
    required String sellerId,
    @Default(0) int page,
    @Default(20) int size,
  }) = _GetAnnoncesBySellerParams;
}

class GetAnnoncesBySeller
    implements UseCase<PaginatedResponse<Annonce>, GetAnnoncesBySellerParams> {
  final AnnonceRepository repository;

  GetAnnoncesBySeller(this.repository);

  @override
  Future<Either<Failure, PaginatedResponse<Annonce>>> call(
      GetAnnoncesBySellerParams params) {
    return repository.getAnnoncesBySeller(
      params.sellerId,
      page: params.page,
      size: params.size,
    );
  }
}
