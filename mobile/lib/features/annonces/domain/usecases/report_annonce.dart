import 'package:dartz/dartz.dart';
import 'package:ma_chana9_app/core/error/failure.dart';
import 'package:ma_chana9_app/core/usecases/usecase.dart';
import '../repositories/annonce_repository.dart';

class ReportAnnonceParams {
  final String id;
  final String reason;
  final String? comment;

  const ReportAnnonceParams({
    required this.id,
    required this.reason,
    this.comment,
  });
}

class ReportAnnonce implements UseCase<Unit, ReportAnnonceParams> {
  final AnnonceRepository repository;

  ReportAnnonce(this.repository);

  @override
  Future<Either<Failure, Unit>> call(ReportAnnonceParams params) =>
      repository.reportAnnonce(params.id, params.reason, params.comment);
}