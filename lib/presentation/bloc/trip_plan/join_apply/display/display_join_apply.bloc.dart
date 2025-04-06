import 'package:either_dart/either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:module/domain/entity/export.dart';
import 'package:module/domain/usecase/export.dart';
import 'package:module/shared/shared.export.dart';

import '../../../base/display/abs_display.bloc.dart';

part 'display_join_apply.event.dart';

@injectable
class DisplayJoinApplyBloc extends AbsDisplayBloc<JoinApplyEntity> {
  final TripPlanUseCase _useCase;
  final TripPlanEntity _tripPlan;

  DisplayJoinApplyBloc(
      {required TripPlanUseCase useCase,
      @factoryParam required TripPlanEntity tripPlan})
      : _useCase = useCase,
        _tripPlan = tripPlan {
    on<UpdateJoinApplyApprovalEvent>(_onUpdateApproval);
  }

  void _onUpdateApproval(UpdateJoinApplyApprovalEvent event,
      Emitter<AbsDisplayState<JoinApplyEntity>> emit) {
    emit(state.copyWith(
        data: state.data
            .map((item) => item.copyWith(
                isAccepted: item.tripPlanId == event.tripPlanId
                    ? event.isAccepted
                    : null))
            .toList()));
  }

  @override
  Future<Either<Failure, Success<List<JoinApplyEntity>>>> handleFetchEvent(
          FetchDisplayEvent event) async =>
      await _useCase.fetchJoinApplies
          .call(tripPlan: _tripPlan, limit: event.limit, cursor: cursor);

  @override
  Future<Either<Failure, Success<List<JoinApplyEntity>>>> handleMountEvent(
          MountDisplayEvent event) async =>
      await _useCase.fetchJoinApplies
          .call(tripPlan: _tripPlan, limit: event.limit);

  @override
  Future<Either<Failure, Success<List<JoinApplyEntity>>>> handleRefreshEvent(
          RefreshDisplayEvent event) async =>
      await _useCase.fetchJoinApplies
          .call(tripPlan: _tripPlan, limit: event.limit);
}
