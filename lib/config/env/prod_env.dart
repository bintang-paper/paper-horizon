import 'package:envied/envied.dart';

part 'prod_env.g.dart';

@Envied(path: 'lib/.env.prod', useConstantCase: true)
abstract class ProdEnv {
  @EnviedField()
  static const String baseApiUrl = _ProdEnv.baseApiUrl;

  @EnviedField()
  static const String baseApiUrlV2 = _ProdEnv.baseApiUrlV2;
}
