import 'package:either_dart/either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:module/domain/entity/export.dart';
import 'package:module/shared/shared.export.dart';

import '../base_state.dart';

part 'abs_display.state.dart';

part 'abs_display.event.dart';

abstract class AbsDisplayBloc<T extends BaseEntity>
    extends Bloc<AbsDisplayEvent, AbsDisplayState<T>>
    with LoggerMixIn, UtcMixIn {
  AbsDisplayBloc() : super(AbsDisplayState<T>()) {
    on<InitDisplayEvent>(onInit);
    on<MountDisplayEvent>(onMount);
    on<RefreshDisplayEvent>(onRefresh);
    on<FetchDisplayEvent>(onFetch);
  }

  DateTime get cursor {
    final createdAtList = state.data
        .map((item) => item.createdAt)
        .where((item) => item != null)
        .map((item) => item!);
    return createdAtList.isEmpty
        ? nowDt
        : createdAtList.reduce((v, e) => v.isBefore(e) ? v : e);
  }

  Future<void> onInit(
      InitDisplayEvent event, Emitter<AbsDisplayState<T>> emit) async {
    try {
      emit(state.copyWith(
          status: event.status, errorMessage: event.errorMessage));
    } catch (error) {
      logger.e([LogTags.bloc, error]);
      emit(state.copyWith(
          status: Status.error, errorMessage: 'init display state fails'));
    }
  }

  Future<Either<Failure, Success<List<T>>>> handleMountEvent(
      MountDisplayEvent event);

  Future<Either<Failure, Success<List<T>>>> handleRefreshEvent(
      RefreshDisplayEvent event);

  Future<Either<Failure, Success<List<T>>>> handleFetchEvent(
      FetchDisplayEvent event);

  Future<void> onMount(
      MountDisplayEvent event, Emitter<AbsDisplayState<T>> emit) async {
    try {
      emit(state.copyWith(status: Status.loading, data: [], errorMessage: ''));
      await handleMountEvent(event).then((res) => res.fold((l) {
            logger.d([LogTags.bloc, l.message]);
            emit(state.copyWith(status: Status.error, errorMessage: l.message));
          }, (r) {
            final data = (event.reverse ? r.data?.reversed : r.data) ?? [];
            logger.t(
                [LogTags.bloc, 'init display state success(${data.length})']);
            emit(state.copyWith(
                status: Status.success,
                data: data.toList(),
                errorMessage: '',
                isEnd: data.length < event.limit));
          }));
    } catch (error) {
      logger.e([LogTags.bloc, error]);
      emit(state.copyWith(
          status: Status.error, errorMessage: 'init display state fails'));
    }
  }

  Future<void> onRefresh(
      RefreshDisplayEvent event, Emitter<AbsDisplayState<T>> emit) async {
    try {
      emit(state.copyWith(status: Status.loading, data: [], errorMessage: ''));
      await handleRefreshEvent(event).then((res) => res.fold((l) {
            logger.d([LogTags.bloc, l.message]);
            emit(state.copyWith(status: Status.error, errorMessage: l.message));
          }, (r) {
            final data = (event.reverse ? r.data?.reversed : r.data) ?? [];
            logger.t([LogTags.bloc, 'refresh success(${data.length})']);
            emit(state.copyWith(
                status: Status.success,
                data: data.toList(),
                errorMessage: '',
                isEnd: data.length < event.limit));
          }));
    } catch (error) {
      logger.e([LogTags.bloc, error]);
      emit(state.copyWith(
          status: Status.error, errorMessage: 'refresh display state fails'));
    }
  }

  Future<void> onFetch(
      FetchDisplayEvent event, Emitter<AbsDisplayState<T>> emit) async {
    try {
      emit(state.copyWith(status: Status.pending));
      await handleFetchEvent(event).then((res) => res.fold((l) {
            logger.d([LogTags.bloc, l.message]);
            emit(state.copyWith(status: Status.error, errorMessage: l.message));
          }, (r) {
            final data = (event.reverse ? r.data?.reversed : r.data) ?? [];
            logger.t([
              LogTags.bloc,
              'fetching success(${data.length})',
              data
            ]);
            emit(state.copyWith(
                status: Status.success,
                data: event.insertOnHead
                    ? [...data, ...state.data]
                    : [...state.data, ...data],
                errorMessage: '',
                isEnd: data.length < event.limit));
          }));
    } catch (error) {
      logger.e([LogTags.bloc, error]);
      emit(
          state.copyWith(status: Status.error, errorMessage: 'fetching fails'));
    }
  }
}
