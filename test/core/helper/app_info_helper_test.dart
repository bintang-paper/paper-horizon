import 'package:flutter_test/flutter_test.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:paper_horizon/core/helper/app_info_helper.dart';

void main() {
  late AppInfoHelper sut;

  TestWidgetsFlutterBinding.ensureInitialized();

  group('AppInfoHelper', () {
    // Constants for mock values
    const String kAppName = 'Paper Horizon';
    const String kPackageName = 'id.paper_horizon';
    const String kVersion = '1.0.0';
    const String kBuildNumber = '1';
    const String kInstallerStore = 'com.android.vending';

    void setMockPackageInfo({
      String appName = kAppName,
      String packageName = kPackageName,
      String version = kVersion,
      String buildNumber = kBuildNumber,
      String installerStore = kInstallerStore,
    }) {
      PackageInfo.setMockInitialValues(
        appName: appName,
        packageName: packageName,
        version: version,
        buildNumber: buildNumber,
        buildSignature: '',
        installerStore: installerStore,
      );
    }

    setUp(() {
      sut = AppInfoHelper();
      setMockPackageInfo();
    });

    test('should return all package info correctly', () async {
      // Act
      final String version = await sut.version;
      final String buildNumber = await sut.buildNumber;
      final String appName = await sut.appName;
      final String packageName = await sut.packageName;
      final String installerStore = await sut.installerStore;

      // Assert
      expect(version, kVersion);
      expect(buildNumber, kBuildNumber);
      expect(appName, kAppName);
      expect(packageName, kPackageName);
      expect(installerStore, kInstallerStore);
    });

    test('should return formatted version string', () async {
      // Act
      final String result = await sut.versionFormatted;

      // Assert
      expect(result, 'Version $kVersion');
    });
  });
}
