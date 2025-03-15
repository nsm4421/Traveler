import 'package:injectable/injectable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:module/domain/entity/export.dart';
import 'package:module/domain/usecase/export.dart';
import 'package:module/shared/shared.export.dart';

import '../../base_state.dart';

part 'event.dart';

@injectable
class DisplayTripPlanBloc
    extends Bloc<DisplayTripPlanEvent, DisplayState<TripPlanEntity>>
    with LoggerMixIn {
  final TripPlanUseCase _useCase;
  String? uid; // 조회할 유저 id

  DisplayTripPlanBloc(this._useCase) : super(DisplayState<TripPlanEntity>()) {
    on<InitDisplayTripPlanEvent>(_onInit);
    on<MountDisplayTripPlanEvent>(_onMount);
    on<RefreshDisplayTripPlanEvent>(_onRefresh);
    on<FetchDisplayTripPlanEvent>(_onFetch);
  }

  DateTime? get cursor {
    final createdAtList =
        state.data.map((item) => item.createdAt).where((item) => item != null);
    return createdAtList.isEmpty
        ? null
        : createdAtList.reduce((v, e) => v!.isBefore(e!) ? v : e);
  }

  Future<void> _onInit(InitDisplayTripPlanEvent event,
      Emitter<DisplayState<TripPlanEntity>> emit) async {
    try {
      emit(state.copyWith(
          status: event.status, errorMessage: event.errorMessage));
    } catch (error) {
      logger.e([LogTags.bloc, error]);
      emit(state.copyWith(
          status: Status.error, errorMessage: 'init display state fails'));
    }
  }

  Future<void> _onMount(MountDisplayTripPlanEvent event,
      Emitter<DisplayState<TripPlanEntity>> emit) async {
    try {
      emit(state.copyWith(status: Status.loading, data: [], errorMessage: ''));
      await _useCase.fetch
          .call(uid: event.uid, limit: event.limit)
          .then((res) => res.fold((l) {
                logger.d([LogTags.bloc, l.message]);
                emit(state.copyWith(
                    status: Status.error, errorMessage: l.message));
              }, (r) {
                logger.t([LogTags.bloc, 'init display state success', r.data]);
                this.uid = event.uid;
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

  Future<void> _onRefresh(RefreshDisplayTripPlanEvent event,
      Emitter<DisplayState<TripPlanEntity>> emit) async {
    try {
      emit(state.copyWith(status: Status.loading));
      await _useCase.fetch.call(uid: this.uid, limit: event.limit).then((res) =>
          res.fold((l) {
            logger.d([LogTags.bloc, l.message]);
            emit(state.copyWith(status: Status.error, errorMessage: l.message));
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

  Future<void> _onFetch(FetchDisplayTripPlanEvent event,
      Emitter<DisplayState<TripPlanEntity>> emit) async {
    try {
      emit(state.copyWith(status: Status.pending));
      await _useCase.fetch.call(uid: this.uid, limit: event.limit).then((res) =>
          res.fold((l) {
            logger.d([LogTags.bloc, l.message]);
            emit(state.copyWith(status: Status.error, errorMessage: l.message));
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
}
