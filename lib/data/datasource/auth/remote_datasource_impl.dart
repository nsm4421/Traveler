import 'package:logger/logger.dart';
import 'package:module/data/model/export.dart';
import 'package:module/shared/shared.export.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'remote_datasource.dart';

class RemoteAuthDataSourceImpl implements RemoteAuthDataSource {
  final SupabaseClient _supabaseClient;
  final Logger _logger;

  RemoteAuthDataSourceImpl(
      {required SupabaseClient supabaseClient, required Logger logger})
      : _supabaseClient = supabaseClient,
        _logger = logger;

  @override
  UserModel get currentUser =>
      UserModel.from(_supabaseClient.auth.currentUser!);

  @override
  String get currentUid => currentUser.id;

  @override
  Future<UserModel> signIn(
      {required String email, required String password}) async {
    return await _supabaseClient.auth
        .signInWithPassword(email: email, password: password)
        .then((res) => res.user!)
        .then(UserModel.from);
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
