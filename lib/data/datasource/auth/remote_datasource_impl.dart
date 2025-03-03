import 'package:logger/logger.dart';
import 'package:module/data/model/export.dart';
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
