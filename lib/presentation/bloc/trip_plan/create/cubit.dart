import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:module/domain/usecase/export.dart';
import 'package:module/shared/shared.export.dart';

import '../../base_state.dart';

part 'state.dart';

@injectable
class CreateTripPlanCubit extends Cubit<CreateTripPlanState> with LoggerMixIn {
  CreateTripPlanCubit(this._useCase) : super(CreateTripPlanState());

  final TripPlanUseCase _useCase;

  void initState({
    Status? status,
    String? errorMessage,
    String? title,
    String? content,
    int? minHeadCount,
    int? maxHeadCount,
    List<String>? hashtags,
    Country? country,
    DateTime? startDate,
    DateTime? endDate,
  }) {
    emit(state.copyWith(
      status: status ?? state.status,
      errorMessage: errorMessage ?? state.errorMessage,
      title: title ?? state.title,
      content: content ?? state.content,
      minHeadCount: minHeadCount ?? state.minHeadCount,
      maxHeadCount: maxHeadCount ?? state.maxHeadCount,
      hashtags: hashtags ?? state.hashtags,
      country: country ?? state.country,
      startDate: startDate ?? state.startDate,
      endDate: endDate ?? state.endDate,
    ));
  }

  Future<void> submit() async {
    try {
      emit(state.copyWith(status: Status.loading));
      await _useCase.create
          .call(
              title: state.title,
              content: state.content,
              country: state.country,
              minHeadCount: state.minHeadCount,
              maxHeadCount: state.maxHeadCount,
              hashtags: state.hashtags,
              startDate: state.startDate,
              endDate: state.endDate)
          .then((res) => res.fold((l) {
                logger.e([LogTags.bloc, l.message]);
                emit(state.copyWith(
                    status: Status.error, errorMessage: l.message));
              }, (r) {
                logger.t([LogTags.bloc, 'create trip plan success']);
                emit(state.copyWith(status: Status.success, errorMessage: ''));
              }));
    } catch (error) {
      logger.e([LogTags.bloc, error]);
      emit(state.copyWith(status: Status.error, errorMessage: 'error occurs'));
    }
  }
}
