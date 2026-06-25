import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:paper_horizon/core/network/network_error_handler.dart';
import 'package:paper_horizon/core/network/network_exception.dart';

import '../../mocks/core/network/mock_dio.dart';

class FakeUri extends Fake implements Uri {
  @override
  String toString() => 'https://api.example.com/test';
}

void main() {
  late NetworkErrorHandler sut;

  setUpAll(() {
    registerFallbackValue(FakeUri());
  });

  setUp(() {
    sut = const NetworkErrorHandler();
  });

  group('NetworkErrorHandler', () {
    group('handle - DioException types', () {
      test('should handle connectionTimeout with correct message', () {
        // Arrange
        final MockRequestOptions mockRequestOptions = MockRequestOptions();
        final MockDioException mockDioException = MockDioException();

        when(() => mockRequestOptions.uri).thenReturn(FakeUri());
        when(() => mockRequestOptions.method).thenReturn('GET');
        when(
          () => mockDioException.type,
        ).thenReturn(DioExceptionType.connectionTimeout);
        when(
          () => mockDioException.requestOptions,
        ).thenReturn(mockRequestOptions);
        when(() => mockDioException.response).thenReturn(null);

        // Act
        final NetworkException result = sut.handle(mockDioException);

        // Assert
        expect(result, isA<NetworkException>());
        expect(result.message, contains('timeout'));
        expect(result.requestUrl, 'https://api.example.com/test');
        expect(result.requestMethod, 'GET');
        expect(result.timestamp, isNotNull);
      });

      test('should handle receiveTimeout with correct message', () {
        // Arrange
        final MockRequestOptions mockRequestOptions = MockRequestOptions();
        final MockDioException mockDioException = MockDioException();

        when(() => mockRequestOptions.uri).thenReturn(FakeUri());
        when(() => mockRequestOptions.method).thenReturn('POST');
        when(
          () => mockDioException.type,
        ).thenReturn(DioExceptionType.receiveTimeout);
        when(
          () => mockDioException.requestOptions,
        ).thenReturn(mockRequestOptions);
        when(() => mockDioException.response).thenReturn(null);

        // Act
        final NetworkException result = sut.handle(mockDioException);

        // Assert
        expect(result.message, contains('timeout'));
        expect(result.requestMethod, 'POST');
      });

      test('should handle cancel with correct message', () {
        // Arrange
        final MockRequestOptions mockRequestOptions = MockRequestOptions();
        final MockDioException mockDioException = MockDioException();

        when(() => mockRequestOptions.uri).thenReturn(FakeUri());
        when(() => mockRequestOptions.method).thenReturn('GET');
        when(() => mockDioException.type).thenReturn(DioExceptionType.cancel);
        when(
          () => mockDioException.requestOptions,
        ).thenReturn(mockRequestOptions);
        when(() => mockDioException.response).thenReturn(null);

        // Act
        final NetworkException result = sut.handle(mockDioException);

        // Assert
        expect(result.message, contains('cancelled'));
      });

      test('should handle connectionError with no internet message', () {
        // Arrange
        final MockRequestOptions mockRequestOptions = MockRequestOptions();
        final MockDioException mockDioException = MockDioException();

        when(() => mockRequestOptions.uri).thenReturn(FakeUri());
        when(() => mockRequestOptions.method).thenReturn('GET');
        when(
          () => mockDioException.type,
        ).thenReturn(DioExceptionType.connectionError);
        when(
          () => mockDioException.requestOptions,
        ).thenReturn(mockRequestOptions);
        when(() => mockDioException.response).thenReturn(null);

        // Act
        final NetworkException result = sut.handle(mockDioException);

        // Assert
        expect(result.message, contains('internet'));
      });

      test('should handle unknown with SocketException as no internet', () {
        // Arrange
        final MockRequestOptions mockRequestOptions = MockRequestOptions();
        final MockDioException mockDioException = MockDioException();
        const SocketException socketException = SocketException(
          'Network error',
        );

        when(() => mockRequestOptions.uri).thenReturn(FakeUri());
        when(() => mockRequestOptions.method).thenReturn('GET');
        when(() => mockDioException.type).thenReturn(DioExceptionType.unknown);
        when(
          () => mockDioException.requestOptions,
        ).thenReturn(mockRequestOptions);
        when(() => mockDioException.response).thenReturn(null);
        when(() => mockDioException.error).thenReturn(socketException);

        // Act
        final NetworkException result = sut.handle(mockDioException);

        // Assert
        expect(result.message, contains('internet'));
      });

      test(
        'should handle unknown without SocketException as unknown error',
        () {
          // Arrange
          final MockRequestOptions mockRequestOptions = MockRequestOptions();
          final MockDioException mockDioException = MockDioException();

          when(() => mockRequestOptions.uri).thenReturn(FakeUri());
          when(() => mockRequestOptions.method).thenReturn('GET');
          when(
            () => mockDioException.type,
          ).thenReturn(DioExceptionType.unknown);
          when(
            () => mockDioException.requestOptions,
          ).thenReturn(mockRequestOptions);
          when(() => mockDioException.response).thenReturn(null);
          when(() => mockDioException.error).thenReturn('Some error');

          // Act
          final NetworkException result = sut.handle(mockDioException);

          // Assert
          expect(result.message, contains('wrong'));
        },
      );
    });

    group('handle - HTTP status codes', () {
      test('should handle 401 unauthorized', () {
        // Arrange
        final MockRequestOptions mockRequestOptions = MockRequestOptions();
        final MockResponse mockResponse = MockResponse();
        final MockDioException mockDioException = MockDioException();

        when(() => mockRequestOptions.uri).thenReturn(FakeUri());
        when(() => mockRequestOptions.method).thenReturn('GET');
        when(() => mockResponse.statusCode).thenReturn(401);
        when(() => mockResponse.requestOptions).thenReturn(mockRequestOptions);
        when(() => mockResponse.data).thenReturn(null);
        when(
          () => mockDioException.type,
        ).thenReturn(DioExceptionType.badResponse);
        when(
          () => mockDioException.requestOptions,
        ).thenReturn(mockRequestOptions);
        when(() => mockDioException.response).thenReturn(mockResponse);

        // Act
        final NetworkException result = sut.handle(mockDioException);

        // Assert
        expect(result.statusCode, 401);
        expect(result.message, contains('Unauthorized'));
      });

      test('should handle 403 forbidden', () {
        // Arrange
        final MockRequestOptions mockRequestOptions = MockRequestOptions();
        final MockResponse mockResponse = MockResponse();
        final MockDioException mockDioException = MockDioException();

        when(() => mockRequestOptions.uri).thenReturn(FakeUri());
        when(() => mockRequestOptions.method).thenReturn('GET');
        when(() => mockResponse.statusCode).thenReturn(403);
        when(() => mockResponse.requestOptions).thenReturn(mockRequestOptions);
        when(() => mockResponse.data).thenReturn(null);
        when(
          () => mockDioException.type,
        ).thenReturn(DioExceptionType.badResponse);
        when(
          () => mockDioException.requestOptions,
        ).thenReturn(mockRequestOptions);
        when(() => mockDioException.response).thenReturn(mockResponse);

        // Act
        final NetworkException result = sut.handle(mockDioException);

        // Assert
        expect(result.statusCode, 403);
        expect(result.message, contains('Forbidden'));
      });

      test('should handle 404 not found', () {
        // Arrange
        final MockRequestOptions mockRequestOptions = MockRequestOptions();
        final MockResponse mockResponse = MockResponse();
        final MockDioException mockDioException = MockDioException();

        when(() => mockRequestOptions.uri).thenReturn(FakeUri());
        when(() => mockRequestOptions.method).thenReturn('GET');
        when(() => mockResponse.statusCode).thenReturn(404);
        when(() => mockResponse.requestOptions).thenReturn(mockRequestOptions);
        when(() => mockResponse.data).thenReturn(null);
        when(
          () => mockDioException.type,
        ).thenReturn(DioExceptionType.badResponse);
        when(
          () => mockDioException.requestOptions,
        ).thenReturn(mockRequestOptions);
        when(() => mockDioException.response).thenReturn(mockResponse);

        // Act
        final NetworkException result = sut.handle(mockDioException);

        // Assert
        expect(result.statusCode, 404);
        expect(result.message, contains('not found'));
      });

      test('should handle 500 internal server error', () {
        // Arrange
        final MockRequestOptions mockRequestOptions = MockRequestOptions();
        final MockResponse mockResponse = MockResponse();
        final MockDioException mockDioException = MockDioException();

        when(() => mockRequestOptions.uri).thenReturn(FakeUri());
        when(() => mockRequestOptions.method).thenReturn('GET');
        when(() => mockResponse.statusCode).thenReturn(500);
        when(() => mockResponse.requestOptions).thenReturn(mockRequestOptions);
        when(() => mockResponse.data).thenReturn(null);
        when(
          () => mockDioException.type,
        ).thenReturn(DioExceptionType.badResponse);
        when(
          () => mockDioException.requestOptions,
        ).thenReturn(mockRequestOptions);
        when(() => mockDioException.response).thenReturn(mockResponse);

        // Act
        final NetworkException result = sut.handle(mockDioException);

        // Assert
        expect(result.statusCode, 500);
        expect(result.message, contains('server'));
      });

      test('should preserve actual status code for 502, 503, 504', () {
        // Arrange
        final MockRequestOptions mockRequestOptions = MockRequestOptions();
        final MockResponse mockResponse = MockResponse();
        final MockDioException mockDioException = MockDioException();

        when(() => mockRequestOptions.uri).thenReturn(FakeUri());
        when(() => mockRequestOptions.method).thenReturn('GET');
        when(() => mockResponse.statusCode).thenReturn(503);
        when(() => mockResponse.requestOptions).thenReturn(mockRequestOptions);
        when(() => mockResponse.data).thenReturn(null);
        when(
          () => mockDioException.type,
        ).thenReturn(DioExceptionType.badResponse);
        when(
          () => mockDioException.requestOptions,
        ).thenReturn(mockRequestOptions);
        when(() => mockDioException.response).thenReturn(mockResponse);

        // Act
        final NetworkException result = sut.handle(mockDioException);

        // Assert
        expect(
          result.statusCode,
          503,
        ); // Should preserve 503, not change to 500
        expect(result.message, contains('server'));
      });

      test('should extract custom message from response data', () {
        // Arrange
        final MockRequestOptions mockRequestOptions = MockRequestOptions();
        final MockResponse mockResponse = MockResponse();
        final MockDioException mockDioException = MockDioException();
        final Map<String, String> responseData = <String, String>{
          'message': 'Custom error from server',
        };

        when(() => mockRequestOptions.uri).thenReturn(FakeUri());
        when(() => mockRequestOptions.method).thenReturn('GET');
        when(() => mockResponse.statusCode).thenReturn(400);
        when(() => mockResponse.requestOptions).thenReturn(mockRequestOptions);
        when(() => mockResponse.data).thenReturn(responseData);
        when(
          () => mockDioException.type,
        ).thenReturn(DioExceptionType.badResponse);
        when(
          () => mockDioException.requestOptions,
        ).thenReturn(mockRequestOptions);
        when(() => mockDioException.response).thenReturn(mockResponse);

        // Act
        final NetworkException result = sut.handle(mockDioException);

        // Assert
        expect(result.statusCode, 400);
        expect(result.message, 'Custom error from server');
        expect(result.responseData, responseData);
      });
    });

    group('handle - non-DioException', () {
      test('should handle non-DioException as unknown error', () {
        // Arrange
        final Exception error = Exception('Random error');
        final StackTrace stackTrace = StackTrace.current;

        // Act
        final NetworkException result = sut.handle(error, stackTrace);

        // Assert
        expect(result.message, contains('wrong'));
        expect(result.error, error);
        expect(result.stackTrace, stackTrace);
        expect(result.statusCode, isNull);
        expect(result.requestUrl, isNull);
      });
    });

    group('handle - fields population', () {
      test('should populate all NetworkException fields correctly', () {
        // Arrange
        final MockRequestOptions mockRequestOptions = MockRequestOptions();
        final MockResponse mockResponse = MockResponse();
        final MockDioException mockDioException = MockDioException();
        final StackTrace stackTrace = StackTrace.current;
        final Map<String, String> responseData = <String, String>{
          'error': 'details',
        };

        when(() => mockRequestOptions.uri).thenReturn(FakeUri());
        when(() => mockRequestOptions.method).thenReturn('POST');
        when(() => mockResponse.statusCode).thenReturn(401);
        when(() => mockResponse.requestOptions).thenReturn(mockRequestOptions);
        when(() => mockResponse.data).thenReturn(responseData);
        when(
          () => mockDioException.type,
        ).thenReturn(DioExceptionType.badResponse);
        when(
          () => mockDioException.requestOptions,
        ).thenReturn(mockRequestOptions);
        when(() => mockDioException.response).thenReturn(mockResponse);

        // Act
        final NetworkException result = sut.handle(
          mockDioException,
          stackTrace,
        );

        // Assert
        expect(result.message, isNotEmpty);
        expect(result.statusCode, 401);
        expect(result.error, mockDioException);
        expect(result.stackTrace, stackTrace);
        expect(result.requestUrl, 'https://api.example.com/test');
        expect(result.requestMethod, 'POST');
        expect(result.responseData, responseData);
        expect(result.timestamp, isNotNull);
      });
    });
  });
}
