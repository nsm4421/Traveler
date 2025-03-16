import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:module/domain/entity/export.dart';
import 'package:module/domain/usecase/export.dart';
import 'package:module/shared/shared.export.dart';

import '../../base/display/display.bloc.dart';

@injectable
class DisplayTripPlanBloc extends DisplayBloc<TripPlanEntity> {
  final TripPlanUseCase _useCase;
  final String? _uid;

  DisplayTripPlanBloc(
      {required TripPlanUseCase useCase, @factoryParam String? uid})
      : _useCase = useCase,
        _uid = uid;

  @override
  Future<void> onFetch(FetchDisplayEvent event,
      Emitter<DisplayState<TripPlanEntity>> emit) async {
    try {
      emit(state.copyWith(status: Status.pending));
      await _useCase.fetchTripPlans
          .call(uid: _uid, limit: event.limit, cursor: cursor)
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
      Emitter<DisplayState<TripPlanEntity>> emit) async {
    try {
      emit(state.copyWith(status: Status.loading, data: [], errorMessage: ''));
      await _useCase.fetchTripPlans
          .call(uid: _uid, limit: event.limit)
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
      Emitter<DisplayState<TripPlanEntity>> emit) async {
    try {
      emit(state.copyWith(status: Status.loading));
      await _useCase.fetchTripPlans
          .call(uid: _uid, limit: event.limit)
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
