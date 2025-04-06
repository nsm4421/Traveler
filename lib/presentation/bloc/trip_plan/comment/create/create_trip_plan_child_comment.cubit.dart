import 'package:injectable/injectable.dart';
import 'package:module/domain/entity/export.dart';
import 'package:module/domain/usecase/export.dart';
import 'package:module/shared/shared.export.dart';

import '../../../base/comment/create/abs_create_child_comment.cubit.dart';

@injectable
class CreateTripPlanChildCommentCubit
    extends AbsCreateChildCommentCubit<TripPlanCommentEntity> with LoggerMixIn {
  final TripPlanCommentEntity _tripPlanParentComment;
  final TripPlanUseCase _useCase;

  CreateTripPlanChildCommentCubit({
    @factoryParam required TripPlanCommentEntity tripPlanParentComment,
    required TripPlanUseCase useCase,
  })  : _tripPlanParentComment = tripPlanParentComment,
        _useCase = useCase,
        super(tripPlanParentComment);

  @override
  Future<void> create(String content,
      {void Function(TripPlanCommentEntity e)? onSuccess}) async {
    try {
      emit(state.copyWith(status: Status.loading));
      await _useCase.createChildComment
          .call(
              refId: _tripPlanParentComment.refId,
              parentCommentId: _tripPlanParentComment.parentCommentId!,
              content: content)
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
