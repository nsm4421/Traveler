import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:module/domain/entity/export.dart';
import 'package:module/domain/usecase/export.dart';
import 'package:module/shared/shared.export.dart';

import '../../../base/base_state.dart';

part 'create_join_apply.state.dart';

part 'create_join_apply.event.dart';

@injectable
class CreateJoinApplyBloc
    extends Bloc<CreateJoinApplyEvent, CreateJoinApplyState> with LoggerMixIn {
  CreateJoinApplyBloc(
      {required TripPlanUseCase useCase,
      @factoryParam required TripPlanEntity entity})
      : _useCase = useCase,
        _entity = entity,
        super(CreateJoinApplyState()) {
    on<InitJoinApplyEvent>(_onInit);
    on<MountJoinApplyEvent>(_onMount);
    on<SubmitJoinApplyEvent>(_onSubmit);
  }

  final TripPlanUseCase _useCase;
  final TripPlanEntity _entity;

  TripPlanEntity get tripPlan => _entity;

  Future<void> _onInit(
      InitJoinApplyEvent event, Emitter<CreateJoinApplyState> emit) async {
    emit(state.copyWith(
      status: event.status,
      errorMessage: event.errorMessage,
      applyStatus: event.applyStatus,
    ));
  }

  Future<void> _onMount(
      MountJoinApplyEvent event, Emitter<CreateJoinApplyState> emit) async {
    try {
      emit(state.copyWith(status: Status.loading));
      final ApplyStatus applyStatus =
          ApplyStatus.canApply; // TODO : 지원여부 및 마감여부 마감여부 가져오기
      emit(state.copyWith(status: Status.initial, applyStatus: applyStatus));
    } catch (error) {
      logger.e([LogTags.bloc, error]);
      emit(state.copyWith(status: Status.error, errorMessage: 'Mount Fails'));
    }
  }

  Future<void> _onSubmit(
      SubmitJoinApplyEvent event, Emitter<CreateJoinApplyState> emit) async {
    try {
      emit(state.copyWith(status: Status.loading));
      await _useCase.createJoinApply
          .call(tripPlanId: _entity.id, content: event.content)
          .then((res) => res.fold((l) {
                logger.d([LogTags.bloc, l.message]);
                emit(state.copyWith(
                    status: Status.error, errorMessage: l.message));
              }, (r) {
                logger.t([LogTags.bloc, 'submit success']);
                emit(state.copyWith(status: Status.success, errorMessage: ''));
              }));
    } catch (error) {
      logger.e([LogTags.bloc, error]);
      emit(state.copyWith(status: Status.error, errorMessage: 'Submit Fails'));
    }
  }
}

// @injectable
// class CreateJoinApplyCubit extends Cubit<CreateJoinApplyState>
//     with LoggerMixIn {
//   CreateJoinApplyCubit(
//       {@factoryParam required TripPlanEntity tripPlan,
//       required TripPlanUseCase useCase})
//       : _tripPlan = tripPlan,
//         _useCase = useCase,
//         super(CreateJoinApplyState());
//
//   final TripPlanUseCase _useCase;
//   final TripPlanEntity _tripPlan;
//
//   void initState({
//     Status? status,
//     String? errorMessage,
//     String? content,
//   }) {
//     emit(state.copyWith(
//       status: status ?? state.status,
//       errorMessage: errorMessage ?? state.errorMessage,
//       content: content ?? state.content,
//     ));
//   }
//
//   Future<void> submit() async {
//     try {
//       emit(state.copyWith(status: Status.loading));
//       await _useCase.createJoinApply
//           .call(
//             tripPlanId: _tripPlan.id,
//             content: state.content,
//           )
//           .then((res) => res.fold((l) {
//                 logger.e([LogTags.bloc, l.message]);
//                 emit(state.copyWith(
//                     status: Status.error, errorMessage: l.message));
//               }, (r) {
//                 logger.t([LogTags.bloc, 'create join apply success']);
//                 emit(state.copyWith(status: Status.success, errorMessage: ''));
//               }));
//     } catch (error) {
//       logger.e([LogTags.bloc, error]);
//       emit(state.copyWith(status: Status.error, errorMessage: 'error occurs'));
//     }
//   }
// }
