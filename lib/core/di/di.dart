import 'package:get_it/get_it.dart';
import 'package:paper_horizon/config/env/env.dart';

GetIt getIt = GetIt.I;

Future<void> setUpDI(EnvFlavor flavor) async {
  /// Environments
  final Environment environment = EnvFactory.create(flavor);
  getIt.registerSingleton<Environment>(environment);
}
