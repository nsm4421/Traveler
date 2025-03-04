import 'package:either_dart/src/either.dart';
import 'package:injectable/injectable.dart';
import 'package:module/data/datasource/export.dart';
import 'package:module/data/model/export.dart';
import 'package:module/domain/entity/export.dart';
import 'package:module/domain/repository/export.dart';
import 'package:module/shared/shared.export.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl with LoggerMixIn implements AuthRepository {
  final RemoteAuthDataSource _remoteAuthDataSource;

  AuthRepositoryImpl(this._remoteAuthDataSource);

  @override
  UserEntity get currentUser =>
      UserEntity.from(_remoteAuthDataSource.currentUser);

  @override
  String get currentUid => _remoteAuthDataSource.currentUid;

  @override
  Future<Either<ApiFailure, ApiSuccess<UserEntity>>> signIn(
      {required String email, required String password}) async {
    try {
      return await _remoteAuthDataSource
          .signIn(email: email, password: password)
          .then(UserEntity.from)
          .then((data) => ApiSuccess<UserEntity>(data: data))
          .then(Right.new);
    } catch (error) {
      logger.e([LogTags.repository.name, error]);
      return Left(ApiFailure());
    }
  }

  @override
  Future<Either<ApiFailure, ApiSuccess<void>>> signOut() async {
    try {
      return await _remoteAuthDataSource
          .signOut()
          .then((data) => ApiSuccess<void>())
          .then(Right.new);
    } catch (error) {
      logger.e([LogTags.repository.name, error]);
      return Left(ApiFailure());
    }
  }

  @override
  Future<Either<ApiFailure, ApiSuccess<void>>> signUp(
      {required String email,
      required String username,
      required String description,
      required Sex sex,
      required DateTime bornAt,
      required String password}) async {
    try {
      return await _remoteAuthDataSource
          .signUp(SignUpRequestModel(
              email: email,
              username: username,
              password: password,
              description: description,
              sex: sex,
              born_at: bornAt))
          .then((data) => ApiSuccess<void>())
          .then(Right.new);
    } catch (error) {
      logger.e([LogTags.repository.name, error]);
      return Left(ApiFailure());
    }
  }
}
