import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:module/domain/usecase/export.dart';
import 'package:module/shared/shared.export.dart';

import '../../base_state.dart';

part 'state.dart';

@injectable
class CreateJourneyCubit extends Cubit<CreateJourneyState> with LoggerMixIn {
  final JourneyUseCase _useCase;

  CreateJourneyCubit(this._useCase)
      : super(CreateJourneyState(
            startDate: DateTime.now(),
            endDate: DateTime.now().add(5.durationInDays)));

  bool get validate =>
      state.title.isNotEmpty &&
      state.content.isNotEmpty &&
      state.startDate != null &&
      state.endDate != null &&
      state.endDate!.isAfter(state.startDate!);

  void update({
    Status? status,
    String? title,
    String? content,
    Country? country,
  }) {
    logger.t('update state');
    emit(state.copyWith(
        status: status, title: title, content: content, country: country));
  }

  void updateDate({DateTime? startDate, DateTime? endDate}) {
    emit(state.copyWithDate(startDate: startDate, endDate: endDate));
  }

  Future<void> submit() async {
    try {
      if (!validate) {
        logger.w([LogTags.bloc.name, 'validation fails']);
        emit(state.copyWith(
            status: Status.error, errorMessage: 'validation fails'));
        return;
      }
      await _useCase.create
          .call(
              content: state.content,
              country: state.country,
              dateTimeRange:
                  DateTimeRange(start: state.startDate!, end: state.endDate!))
          .then((res) => res.fold((l) {
                logger.e([LogTags.bloc.name, l.message]);
                emit(state.copyWith(
                    status: Status.error, errorMessage: l.message));
              }, (r) {
                logger.d([LogTags.bloc.name, 'success']);
                emit(state.copyWith(status: Status.success, errorMessage: ''));
              }));
    } catch (error) {
      logger.e([LogTags.bloc.name, error]);
      emit(state.copyWith(
          status: Status.error, errorMessage: 'form is invalid'));
      return;
    }
  }
}
