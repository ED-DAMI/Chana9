import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dio/dio.dart';

part 'failure.freezed.dart';

@freezed
abstract class Failure with _$Failure {
  const Failure._();

  const factory Failure.server(String message) = ServerFailure;
  const factory Failure.network(String message) = NetworkFailure;
  const factory Failure.unauthorized() = UnauthorizedFailure;
  const factory Failure.notFound() = NotFoundFailure;
  const factory Failure.unknown(String message) = UnknownFailure;

  String get message => when(
    server: (m) => m,
    network: (m) => m,
    unauthorized: () => 'Session expirée, veuillez vous reconnecter',
    notFound: () => 'Ressource introuvable',
    unknown: (m) => m,
  );

  static Failure fromDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const Failure.network('Délai de connexion dépassé');
      case DioExceptionType.connectionError:
        return const Failure.network('Pas de connexion internet');
      case DioExceptionType.badResponse:
        return _fromStatusCode(e);
      default:
        return Failure.unknown(e.message ?? 'Erreur inconnue');
    }
  }

  static Failure _fromStatusCode(DioException e) {
    final code = e.response?.statusCode;
    final data = e.response?.data;
    final serverMsg = data is Map ? data['message'] as String? : null;

    switch (code) {
      case 400:
        return Failure.server(serverMsg ?? 'Requête invalide');
      case 401:
        return const Failure.unauthorized();
      case 403:
        return const Failure.server('Accès refusé');
      case 404:
        return const Failure.notFound();
      case 409:
        return Failure.server(serverMsg ?? 'Conflit de données');
      case 422:
        return Failure.server(serverMsg ?? 'Données invalides');
      case 500:
        return const Failure.server('Erreur serveur interne');
      default:
        return Failure.server(serverMsg ?? 'Erreur HTTP $code');
    }
  }
}