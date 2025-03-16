import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:module/domain/entity/export.dart';
import 'package:module/domain/usecase/export.dart';
import 'package:module/shared/shared.export.dart';

import '../../../base/base_state.dart';

part 'create_join_apply.state.dart';

@injectable
class CreateJoinApplyCubit extends Cubit<CreateJoinApplyState>
    with LoggerMixIn {
  CreateJoinApplyCubit(
      {@factoryParam required TripPlanEntity tripPlan,
      required TripPlanUseCase useCase})
      : _tripPlan = tripPlan,
        _useCase = useCase,
        super(CreateJoinApplyState());

  final TripPlanUseCase _useCase;
  final TripPlanEntity _tripPlan;

  void initState({
    Status? status,
    String? errorMessage,
    String? content,
  }) {
    emit(state.copyWith(
      status: status ?? state.status,
      errorMessage: errorMessage ?? state.errorMessage,
      content: content ?? state.content,
    ));
  }

  Future<void> submit() async {
    try {
      emit(state.copyWith(status: Status.loading));
      await _useCase.createJoinApply
          .call(
            tripPlanId: _tripPlan.id,
            content: state.content,
          )
          .then((res) => res.fold((l) {
                logger.e([LogTags.bloc, l.message]);
                emit(state.copyWith(
                    status: Status.error, errorMessage: l.message));
              }, (r) {
                logger.t([LogTags.bloc, 'create join apply success']);
                emit(state.copyWith(status: Status.success, errorMessage: ''));
              }));
    } catch (error) {
      logger.e([LogTags.bloc, error]);
      emit(state.copyWith(status: Status.error, errorMessage: 'error occurs'));
    }
  }
}
