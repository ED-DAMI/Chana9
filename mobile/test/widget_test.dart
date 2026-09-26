// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ma_chana9_app/core/error/failure.dart';

void main() {
  test('fromDioException_whenUnauthorized_shouldCreateUnauthorizedFailure', () {
    final exception = DioException(
      requestOptions: RequestOptions(path: '/auth'),
      response: Response(statusCode: 401, requestOptions: RequestOptions(path: '/auth')),
      type: DioExceptionType.badResponse,
    );

    final failure = Failure.fromDioException(exception);

    expect(failure, const Failure.unauthorized());
    expect(failure.message, 'Session expirée, veuillez vous reconnecter');
  });

  test('fromDioException_whenServerReturnsMessage_shouldPreserveMessageAndStatus', () {
    final exception = DioException(
      requestOptions: RequestOptions(path: '/annonces'),
      response: Response(
        statusCode: 422,
        data: {'message': 'Prix invalide'},
        requestOptions: RequestOptions(path: '/annonces'),
      ),
      type: DioExceptionType.badResponse,
    );

    final failure = Failure.fromDioException(exception);

    expect(failure.message, 'Prix invalide');
    expect(failure.statusCode, 422);
  });

  test('fromDioException_whenConnectionTimesOut_shouldCreateNetworkFailure', () {
    final exception = DioException(
      requestOptions: RequestOptions(path: '/annonces'),
      type: DioExceptionType.connectionTimeout,
    );

    final failure = Failure.fromDioException(exception);

    expect(failure, const Failure.network('Délai de connexion dépassé'));
  });
}
