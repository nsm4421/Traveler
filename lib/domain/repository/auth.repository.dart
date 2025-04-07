import 'dart:io';

import 'package:module/domain/entity/export.dart';
import 'package:module/shared/shared.export.dart';

abstract interface class AuthRepository {
  UserEntity get currentUser;

  String get currentUid;

  Stream<UserEntity?> get authStream;

  Future<void> editProfile({
    String? description,
    Sex? sex,
    DateTime? bornAt,
    File? profileImage,
  });

  Future<void> signUp({
    required String username,
    required String email,
    required String description,
    required Sex sex,
    required DateTime bornAt,
    required String password,
    required File profileImage,
  });

  Future<void> signIn({required String email, required String password});

  Future<void> signOut();
}
