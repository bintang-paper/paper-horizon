class NetworkException implements Exception {
  const NetworkException({
    required this.message,
    this.statusCode,
    this.error,
    this.stackTrace,
    this.requestUrl,
    this.requestMethod,
    this.responseData,
    this.timestamp,
  });

  /// User-friendly error message (localized)
  final String message;

  /// HTTP status code (401, 404, 500, etc.)
  final int? statusCode;

  /// Original error object (DioException, SocketException, etc.)
  final Object? error;

  /// Stack trace for debugging
  final StackTrace? stackTrace;

  /// Request URL that failed
  final String? requestUrl;

  /// HTTP method (GET, POST, PUT, etc.)
  final String? requestMethod;

  /// Raw response data for debugging
  final dynamic responseData;

  /// When the error occurred
  final DateTime? timestamp;
}
