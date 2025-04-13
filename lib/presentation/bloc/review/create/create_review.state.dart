part of 'create_review.cubit.dart';

class CreateReviewState extends BaseState {
  final bool isAuth;
  final String title;
  final String content;
  late final List<AssetEntity> assets;
  late final List<String> captions;

  CreateReviewState(
      {super.status,
      super.errorMessage,
      this.isAuth = false,
      this.title = '',
      this.content = '',
      List<AssetEntity>? assets,
      List<String>? captions}) {
    this.assets = assets ?? [];
    this.captions = captions ?? [];
  }

  @override
  CreateReviewState copyWith(
      {bool? isAuth,
      int? currentAlbumIndex,
      List<AssetEntity>? assets,
      List<String>? captions,
      String? title,
      String? content,
      Status? status,
      String? errorMessage}) {
    return CreateReviewState(
      isAuth: isAuth ?? this.isAuth,
      assets: assets ?? this.assets,
      captions: captions ?? this.captions,
      title: title ?? this.title,
      content: content ?? this.content,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
