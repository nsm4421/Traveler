part of 'create_review.cubit.dart';

class CreateReviewState extends BaseState {
  final bool isAuth;
  final Country country;
  final String title;
  final String content;
  late final List<AssetEntity> assets;
  late final List<String> captions;
  late final List<String> hashtags;

  CreateReviewState({
    super.status,
    super.errorMessage,
    this.isAuth = false,
    this.country = Country.korea,
    this.title = '',
    this.content = '',
    List<AssetEntity>? assets,
    List<String>? captions,
    List<String>? hashtags,
  }) {
    this.assets = assets ?? [];
    this.captions = captions ?? [];
    this.hashtags = hashtags ?? [];
  }

  @override
  CreateReviewState copyWith(
      {Country? country,
      bool? isAuth,
      int? currentAlbumIndex,
      List<AssetEntity>? assets,
      List<String>? captions,
      List<String>? hashtags,
      String? title,
      String? content,
      Status? status,
      String? errorMessage}) {
    return CreateReviewState(
      country: country ?? this.country,
      isAuth: isAuth ?? this.isAuth,
      assets: assets ?? this.assets,
      captions: captions ?? this.captions,
      hashtags: hashtags ?? this.hashtags,
      title: title ?? this.title,
      content: content ?? this.content,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
