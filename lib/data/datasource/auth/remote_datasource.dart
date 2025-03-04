import 'package:module/data/model/export.dart';

abstract interface class RemoteAuthDataSource {
  UserModel get currentUser;

  String get currentUid;

  Future<void> signUp(SignUpRequestModel model);

  Future<UserModel> signIn({required String email, required String password});

  Future<void> signOut();
}
