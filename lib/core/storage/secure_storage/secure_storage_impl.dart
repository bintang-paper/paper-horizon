part of 'secure_storage.dart';

class HorizonSecureStorageImpl implements HorizonSecureStorage {
  const HorizonSecureStorageImpl(this._storage);

  final FlutterSecureStorage _storage;

  @override
  Future<void> clearStorage() async {
    await _storage.deleteAll();
  }

  // Access Token
  @override
  Future<String?> getAccessToken() {
    return _storage.read(key: HorizonSecureStorageKeys.accessToken);
  }

  @override
  Future<void> saveAccessToken(String token) {
    return _storage.write(
      key: HorizonSecureStorageKeys.accessToken,
      value: token,
    );
  }

  // Refresh Token
  @override
  Future<String?> getRefreshToken() {
    return _storage.read(key: HorizonSecureStorageKeys.refreshToken);
  }

  @override
  Future<void> saveRefreshToken(String token) {
    return _storage.write(
      key: HorizonSecureStorageKeys.refreshToken,
      value: token,
    );
  }
}
