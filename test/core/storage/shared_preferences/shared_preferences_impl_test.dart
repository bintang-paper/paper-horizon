import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:paper_horizon/core/storage/shared_preferences/shared_preferences.dart';

import '../../../mocks/core/storage/shared_preferences/mock_shared_preferences_async.dart';

void main() {
  late MockSharedPreferencesAsync mockPrefs;
  late HorizonSharedPreferencesImpl sut;

  setUp(() {
    mockPrefs = MockSharedPreferencesAsync();
    sut = HorizonSharedPreferencesImpl(mockPrefs);
  });

  group('HorizonSharedPreferencesImpl', () {
    group('clearTokens', () {
      test('should call clear on SharedPreferencesAsync', () async {
        // Arrange
        when(() => mockPrefs.clear()).thenAnswer((_) async {});

        // Act
        await sut.clearTokens();

        // Assert
        verify(() => mockPrefs.clear()).called(1);
      });
    });

    group('getFingerprintData', () {
      test('should return data when exists', () async {
        // Arrange
        const String data = 'test_fingerprint_data';
        when(
          () =>
              mockPrefs.getString(HorizonSharedPreferencesKeys.fingerprintData),
        ).thenAnswer((_) async => data);

        // Act
        final String? result = await sut.getFingerprintData();

        // Assert
        expect(result, data);
        verify(
          () =>
              mockPrefs.getString(HorizonSharedPreferencesKeys.fingerprintData),
        ).called(1);
      });

      test('should return null when data does not exist', () async {
        // Arrange
        when(
          () =>
              mockPrefs.getString(HorizonSharedPreferencesKeys.fingerprintData),
        ).thenAnswer((_) async => null);

        // Act
        final String? result = await sut.getFingerprintData();

        // Assert
        expect(result, isNull);
      });
    });

    group('saveFingerprintData', () {
      test('should save data with correct key', () async {
        // Arrange
        const String data = 'new_fingerprint_data';
        when(
          () => mockPrefs.setString(
            HorizonSharedPreferencesKeys.fingerprintData,
            data,
          ),
        ).thenAnswer((_) async {});

        // Act
        await sut.saveFingerprintData(data);

        // Assert
        verify(
          () => mockPrefs.setString(
            HorizonSharedPreferencesKeys.fingerprintData,
            data,
          ),
        ).called(1);
      });
    });

    group('getFirstRun', () {
      test('should return true when first run is set', () async {
        // Arrange
        when(
          () => mockPrefs.getBool(HorizonSharedPreferencesKeys.firstRun),
        ).thenAnswer((_) async => true);

        // Act
        final bool? result = await sut.getFirstRun();

        // Assert
        expect(result, isTrue);
        verify(
          () => mockPrefs.getBool(HorizonSharedPreferencesKeys.firstRun),
        ).called(1);
      });

      test('should return null when first run is not set', () async {
        // Arrange
        when(
          () => mockPrefs.getBool(HorizonSharedPreferencesKeys.firstRun),
        ).thenAnswer((_) async => null);

        // Act
        final bool? result = await sut.getFirstRun();

        // Assert
        expect(result, isNull);
      });
    });

    group('saveFirstRun', () {
      test('should save first run as true with correct key', () async {
        // Arrange
        when(
          () => mockPrefs.setBool(HorizonSharedPreferencesKeys.firstRun, true),
        ).thenAnswer((_) async {});

        // Act
        await sut.saveFirstRun();

        // Assert
        verify(
          () => mockPrefs.setBool(HorizonSharedPreferencesKeys.firstRun, true),
        ).called(1);
      });
    });
  });
}
