import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ma_chana9_app/core/error/failure.dart';
import 'package:ma_chana9_app/core/usecases/usecase.dart';
import 'package:ma_chana9_app/shared/model/paginated/paginated_response.dart';
import '../entities/annonce.dart';
import '../repositories/annonce_repository.dart';

part 'get_favorites.freezed.dart';

@freezed
abstract class GetFavoritesParams with _$GetFavoritesParams {
  const factory GetFavoritesParams({
    @Default(0) int page,
    @Default(20) int size,
  }) = _GetFavoritesParams;
}

class GetFavorites
    implements UseCase<PaginatedResponse<Annonce>, GetFavoritesParams> {
  final AnnonceRepository repository;

  GetFavorites(this.repository);

  @override
  Future<Either<Failure, PaginatedResponse<Annonce>>> call(
      GetFavoritesParams params) {
    return repository.getFavorites(page: params.page, size: params.size);
  }
}
