import 'dart:io';

import 'package:dio/dio.dart';
import 'package:paper_horizon/core/network/network_exception.dart';
import 'package:paper_horizon/i18n/strings.g.dart';

class NetworkErrorHandler {
  const NetworkErrorHandler();

  NetworkException handle(Object error, [StackTrace? stackTrace]) {
    final Translations t = LocaleSettings.instance.currentTranslations;
    final DateTime timestamp = DateTime.now();

    if (error is DioException) {
      final String requestUrl = error.requestOptions.uri.toString();
      final String requestMethod = error.requestOptions.method;
      final dynamic responseData = error.response?.data;

      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          return NetworkException(
            message: t.errors.network.connection_timeout,
            error: error,
            stackTrace: stackTrace,
            requestUrl: requestUrl,
            requestMethod: requestMethod,
            responseData: responseData,
            timestamp: timestamp,
          );

        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          return NetworkException(
            message: t.errors.network.receive_timeout,
            error: error,
            stackTrace: stackTrace,
            requestUrl: requestUrl,
            requestMethod: requestMethod,
            responseData: responseData,
            timestamp: timestamp,
          );

        case DioExceptionType.cancel:
          return NetworkException(
            message: t.errors.network.request_cancelled,
            error: error,
            stackTrace: stackTrace,
            requestUrl: requestUrl,
            requestMethod: requestMethod,
            responseData: responseData,
            timestamp: timestamp,
          );

        case DioExceptionType.connectionError:
          return NetworkException(
            message: t.errors.network.no_internet_connection,
            error: error,
            stackTrace: stackTrace,
            requestUrl: requestUrl,
            requestMethod: requestMethod,
            responseData: responseData,
            timestamp: timestamp,
          );

        case DioExceptionType.badResponse:
          return _handleResponse(
            error.response,
            error: error,
            stackTrace: stackTrace,
            requestUrl: requestUrl,
            requestMethod: requestMethod,
            responseData: responseData,
            timestamp: timestamp,
          );

        case DioExceptionType.badCertificate:
        case DioExceptionType.unknown:
          if (error.error is SocketException) {
            return NetworkException(
              message: t.errors.network.no_internet_connection,
              error: error,
              stackTrace: stackTrace,
              requestUrl: requestUrl,
              requestMethod: requestMethod,
              responseData: responseData,
              timestamp: timestamp,
            );
          }

          return NetworkException(
            message: t.errors.network.unknown_error,
            error: error,
            stackTrace: stackTrace,
            requestUrl: requestUrl,
            requestMethod: requestMethod,
            responseData: responseData,
            timestamp: timestamp,
          );
      }
    }

    return NetworkException(
      message: t.errors.network.unknown_error,
      error: error,
      stackTrace: stackTrace,
      timestamp: timestamp,
    );
  }

  NetworkException _handleResponse(
    Response<dynamic>? response, {
    required Object? error,
    required StackTrace? stackTrace,
    required String requestUrl,
    required String requestMethod,
    required dynamic responseData,
    required DateTime timestamp,
  }) {
    final Translations t = LocaleSettings.instance.currentTranslations;
    final int? statusCode = response?.statusCode;

    switch (statusCode) {
      case 401:
        return NetworkException(
          statusCode: 401,
          message: t.errors.network.unauthorized,
          error: error,
          stackTrace: stackTrace,
          requestUrl: requestUrl,
          requestMethod: requestMethod,
          responseData: responseData,
          timestamp: timestamp,
        );

      case 403:
        return NetworkException(
          statusCode: 403,
          message: t.errors.network.forbidden,
          error: error,
          stackTrace: stackTrace,
          requestUrl: requestUrl,
          requestMethod: requestMethod,
          responseData: responseData,
          timestamp: timestamp,
        );

      case 404:
        return NetworkException(
          statusCode: 404,
          message: t.errors.network.not_found,
          error: error,
          stackTrace: stackTrace,
          requestUrl: requestUrl,
          requestMethod: requestMethod,
          responseData: responseData,
          timestamp: timestamp,
        );

      case 500:
      case 502:
      case 503:
      case 504:
        return NetworkException(
          statusCode: statusCode,
          message: t.errors.network.internal_server_error,
          error: error,
          stackTrace: stackTrace,
          requestUrl: requestUrl,
          requestMethod: requestMethod,
          responseData: responseData,
          timestamp: timestamp,
        );

      default:
        return NetworkException(
          statusCode: statusCode,
          message: _extractMessage(response) ?? t.errors.network.unknown_error,
          error: error,
          stackTrace: stackTrace,
          requestUrl: requestUrl,
          requestMethod: requestMethod,
          responseData: responseData,
          timestamp: timestamp,
        );
    }
  }

  String? _extractMessage(Response<dynamic>? response) {
    final dynamic data = response?.data;

    if (data is Map<String, dynamic>) {
      return data['message']?.toString();
    }

    return null;
  }
}
