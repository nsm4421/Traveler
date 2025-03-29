import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:module/domain/entity/export.dart';
import 'package:module/domain/entity/trip_plan/join_apply/join_apply.entity.dart';
import 'package:module/domain/usecase/export.dart';
import 'package:module/shared/shared.export.dart';

import '../../../base/base_state.dart';

part 'accept_join_apply.state.dart';

@injectable
class JoinApplyApprovalCubit extends Cubit<JoinApplyApprovalState>
    with LoggerMixIn {
  JoinApplyApprovalCubit(@factoryParam this._joinApply, this._useCase)
      : super(JoinApplyApprovalState(
            tripPlanId: _joinApply.tripPlanId,
            isAccepted: _joinApply.isAccepted));

  final JoinApplyEntity _joinApply;
  final TripPlanUseCase _useCase;

  void initState({Status? status, String? errorMessage, bool? isAccepted}) {
    emit(state.copyWith(
        status: status, errorMessage: errorMessage, isAccepted: isAccepted));
  }

  Future<void> switchIsAccepted(bool isAccepted) async {
    if (state.status == Status.loading) {
      return;
    }
    try {
      emit(state.copyWith(status: Status.loading));
      await _useCase.switchIsAccepted
          .call(id: _joinApply.id, isAccepted: isAccepted)
          .then((res) => res.fold((l) {
                logger.e([LogTags.bloc, l.message]);
                emit(state.copyWith(
                    status: Status.error, errorMessage: l.message));
              }, (r) {
                logger.t([LogTags.bloc, 'switching is accepted success']);
                emit(state.copyWith(
                    status: Status.success,
                    errorMessage: '',
                    isAccepted: isAccepted));
              }));
    } catch (error) {
      logger.e([LogTags.bloc, error]);
      emit(state.copyWith(status: Status.error, errorMessage: 'error occurs'));
    }
  }
}
