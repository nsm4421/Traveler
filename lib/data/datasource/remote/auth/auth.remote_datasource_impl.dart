import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:module/data/model/export.dart';
import 'package:module/shared/shared.export.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'auth.remote_datasource.dart';

class RemoteAuthDataSourceImpl implements RemoteAuthDataSource {
  final GoTrueClient _auth;
  final Dio _dio;
  final Logger _logger;

  RemoteAuthDataSourceImpl(
      {required GoTrueClient auth, required Dio dio, required Logger logger})
      : _auth = auth,
        _dio = dio,
        _logger = logger;

  @override
  UserModel get currentUser => UserModel.from(_auth.currentUser!);

  @override
  String get currentUid => currentUser.id;

  @override
  Stream<UserModel?> get authStream =>
      _auth.onAuthStateChange.asyncMap((data) async {
        try {
          switch (data.event) {
            case AuthChangeEvent.initialSession:
            case AuthChangeEvent.passwordRecovery:
            case AuthChangeEvent.tokenRefreshed:
            case AuthChangeEvent.userUpdated:
            case AuthChangeEvent.mfaChallengeVerified:
            case AuthChangeEvent.signedIn:
              final user = data.session?.user;
              if (user == null) {
                throw Exception('auth stream error-no user');
              }
              _logger.d([LogTags.dataSource, 'auth state:${data.event.name}']);
              return UserModel.from(user);
            case AuthChangeEvent.signedOut:
              _logger.d([LogTags.dataSource, 'sign out']);
              return null;
            default:
              throw Exception('auth stream error-unknown error');
          }
        } catch (error) {
          _logger.e([LogTags.dataSource, error]);
          return null;
        }
      });

  @override
  Future<void> signIn({required String email, required String password}) async {
    _logger.t([LogTags.dataSource, "sign in email:$email"]);
    await _auth
        .signInWithPassword(email: email, password: password)
        .then((res) => res.session?.accessToken)
        .then((accessToken) {
      // 로그인 성공 시 dio 클라이언트에 인증정보 추가
      _dio.options.headers = {
        'Authorization': 'Bearer $accessToken',
        'apikey': Env.supabaseKey
      };
    });
  }

  @override
  Future<void> signOut() async {
    _logger.t([LogTags.dataSource, "sign out"]);
    await _auth.signOut(scope: SignOutScope.global).then((_) {
      _dio.options.headers = {};
    });
  }

  @override
  Future<void> signUp(SignUpRequestModel model) async {
    _logger.t([LogTags.dataSource, "sign up email:${model.email}"]);
    return await _auth
        .signUp(
            email: model.email,
            password: model.password,
            data: model.data.toJson())
        .then((res) => res.session?.accessToken)
        .then((accessToken) {
      if (accessToken != null) {
        // 회원가입 성공 시 dio 클라이언트에 인증정보 추가
        _dio.options.headers = {
          'Authorization': 'Bearer $accessToken',
          'apikey': Env.supabaseKey,
        };
      }
    });
  }

  @override
  Future<UserMetaData?> editUserMetaData(EditProfileModel model) async {
    return await _auth
        .updateUser(UserAttributes(data: {
          ...(_auth.currentUser?.userMetadata ?? {}),
          ...Map.fromEntries(
            model.toJson().entries.where((e) => e.value != null),
          )
        }))
        .then((res) => res.user?.userMetadata)
        .then((json) => json == null ? null : UserMetaData.fromJson(json));
  }
}
