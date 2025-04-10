import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:module/domain/usecase/export.dart';
import 'package:module/shared/shared.export.dart';
import 'package:photo_manager/photo_manager.dart';

import '../../base/base_state.dart';

part 'create_review.state.dart';

@lazySingleton
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

  void updateContent(String content) {
    emit(state.copyWith(content: content));
  }

  void toggleImage(AssetEntity entity) {
    final temp = [...state.assets];
    final isContained = temp.contains(entity);
    if (isContained) {
      temp.removeWhere((item) => item.id == entity.id);
    } else {
      temp.add(entity);
    }
    emit(state.copyWith(assets: temp));
  }

  void submit() async {
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
          .createReview(content: state.content, assets: compressedFiles)
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
