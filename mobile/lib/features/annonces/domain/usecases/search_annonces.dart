import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ma_chana9_app/core/error/failure.dart';
import 'package:ma_chana9_app/core/usecases/usecase.dart';
import 'package:ma_chana9_app/shared/model/paginated/paginated_response.dart';
import '../entities/annonce.dart';
import '../repositories/annonce_repository.dart';
import '../../data/models/annonce_search_request_model.dart';

part 'search_annonces.freezed.dart';

@freezed
abstract class SearchAnnoncesParams with _$SearchAnnoncesParams {
  const factory SearchAnnoncesParams({
    required AnnonceSearchRequestModel request,
    @Default(0) int page,
    @Default(20) int size,
  }) = _SearchAnnoncesParams;
}

class SearchAnnonces
    implements UseCase<PaginatedResponse<Annonce>, SearchAnnoncesParams> {
  final AnnonceRepository repository;

  SearchAnnonces(this.repository);

  @override
  Future<Either<Failure, PaginatedResponse<Annonce>>> call(
      SearchAnnoncesParams params) {
    return repository.searchAnnonces(
      params.request,
      page: params.page,
      size: params.size,
    );
  }
}
