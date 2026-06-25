import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:paper_horizon/core/network/interceptor/auth_interceptor.dart';

import '../../../mocks/core/network/interceptor/mock_request_interceptor_handler.dart';
import '../../../mocks/core/network/mock_dio.dart';
import '../../../mocks/core/storage/secure_storage/mock_horizon_secure_storage.dart';

void main() {
  late MockHorizonSecureStorage mockSecureStorage;
  late MockRequestInterceptorHandler mockHandler;
  late AuthInterceptor sut;

  setUpAll(() {
    registerFallbackValue(FakeRequestOptions());
  });

  setUp(() {
    mockSecureStorage = MockHorizonSecureStorage();
    mockHandler = MockRequestInterceptorHandler();
    sut = AuthInterceptor(mockSecureStorage);
  });

  group('AuthInterceptor', () {
    group('onRequest', () {
      test(
        'should add Authorization header when access token exists',
        () async {
          // Arrange
          const String token = 'test_access_token';
          final RequestOptions options = RequestOptions(path: '/test');

          when(
            () => mockSecureStorage.getAccessToken(),
          ).thenAnswer((_) async => token);
          when(() => mockHandler.next(any())).thenReturn(null);

          // Act
          await sut.onRequest(options, mockHandler);

          // Assert
          expect(options.headers['Authorization'], token);
          verify(() => mockSecureStorage.getAccessToken()).called(1);
          verify(() => mockHandler.next(options)).called(1);
        },
      );

      test(
        'should not add Authorization header when access token is null',
        () async {
          // Arrange
          final RequestOptions options = RequestOptions(path: '/test');

          when(
            () => mockSecureStorage.getAccessToken(),
          ).thenAnswer((_) async => null);
          when(() => mockHandler.next(any())).thenReturn(null);

          // Act
          await sut.onRequest(options, mockHandler);

          // Assert
          expect(options.headers['Authorization'], isNull);
          verify(() => mockSecureStorage.getAccessToken()).called(1);
          verify(() => mockHandler.next(options)).called(1);
        },
      );

      test(
        'should not add Authorization header when access token is empty',
        () async {
          // Arrange
          final RequestOptions options = RequestOptions(path: '/test');

          when(
            () => mockSecureStorage.getAccessToken(),
          ).thenAnswer((_) async => '');
          when(() => mockHandler.next(any())).thenReturn(null);

          // Act
          await sut.onRequest(options, mockHandler);

          // Assert
          expect(options.headers['Authorization'], isNull);
          verify(() => mockSecureStorage.getAccessToken()).called(1);
          verify(() => mockHandler.next(options)).called(1);
        },
      );

      test(
        'should preserve existing headers when adding Authorization',
        () async {
          // Arrange
          const String token = 'test_access_token';
          final RequestOptions options = RequestOptions(
            path: '/test',
            headers: <String, dynamic>{'Custom-Header': 'custom_value'},
          );

          when(
            () => mockSecureStorage.getAccessToken(),
          ).thenAnswer((_) async => token);
          when(() => mockHandler.next(any())).thenReturn(null);

          // Act
          await sut.onRequest(options, mockHandler);

          // Assert
          expect(options.headers['Authorization'], token);
          expect(options.headers['Custom-Header'], 'custom_value');
          verify(() => mockHandler.next(options)).called(1);
        },
      );
    });
  });
}
