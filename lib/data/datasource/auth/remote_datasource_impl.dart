import 'package:module/data/model/export.dart';

import 'remote_datasource.dart';

class RemoteAuthDataSourceImpl implements RemoteAuthDataSource {
  @override
  // TODO: implement currentUser
  UserModel get currentUser => throw UnimplementedError();

  @override
  String get currentUid => currentUser.id;

  @override
  Future<UserModel> signIn(SignInRequestModel model) {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<void> signUp(SignUpRequestModel model) {
    // TODO: implement signUp
    throw UnimplementedError();
  }
}
