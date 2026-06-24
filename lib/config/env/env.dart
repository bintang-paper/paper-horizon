import 'package:paper_horizon/config/env/prod_env.dart';
import 'package:paper_horizon/config/env/stag_env.dart';

enum EnvFlavor {
  stag,
  prod;

  bool get isStaging => this == EnvFlavor.stag;
  bool get isProduction => this == EnvFlavor.prod;
}

abstract interface class Environment {
  EnvFlavor get flavor;
  String get baseApiUrl;
  String get baseApiUrlV2;
}

final class EnvironmentImpl implements Environment {
  const EnvironmentImpl({
    required this.flavor,
    required this.baseApiUrl,
    required this.baseApiUrlV2,
  });

  @override
  final EnvFlavor flavor;

  @override
  final String baseApiUrl;

  @override
  final String baseApiUrlV2;
}

final class EnvFactory {
  const EnvFactory._();

  static Environment create(EnvFlavor flavor) {
    switch (flavor) {
      case EnvFlavor.stag:
        return const EnvironmentImpl(
          flavor: EnvFlavor.stag,
          baseApiUrl: StagEnv.baseApiUrl,
          baseApiUrlV2: StagEnv.baseApiUrlV2,
        );

      case EnvFlavor.prod:
        return const EnvironmentImpl(
          flavor: EnvFlavor.prod,
          baseApiUrl: ProdEnv.baseApiUrl,
          baseApiUrlV2: ProdEnv.baseApiUrlV2,
        );
    }
  }
}
