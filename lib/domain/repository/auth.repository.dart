import 'package:module/domain/entity/export.dart';
import 'package:module/shared/shared.export.dart';

abstract interface class AuthRepository {
  UserEntity get currentUser;

  String get currentUid;

  Stream<UserEntity?> get authStream;

  Future<void> signUp(
      {required String username,
      required String email,
      required String description,
      required Sex sex,
      required DateTime bornAt,
      required String password});

  Future<void> signIn({required String email, required String password});

  Future<void> signOut();
}
