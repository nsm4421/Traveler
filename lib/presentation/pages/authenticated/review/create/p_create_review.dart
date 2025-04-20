import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:module/dependency_injection.dart';
import 'package:module/presentation/bloc/export.dart';
import 'package:module/shared/shared.export.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:photo_manager_image_provider/photo_manager_image_provider.dart';

import '../../../../widgets/loading_overlay.widget.dart';

part 's_create_review.dart';

part 's_permission_denied.dart';

part 'f_select_image.dart';

part 'f_edit_detail.dart';

part 'w_edit_caption.dart';

part 'f_upload_review.dart';

part 'w_step_bar.dart';

part 'w_preview_review.dart';

part 'w_select_country.dart';

part 'w_hashtag.dart';

Page Function(BuildContext, GoRouterState) createReviewPageBuilder =
    (context, state) {
  final view = BlocProvider(
      create: (_) => getIt<CreateReviewCubit>()..checkPermission(),
      child: BlocListener<CreateReviewCubit, CreateReviewState>(
        listener: (context, state) {
          if (state.status == Status.success && context.mounted) {
            context
              ..showSnackBar('리뷰 등록이 완료되었습니다')
              ..pop();
          } else if (state.status == Status.error) {
            context.showSnackBar(state.errorMessage);
            Timer(1.durationInSec, () {
              context
                  .read<CreateReviewCubit>()
                  .updateStatus(status: Status.initial, errorMessage: '');
            });
          }
        },
        child: BlocBuilder<CreateReviewCubit, CreateReviewState>(
            builder: (context, state) {
          return (!state.isAuth && state.status == Status.error)
              ? const PermissionDeniedScreen()
              : LoadingOverLayWidget(
                  isLoading: state.status == Status.loading,
                  child: const CreateReviewScreen());
        }),
      ));
  return NoTransitionPage(child: view);
};

enum CreateReviewStep {
  selectMedia(title: '사진 선택하기', iconData: Icons.add_photo_alternate_outlined),
  editDetail(title: '리뷰작성하기', iconData: Icons.notes),
  submit(title: '업로드', iconData: Icons.upload);

  final IconData iconData;
  final String title;

  const CreateReviewStep({required this.title, required this.iconData});
}
