import 'package:either_dart/either.dart';
import 'package:module/domain/entity/export.dart';
import 'package:module/shared/shared.export.dart';

abstract interface class AuthRepository {
  UserEntity get currentUser;

  String get currentUid;

  Future<Either<ApiFailure, ApiSuccess<void>>> signUp(
      {required String username,
      required String description,
      required Sex sex,
      required DateTime bornAt,
      required String password});

  Future<Either<ApiFailure, ApiSuccess<UserEntity>>> signIn(
      {required String username, required String password});

  Future<Either<ApiFailure, ApiSuccess<void>>> signOut();
}
