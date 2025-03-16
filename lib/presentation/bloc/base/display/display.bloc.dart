import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:module/domain/entity/export.dart';

import 'package:module/shared/shared.export.dart';

import '../base_state.dart';

part 'display.state.dart';

part 'display.event.dart';

abstract class DisplayBloc<T extends BaseEntity>
    extends Bloc<DisplayEvent, DisplayState<T>> with LoggerMixIn {
  DisplayBloc() : super(DisplayState<T>()) {
    on<InitDisplayEvent>(onInit);
    on<MountDisplayEvent>(onMount);
    on<RefreshDisplayEvent>(onRefresh);
    on<FetchDisplayEvent>(onFetch);
  }

  DateTime? get cursor {
    final createdAtList =
        state.data.map((item) => item.createdAt).where((item) => item != null);
    return createdAtList.isEmpty
        ? null
        : createdAtList.reduce((v, e) => v!.isBefore(e!) ? v : e);
  }

  Future<void> onInit(
      InitDisplayEvent event, Emitter<DisplayState<T>> emit) async {
    try {
      emit(state.copyWith(
          status: event.status, errorMessage: event.errorMessage));
    } catch (error) {
      logger.e([LogTags.bloc, error]);
      emit(state.copyWith(
          status: Status.error, errorMessage: 'init display state fails'));
    }
  }

  Future<void> onMount(MountDisplayEvent event, Emitter<DisplayState<T>> emit);

  Future<void> onRefresh(
      RefreshDisplayEvent event, Emitter<DisplayState<T>> emit);

  Future<void> onFetch(FetchDisplayEvent event, Emitter<DisplayState<T>> emit);
}
