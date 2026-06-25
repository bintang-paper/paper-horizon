import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:paper_horizon/core/storage/secure_storage/secure_storage.dart';

import '../../../mocks/core/storage/secure_storage/mock_flutter_secure_storage.dart';

void main() {
  late MockFlutterSecureStorage mockStorage;
  late HorizonSecureStorageImpl sut;

  setUp(() {
    mockStorage = MockFlutterSecureStorage();
    sut = HorizonSecureStorageImpl(mockStorage);
  });

  group('HorizonSecureStorageImpl', () {
    group('clearStorage', () {
      test('should call deleteAll on storage', () async {
        // Arrange
        when(() => mockStorage.deleteAll()).thenAnswer((_) async {});

        // Act
        await sut.clearStorage();

        // Assert
        verify(() => mockStorage.deleteAll()).called(1);
      });
    });

    group('getAccessToken', () {
      test('should return token when exists', () async {
        // Arrange
        const String token = 'test_access_token';
        when(
          () => mockStorage.read(key: HorizonSecureStorageKeys.accessToken),
        ).thenAnswer((_) async => token);

        // Act
        final String? result = await sut.getAccessToken();

        // Assert
        expect(result, token);
        verify(
          () => mockStorage.read(key: HorizonSecureStorageKeys.accessToken),
        ).called(1);
      });

      test('should return null when token does not exist', () async {
        // Arrange
        when(
          () => mockStorage.read(key: HorizonSecureStorageKeys.accessToken),
        ).thenAnswer((_) async => null);

        // Act
        final String? result = await sut.getAccessToken();

        // Assert
        expect(result, isNull);
      });
    });

    group('saveAccessToken', () {
      test('should save token with correct key', () async {
        // Arrange
        const String token = 'new_access_token';
        when(
          () => mockStorage.write(
            key: HorizonSecureStorageKeys.accessToken,
            value: token,
          ),
        ).thenAnswer((_) async {});

        // Act
        await sut.saveAccessToken(token);

        // Assert
        verify(
          () => mockStorage.write(
            key: HorizonSecureStorageKeys.accessToken,
            value: token,
          ),
        ).called(1);
      });
    });

    group('getRefreshToken', () {
      test('should return token when exists', () async {
        // Arrange
        const String token = 'test_refresh_token';
        when(
          () => mockStorage.read(key: HorizonSecureStorageKeys.refreshToken),
        ).thenAnswer((_) async => token);

        // Act
        final String? result = await sut.getRefreshToken();

        // Assert
        expect(result, token);
        verify(
          () => mockStorage.read(key: HorizonSecureStorageKeys.refreshToken),
        ).called(1);
      });

      test('should return null when token does not exist', () async {
        // Arrange
        when(
          () => mockStorage.read(key: HorizonSecureStorageKeys.refreshToken),
        ).thenAnswer((_) async => null);

        // Act
        final String? result = await sut.getRefreshToken();

        // Assert
        expect(result, isNull);
      });
    });

    group('saveRefreshToken', () {
      test('should save token with correct key', () async {
        // Arrange
        const String token = 'new_refresh_token';
        when(
          () => mockStorage.write(
            key: HorizonSecureStorageKeys.refreshToken,
            value: token,
          ),
        ).thenAnswer((_) async {});

        // Act
        await sut.saveRefreshToken(token);

        // Assert
        verify(
          () => mockStorage.write(
            key: HorizonSecureStorageKeys.refreshToken,
            value: token,
          ),
        ).called(1);
      });
    });
  });
}
