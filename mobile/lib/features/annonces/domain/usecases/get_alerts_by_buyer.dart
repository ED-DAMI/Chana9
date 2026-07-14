import 'package:dartz/dartz.dart';
import 'package:ma_chana9_app/core/error/failure.dart';
import 'package:ma_chana9_app/core/usecases/usecase.dart';
import '../repositories/annonce_repository.dart';

class NoParams {
  const NoParams();
}
class GetAlertsByBuyer
    implements UseCase<List<Map<String, dynamic>>, NoParams> {
  final AnnonceRepository repository;

  GetAlertsByBuyer(this.repository);

  @override
  Future<Either<Failure, List<Map<String, dynamic>>>> call(NoParams params) {
    return repository.getAlertsByBuyer();
  }
}
