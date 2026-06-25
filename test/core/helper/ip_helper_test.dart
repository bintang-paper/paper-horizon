import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:paper_horizon/core/helper/ip_helper.dart';
import 'package:paper_horizon/core/network/network_exception.dart';

import '../../mocks/core/network/mock_dio.dart';
import '../../mocks/core/network/mock_horizon_network_client.dart';

void main() {
  late IpHelper sut;
  late MockHorizonNetworkClient mockClient;

  setUpAll(() {
    registerFallbackValue(FakeRequestOptions());
  });

  setUp(() {
    mockClient = MockHorizonNetworkClient();
    sut = IpHelper(mockClient);
  });

  group('IpHelper', () {
    group('getPublicIP', () {
      test('should return IP address when request is successful', () async {
        // Arrange
        final Response<Map<String, dynamic>> mockResponse =
            Response<Map<String, dynamic>>(
              data: <String, dynamic>{'ip': '192.168.1.100'},
              statusCode: 200,
              requestOptions: RequestOptions(),
            );

        when(
          () => mockClient.get<Map<String, dynamic>>(
            any(),
            queryParameters: any(named: 'queryParameters'),
          ),
        ).thenAnswer((_) async => mockResponse);

        // Act
        final String result = await sut.getPublicIP();

        // Assert
        expect(result, '192.168.1.100');
        verify(
          () => mockClient.get<Map<String, dynamic>>(
            'https://api.ipify.org',
            queryParameters: <String, dynamic>{'format': 'json'},
          ),
        ).called(1);
      });

      test(
        'should return empty string when IP is null or missing from response',
        () async {
          // Arrange
          final Response<Map<String, dynamic>> mockResponse =
              Response<Map<String, dynamic>>(
                data: <String, dynamic>{'address': '192.168.1.100'},
                statusCode: 200,
                requestOptions: RequestOptions(),
              );

          when(
            () => mockClient.get<Map<String, dynamic>>(
              any(),
              queryParameters: any(named: 'queryParameters'),
            ),
          ).thenAnswer((_) async => mockResponse);

          // Act
          final String result = await sut.getPublicIP();

          // Assert
          expect(result, '');
        },
      );

      test('should return empty string when response data is null', () async {
        // Arrange
        final Response<Map<String, dynamic>> mockResponse =
            Response<Map<String, dynamic>>(
              statusCode: 200,
              requestOptions: RequestOptions(),
            );

        when(
          () => mockClient.get<Map<String, dynamic>>(
            any(),
            queryParameters: any(named: 'queryParameters'),
          ),
        ).thenAnswer((_) async => mockResponse);

        // Act
        final String result = await sut.getPublicIP();

        // Assert
        expect(result, '');
      });

      test('should throw NetworkException when network error occurs', () async {
        // Arrange
        final NetworkException networkException = NetworkException(
          message: 'No internet connection',
          timestamp: DateTime.now(),
        );

        when(
          () => mockClient.get<Map<String, dynamic>>(
            any(),
            queryParameters: any(named: 'queryParameters'),
          ),
        ).thenThrow(networkException);

        // Act & Assert
        expect(() => sut.getPublicIP(), throwsA(isA<NetworkException>()));
      });
    });
  });
}
