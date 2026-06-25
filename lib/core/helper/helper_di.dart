import 'package:paper_horizon/core/di/di.dart';
import 'package:paper_horizon/core/helper/app_info_helper.dart';

Future<void> setupHelperDI() async {
  /// App Info Helper
  getIt.registerSingleton<AppInfoHelper>(AppInfoHelper());
}
