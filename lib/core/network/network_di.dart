import 'package:dio/dio.dart';
import 'package:paper_horizon/config/env/env.dart';
import 'package:paper_horizon/core/di/di.dart';
import 'package:paper_horizon/core/network/interceptor/auth_interceptor.dart';
import 'package:paper_horizon/core/network/interceptor/interceptor_di.dart';
import 'package:paper_horizon/core/network/network_client.dart';
import 'package:paper_horizon/core/network/network_error_handler.dart';

Future<void> setUpNetworkDI() async {
  final Environment environment = getIt<Environment>();

  /// Interceptor
  await setUpInterceptorDI();

  getIt
    /// Network Error Handler
    ..registerLazySingleton<NetworkErrorHandler>(NetworkErrorHandler.new)
    /// Dio Client
    ..registerLazySingleton<Dio>(() {
      final Dio dio = Dio(
        BaseOptions(
          baseUrl: environment.baseApiUrl,
          connectTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
          sendTimeout: const Duration(seconds: 30),
          headers: <String, dynamic>{
            'Content-Type': 'application/json',
            // TODO(team): set 'x-paper-user-agent' header
            // 'x-paper-user-agent': '',
          },
        ),
      );

      // Add interceptors
      dio.interceptors.add(getIt<AuthInterceptor>());

      return dio;
    })
    /// Horizon Dio Client
    ..registerLazySingleton<HorizonDioClient>(
      () => HorizonDioClientImpl(getIt<Dio>(), getIt<NetworkErrorHandler>()),
    );
}
