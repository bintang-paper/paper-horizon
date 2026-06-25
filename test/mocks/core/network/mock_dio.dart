import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';

class MockDioException extends Mock implements DioException {}

class MockResponse extends Mock implements Response<dynamic> {}

class MockRequestOptions extends Mock implements RequestOptions {}

class FakeRequestOptions extends Fake implements RequestOptions {}
