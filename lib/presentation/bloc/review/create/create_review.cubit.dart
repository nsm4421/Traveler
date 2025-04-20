import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:module/domain/usecase/export.dart';
import 'package:module/shared/shared.export.dart';
import 'package:photo_manager/photo_manager.dart';

import '../../base/base_state.dart';

part 'create_review.state.dart';

@injectable
class CreateReviewCubit extends Cubit<CreateReviewState>
    with LoggerMixIn, AssetMixIn {
  CreateReviewCubit(this._useCase) : super(CreateReviewState());

  final ReviewUseCase _useCase;

  Future<void> checkPermission() async {
    await PhotoManager.requestPermissionExtend().then((res) => res.isAuth).then(
        (isAuth) => emit(state.copyWith(
            isAuth: isAuth,
            status: isAuth ? Status.initial : Status.error,
            errorMessage: isAuth ? '' : '권한이 허용되지 않았습니다')));
  }

  void updateStatus({Status? status, String? errorMessage}) {
    emit(state.copyWith(status: status, errorMessage: errorMessage));
  }

  void updateCountry(Country country) {
    emit(state.copyWith(country: country));
  }

  void updateTitle(String title) {
    emit(state.copyWith(title: title));
  }

  void updateCaption({required int index, required String text}) {
    final temp = [...state.captions];
    temp[index] = text;
    emit(state.copyWith(captions: temp));
  }

  void updateContent(String content) {
    emit(state.copyWith(content: content));
  }

  void toggleImage(AssetEntity entity) {
    if (state.assets.contains(entity)) {
      final index = state.assets.indexWhere((item) => item == entity);
      final tempCaptions = [...state.captions];
      final tempAssets = [...state.assets];
      tempCaptions.removeAt(index);
      tempAssets.removeAt(index);
      emit(state.copyWith(captions: tempCaptions, assets: tempAssets));
    } else {
      emit(state.copyWith(
          assets: [...state.assets, entity],
          captions: [...state.captions, '']));
    }
  }

  Future<void> submit() async {
    try {
      emit(state.copyWith(status: Status.loading));

      // 이미지 압축
      List<File> compressedFiles = [];
      for (final asset in state.assets) {
        final file = await asset2File(asset);
        final compressed = await compressFile(file);
        compressedFiles.add(compressed);
      }

      // 제출
      await _useCase
          .createReview(
              country: state.country,
              content: state.content,
              assets: compressedFiles,
              captions: state.captions,
              hashtags: state.hashtags)
          .then((res) => res.fold(
              (l) => emit(state.copyWith(
                  status: Status.error, errorMessage: l.message)),
              (r) => emit(
                  state.copyWith(status: Status.success, errorMessage: ''))));
    } catch (error) {
      emit(state.copyWith(status: Status.error, errorMessage: 'error occurs'));
    }
  }
}
