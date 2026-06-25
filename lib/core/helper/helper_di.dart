import 'package:paper_horizon/core/di/di.dart';
import 'package:paper_horizon/core/helper/app_info_helper.dart';
import 'package:paper_horizon/core/helper/ip_helper.dart';
import 'package:paper_horizon/core/network/network_client.dart';

Future<void> setupHelperDI() async {
  getIt
    /// App Info Helper
    ..registerSingleton<AppInfoHelper>(AppInfoHelper())
    /// IP Helper
    ..registerLazySingleton<IpHelper>(
      () => IpHelper(getIt<HorizonDioClient>()),
    );
}
