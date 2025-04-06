part of 'create_review.cubit.dart';

class CreateReviewState extends BaseState {
  final bool isAuth;
  final String content;
  late final List<AssetEntity> assets;
  late final List<AssetEntity> selected;

  CreateReviewState({
    super.status,
    super.errorMessage,
    this.isAuth = false,
    this.content = '',
    List<AssetEntity>? assets,
    List<AssetEntity>? selected,
  }) {
    this.assets = assets ?? this.assets;
    this.selected = selected ?? this.selected;
  }

  @override
  CreateReviewState copyWith(
      {bool? isAuth,
      List<AssetEntity>? assets,
      List<AssetEntity>? selected,
      String? content,
      Status? status,
      String? errorMessage}) {
    return CreateReviewState(
      isAuth: isAuth ?? this.isAuth,
      assets: assets ?? this.assets,
      selected: selected ?? this.selected,
      content: content ?? this.content,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
