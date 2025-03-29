import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:module/domain/entity/export.dart';
import 'package:module/domain/usecase/export.dart';
import 'package:module/shared/shared.export.dart';

import '../../../base/display/display.bloc.dart';

part 'display_join_apply.event.dart';

@injectable
class DisplayJoinApplyBloc extends DisplayBloc<JoinApplyEntity> {
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
      Emitter<DisplayState<JoinApplyEntity>> emit) {
    emit(state.copyWith(
        data: state.data
            .map((item) => item.copyWith(
                isAccepted: item.tripPlanId == event.tripPlanId
                    ? event.isAccepted
                    : null))
            .toList()));
  }

  @override
  Future<void> onFetch(FetchDisplayEvent event,
      Emitter<DisplayState<JoinApplyEntity>> emit) async {
    try {
      emit(state.copyWith(status: Status.pending));
      await _useCase.fetchJoinApplies
          .call(tripPlanId: _tripPlan.id, limit: event.limit, cursor: cursor)
          .then((res) => res.fold((l) {
                logger.d([LogTags.bloc, l.message]);
                emit(state.copyWith(
                    status: Status.error, errorMessage: l.message));
              }, (r) {
                logger.t([LogTags.bloc, 'fetching success']);
                emit(state.copyWith(
                    status: Status.success,
                    data: [...(r.data ?? []).reversed, ...state.data],
                    errorMessage: '',
                    isEnd: (r.data?.length ?? 0) < event.limit));
              }));
    } catch (error) {
      logger.e([LogTags.bloc, error]);
      emit(
          state.copyWith(status: Status.error, errorMessage: 'fetching fails'));
    }
  }

  @override
  Future<void> onMount(MountDisplayEvent event,
      Emitter<DisplayState<JoinApplyEntity>> emit) async {
    try {
      emit(state.copyWith(status: Status.loading, data: [], errorMessage: ''));
      await _useCase.fetchJoinApplies
          .call(tripPlanId: _tripPlan.id, limit: event.limit, cursor: cursor)
          .then((res) => res.fold((l) {
                logger.d([LogTags.bloc, l.message]);
                emit(state.copyWith(
                    status: Status.error, errorMessage: l.message));
              }, (r) {
                logger.t([LogTags.bloc, 'init display state success', r.data]);
                emit(state.copyWith(
                    status: Status.success,
                    data: (r.data ?? []).reversed.toList(),
                    errorMessage: '',
                    isEnd: (r.data?.length ?? 0) < event.limit));
              }));
    } catch (error) {
      logger.e([LogTags.bloc, error]);
      emit(state.copyWith(
          status: Status.error, errorMessage: 'init display state fails'));
    }
  }

  @override
  Future<void> onRefresh(RefreshDisplayEvent event,
      Emitter<DisplayState<JoinApplyEntity>> emit) async {
    try {
      emit(state.copyWith(status: Status.loading));
      await _useCase.fetchJoinApplies
          .call(tripPlanId: _tripPlan.id, limit: event.limit, cursor: cursor)
          .then((res) => res.fold((l) {
                logger.d([LogTags.bloc, l.message]);
                emit(state.copyWith(
                    status: Status.error, errorMessage: l.message));
              }, (r) {
                logger.t([LogTags.bloc, 'refresh success']);
                emit(state.copyWith(
                    status: Status.success,
                    data: (r.data ?? []).reversed.toList(),
                    errorMessage: '',
                    isEnd: (r.data?.length ?? 0) < event.limit));
              }));
    } catch (error) {
      logger.e([LogTags.bloc, error]);
      emit(state.copyWith(status: Status.error, errorMessage: 'refresh fails'));
    }
  }
}
