import 'package:injectable/injectable.dart';
import 'package:module/domain/entity/export.dart';
import 'package:module/domain/usecase/export.dart';
import 'package:module/shared/shared.export.dart';

import '../../../base/comment/create/abs_create_parent_comment.cubit.dart';

@injectable
class CreateTripPlanParentCommentCubit
    extends AbsCreateParentCommentCubit<TripPlanEntity> with LoggerMixIn {
  final TripPlanEntity _tripPlan;
  final TripPlanUseCase _useCase;

  CreateTripPlanParentCommentCubit({
    @factoryParam required TripPlanEntity tripPlan,
    required TripPlanUseCase useCase,
  })  : _tripPlan = tripPlan,
        _useCase = useCase,
        super(tripPlan);

  @override
  Future<void> create(String content,
      {void Function(TripPlanCommentEntity e)? onSuccess}) async {
    try {
      emit(state.copyWith(status: Status.loading));
      await _useCase.createParentComment
          .call(refId: _tripPlan.id, content: content)
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
