import 'dart:io';

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
  final AuthStorageDataSource _authStorageDataSource;

  AuthRepositoryImpl(
      {required LocalStorageDataSource localStorageDataSource,
      required RemoteAuthDataSource remoteAuthDataSource,
      required AuthStorageDataSource authStorageDataSource})
      : _localStorageDataSource = localStorageDataSource,
        _remoteAuthDataSource = remoteAuthDataSource,
        _authStorageDataSource = authStorageDataSource;

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
  Future<void> signUp({
    required String email,
    required String username,
    required String description,
    required Sex sex,
    required DateTime bornAt,
    required String password,
    required File profileImage,
  }) async {
    final imageUrl = await _authStorageDataSource.uploadProfileImage(
        filename: username, // 프로필 이미지 파일명을 유저명 지정
        profileImage: profileImage,
        upsert: false);
    final data = SignUpRequestModel(
        email: email,
        password: password,
        data: RawUserMetaDataModel(
            username: username,
            description: description,
            sex: sex,
            born_at: bornAt,
            profile_image: imageUrl));
    await _remoteAuthDataSource.signUp(data);
  }

  @override
  Future<void> editProfile({
    String? description,
    Sex? sex,
    DateTime? bornAt,
    File? profileImage,
    void Function(double progress)? onProgress,
  }) async {
    final imageUrl = profileImage == null
        ? null
        : await _authStorageDataSource.uploadProfileImage(
            filename: currentUser.username,
            profileImage: profileImage,
            upsert: true);
    // AUTH.USERS.RAW_USER_META_DATA 필드 업데이트
    // 트리거에 의해서 PUBLIC.USERS 테이블도 업데이트 됨
    await _remoteAuthDataSource.editUserMetaData(EditProfileModel(
        description: description,
        sex: sex,
        born_at: bornAt,
        profile_image: imageUrl));
  }
}
