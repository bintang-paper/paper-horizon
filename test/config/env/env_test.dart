import 'package:flutter_test/flutter_test.dart';
import 'package:paper_horizon/config/env/env.dart';
import 'package:paper_horizon/config/env/prod_env.dart';
import 'package:paper_horizon/config/env/stag_env.dart';

void main() {
  group('EnvFlavor', () {
    test('isStaging should return true for stag and false for prod', () {
      expect(EnvFlavor.stag.isStaging, true);
      expect(EnvFlavor.prod.isStaging, false);
    });

    test('isProduction should return true for prod and false for stag', () {
      expect(EnvFlavor.prod.isProduction, true);
      expect(EnvFlavor.stag.isProduction, false);
    });
  });

  group('EnvFactory', () {
    group('create', () {
      test('should return staging environment when flavor is stag', () {
        // Arrange
        const EnvFlavor flavor = EnvFlavor.stag;

        // Act
        final Environment result = EnvFactory.create(flavor);

        // Assert
        expect(result, isA<Environment>());
        expect(result.flavor, EnvFlavor.stag);
        expect(result.baseApiUrl, StagEnv.baseApiUrl);
        expect(result.baseApiUrlV2, StagEnv.baseApiUrlV2);
      });

      test('should return production environment when flavor is prod', () {
        // Arrange
        const EnvFlavor flavor = EnvFlavor.prod;

        // Act
        final Environment result = EnvFactory.create(flavor);

        // Assert
        expect(result, isA<Environment>());
        expect(result.flavor, EnvFlavor.prod);
        expect(result.baseApiUrl, ProdEnv.baseApiUrl);
        expect(result.baseApiUrlV2, ProdEnv.baseApiUrlV2);
      });
    });
  });
}
