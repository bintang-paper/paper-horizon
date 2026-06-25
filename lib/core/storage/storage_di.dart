import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:paper_horizon/core/di/di.dart';
import 'package:paper_horizon/core/storage/secure_storage/secure_storage.dart';

Future<void> setUpStorageDI() async {
  getIt
    /// Secure Storage
    ..registerLazySingleton<FlutterSecureStorage>(FlutterSecureStorage.new)
    ..registerLazySingleton<HorizonSecureStorage>(
      () => HorizonSecureStorageImpl(getIt<FlutterSecureStorage>()),
    );
}
