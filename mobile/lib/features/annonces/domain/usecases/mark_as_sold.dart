import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ma_chana9_app/core/error/failure.dart';
import 'package:ma_chana9_app/core/usecases/usecase.dart';
import 'package:ma_chana9_app/shared/model/paginated/paginated_response.dart';
import '../repositories/annonce_repository.dart';

part 'mark_as_sold.freezed.dart';

@freezed
abstract class MarkAsSoldParams with _$MarkAsSoldParams {
  const factory MarkAsSoldParams({required String id}) = _MarkAsSoldParams;
}

class MarkAsSold implements UseCase<Unit, MarkAsSoldParams> {
  final AnnonceRepository repository;

  MarkAsSold(this.repository);

  @override
  Future<Either<Failure, Unit>> call(MarkAsSoldParams params) {
    return repository.markAsSold(params.id);
  }
}
