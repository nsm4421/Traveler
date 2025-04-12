part of 'create_review.cubit.dart';

class CreateReviewState extends BaseState {
  final bool isAuth;
  final String title;
  final String content;
  late final List<AssetEntity> assets;

  CreateReviewState({
    super.status,
    super.errorMessage,
    this.isAuth = false,
    this.title = '',
    this.content = '',
    List<AssetEntity>? assets,
  }) {
    this.assets = assets ?? [];
  }

  @override
  CreateReviewState copyWith(
      {bool? isAuth,
      int? currentAlbumIndex,
      List<AssetPathEntity>? albums,
      List<AssetEntity>? assets,
      List<AssetEntity>? selected,
      String? title,
      String? content,
      Status? status,
      String? errorMessage}) {
    return CreateReviewState(
      isAuth: isAuth ?? this.isAuth,
      assets: assets ?? this.assets,
      title: title ?? this.title,
      content: content ?? this.content,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
