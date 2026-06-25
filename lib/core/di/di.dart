import 'package:get_it/get_it.dart';
import 'package:paper_horizon/config/env/env.dart';
import 'package:paper_horizon/core/helper/helper_di.dart';
import 'package:paper_horizon/core/network/network_di.dart';
import 'package:paper_horizon/core/storage/storage_di.dart';

GetIt getIt = GetIt.I;

Future<void> setUpDI(EnvFlavor flavor) async {
  /// Environments
  final Environment environment = EnvFactory.create(flavor);
  getIt.registerSingleton<Environment>(environment);

  /// Storage
  await setUpStorageDI();

  /// Network
  await setUpNetworkDI();

  /// Helpers
  await setupHelperDI();
}
