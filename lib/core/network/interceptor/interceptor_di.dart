import 'package:paper_horizon/core/di/di.dart';
import 'package:paper_horizon/core/network/interceptor/auth_interceptor.dart';
import 'package:paper_horizon/core/storage/secure_storage/secure_storage.dart';

Future<void> setUpInterceptorDI() async {
  /// Auth Interceptor
  getIt.registerLazySingleton<AuthInterceptor>(
    () => AuthInterceptor(getIt<HorizonSecureStorage>()),
  );
}
