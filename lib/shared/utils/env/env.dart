import 'package:envied/envied.dart';

part 'env.g.dart';

/// 환경변수 주입
@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'SUPABASE_URL')
  static const String supabaseUrl = _Env.supabaseUrl;

  @EnviedField(varName: 'SUPABASE_KEY')
  static const String supabaseKey = _Env.supabaseKey;
}
