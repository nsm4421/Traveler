import 'package:envied/envied.dart';

part 'env.g.dart';

/// 환경변수 주입
@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'MODE', defaultValue: 'development')
  static const String mode = _Env.mode;

  @EnviedField(varName: 'SUPABASE_API_URL')
  static const String supabaseApiUrl = _Env.supabaseApiUrl;

  @EnviedField(varName: 'SUPABASE_ANON_KEY')
  static const String supabaseAnonKey = _Env.supabaseAnonKey;
}
