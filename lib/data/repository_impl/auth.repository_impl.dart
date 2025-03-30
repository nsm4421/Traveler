import 'package:injectable/injectable.dart';
import 'package:module/data/datasource/export.dart';
import 'package:module/data/model/export.dart';
import 'package:module/domain/entity/export.dart';
import 'package:module/domain/repository/export.dart';
import 'package:module/shared/shared.export.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl with LoggerMixIn implements AuthRepository {
  final LocalStorageDataSource _localStorageDataSource;
  final RemoteAuthDataSource _remoteAuthDataSource;

  AuthRepositoryImpl(
      {required LocalStorageDataSource localStorageDataSource,
      required RemoteAuthDataSource remoteAuthDataSource})
      : _localStorageDataSource = localStorageDataSource,
        _remoteAuthDataSource = remoteAuthDataSource;

  @override
  Stream<UserEntity?> get authStream => _remoteAuthDataSource.authStream
      .map((u) => u == null ? null : UserEntity.from(u));

  @override
  String get currentUid => _remoteAuthDataSource.currentUid;

  @override
  UserEntity get currentUser =>
      UserEntity.from(_remoteAuthDataSource.currentUser);

  @override
  Future<void> signIn({required String email, required String password}) async {
    await _remoteAuthDataSource.signIn(email: email, password: password);
  }

  @override
  Future<void> signOut() async {
    await _remoteAuthDataSource.signOut();
  }

  @override
  Future<void> signUp(
      {required String email,
      required String username,
      required String description,
      required Sex sex,
      required DateTime bornAt,
      required String password}) async {
    return await _remoteAuthDataSource.signUp(SignUpRequestModel(
      email: email,
      password: password,
      data: SignUpRequestDataModel(
          username: username,
          description: description,
          sex: sex,
          born_at: bornAt),
    ));
  }
}
