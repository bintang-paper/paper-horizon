import 'package:envied/envied.dart';

part 'stag_env.g.dart';

@Envied(path: 'lib/.env.stag', useConstantCase: true)
abstract class StagEnv {
  @EnviedField()
  static const String baseApiUrl = _StagEnv.baseApiUrl;

  @EnviedField()
  static const String baseApiUrlV2 = _StagEnv.baseApiUrlV2;
}
