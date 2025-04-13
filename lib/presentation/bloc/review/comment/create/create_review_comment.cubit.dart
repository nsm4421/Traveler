import 'package:injectable/injectable.dart';
import 'package:module/domain/entity/export.dart';
import 'package:module/domain/usecase/export.dart';
import 'package:module/shared/shared.export.dart';

import '../../../base/comment/create/abs_create_parent_comment.cubit.dart';

@injectable
class CreateParentReviewCommentCubit
    extends AbsCreateParentCommentCubit<ReviewEntity> with LoggerMixIn {
  final ReviewEntity _review;
  final ReviewUseCase _useCase;

  CreateParentReviewCommentCubit({
    @factoryParam required ReviewEntity review,
    required ReviewUseCase useCase,
  })  : _review = review,
        _useCase = useCase,
        super(review);

  @override
  Future<void> create(String content,
      {void Function(ReviewCommentEntity e)? onSuccess}) async {
    try {
      emit(state.copyWith(status: Status.loading));
      await _useCase.createParentComment
          .call(refId: _review.id, content: content)
          .then((res) => res.fold(
                  (l) => emit(state.copyWith(
                      status: Status.error, errorMessage: l.message)), (r) {
                emit(state.copyWith(status: Status.success, errorMessage: ''));
                if (onSuccess != null && r.data != null) {
                  onSuccess(r.data!);
                }
              }));
    } catch (error) {
      logger.e([LogTags.bloc, error]);
      emit(state.copyWith(status: Status.error, errorMessage: 'error occurs'));
    } finally {
      if (state.status == Status.loading) {
        emit(state.copyWith(status: Status.initial));
      }
    }
  }
}
