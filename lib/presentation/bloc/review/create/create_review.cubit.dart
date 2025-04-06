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

  Future<void> loadAssets() async {
    final albums = await PhotoManager.getAssetPathList(
      type: RequestType.image | RequestType.video,
      onlyAll: true,
    );
    if (albums.isEmpty) {
      emit(state.copyWith(
          status: Status.error, errorMessage: '선택할 수 있는 앨범이 없습니다'));
      return;
    }
    final assets = await albums.first.getAssetListPaged(page: 0, size: 20);
    emit(state.copyWith(assets: assets));
  }

  void toggleAsset(AssetEntity asset) {
    final isSelected = state.selected.contains(asset);
    if (isSelected) {
      emit(state.copyWith(
          selected: state.selected.where((item) => item != asset).toList()));
    } else {
      emit(state.copyWith(selected: [...state.selected, asset]));
    }
  }

  void updateContent(String content) {
    emit(state.copyWith(content: content));
  }

  void submit() async {
    try {
      emit(state.copyWith(status: Status.loading));

      // 이미지 압축
      List<File> compressedFiles = [];
      for (final asset in state.selected) {
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
