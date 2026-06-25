part of 'shared_preferences.dart';

class HorizonSharedPreferencesImpl implements HorizonSharedPreferences {
  const HorizonSharedPreferencesImpl(this._prefs);

  final SharedPreferencesAsync _prefs;

  @override
  Future<void> clearTokens() async {
    await _prefs.clear();
  }

  // Fingerprint Data
  @override
  Future<String?> getFingerprintData() {
    return _prefs.getString(HorizonSharedPreferencesKeys.fingerprintData);
  }

  @override
  Future<void> saveFingerprintData(String data) {
    return _prefs.setString(HorizonSharedPreferencesKeys.fingerprintData, data);
  }

  // First Run
  @override
  Future<bool?> getFirstRun() {
    return _prefs.getBool(HorizonSharedPreferencesKeys.firstRun);
  }

  @override
  Future<void> saveFirstRun() {
    return _prefs.setBool(HorizonSharedPreferencesKeys.firstRun, true);
  }
}
