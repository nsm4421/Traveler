part of 'auth.remote_datasource_impl.dart';

abstract interface class RemoteAuthDataSource {
  UserModel get currentUser;

  String get currentUid;

  Stream<UserModel?> get authStream;

  Future<void> signUp(SignUpRequestModel model);

  Future<void> signIn({required String email, required String password});

  Future<void> signOut();
}
