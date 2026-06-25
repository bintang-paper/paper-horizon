import 'package:package_info_plus/package_info_plus.dart';

class AppInfoHelper {
  PackageInfo? _packageInfo;

  // Ensure package info is loaded
  Future<void> _ensureInitialized() async {
    _packageInfo ??= await PackageInfo.fromPlatform();
  }

  // Get app version (e.g., "1.0.0")
  Future<String> get version async {
    await _ensureInitialized();
    return _packageInfo?.version ?? '';
  }

  // Get formatted version (e.g., "Version 1.0.0")
  Future<String> get versionFormatted async {
    final String ver = await version;
    return 'Version $ver';
  }

  // Get build number (e.g., "1")
  Future<String> get buildNumber async {
    await _ensureInitialized();
    return _packageInfo?.buildNumber ?? '';
  }

  // Get app name
  Future<String> get appName async {
    await _ensureInitialized();
    return _packageInfo?.appName ?? '';
  }

  // Get package name (e.g., "id.paper_horizon")
  Future<String> get packageName async {
    await _ensureInitialized();
    return _packageInfo?.packageName ?? '';
  }

  // Get installer store (e.g., "com.android.vending" for Play Store)
  Future<String> get installerStore async {
    await _ensureInitialized();
    return _packageInfo?.installerStore ?? '';
  }
}
