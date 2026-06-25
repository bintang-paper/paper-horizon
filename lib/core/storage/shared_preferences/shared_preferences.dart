import 'package:shared_preferences/shared_preferences.dart';

part 'shared_preferences_impl.dart';

part 'shared_preferences_keys.dart';

abstract interface class HorizonSharedPreferences {
  Future<void> clearTokens();

  // Fingerprint Data
  Future<String?> getFingerprintData();

  Future<void> saveFingerprintData(String data);

  // First Run
  Future<bool?> getFirstRun();

  Future<void> saveFirstRun();
}
