import 'package:dio/dio.dart';
import 'package:paper_horizon/core/network/network_client.dart';

class IpHelper {
  const IpHelper(this._client);

  final HorizonDioClient _client;

  /// Gets the public IP address from ipify.org API
  Future<String> getPublicIP() async {
    final Response<Map<String, dynamic>> response = await _client
        .get<Map<String, dynamic>>(
          'https://api.ipify.org',
          queryParameters: <String, dynamic>{'format': 'json'},
        );

    return response.data?['ip'] as String? ?? '';
  }
}
