import 'package:flutter_secure_storage/flutter_secure_storage.dart';

part 'secure_storage_impl.dart';
part 'secure_storage_keys.dart';

abstract interface class HorizonSecureStorage {
  Future<void> clearStorage();

  // Access Token
  Future<String?> getAccessToken();

  Future<void> saveAccessToken(String token);

  // Refresh Token
  Future<String?> getRefreshToken();

  Future<void> saveRefreshToken(String token);
}
