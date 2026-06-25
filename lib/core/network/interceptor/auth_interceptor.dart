import 'package:dio/dio.dart';
import 'package:paper_horizon/core/storage/secure_storage/secure_storage.dart';

class AuthInterceptor extends Interceptor {
  const AuthInterceptor(this._secureStorage);

  final HorizonSecureStorage _secureStorage;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final String? accessToken = await _secureStorage.getAccessToken();

    if (accessToken != null && accessToken.isNotEmpty) {
      options.headers['Authorization'] = accessToken;
    }

    handler.next(options);
  }
}
