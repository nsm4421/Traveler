import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:module/domain/entity/export.dart';
import 'package:module/domain/repository/export.dart';
import 'package:module/shared/shared.export.dart';

part 'scenario/create_trip_plan.usecase.dart';

part 'scenario/modify_trip_plan.usecase.dart';

part 'scenario/delete_trip_plan.usecase.dart';

part 'scenario/fetch_trip_plan.usecase.dart';

part 'scenario/join_apply/fetch_join_apply.usecase.dart';

part 'scenario/join_apply/create_join_apply.usecase.dart';

part 'scenario/join_apply/modify_join_apply.usecase.dart';

part "scenario/join_apply/delete_join_apply.usecase.dart";

@lazySingleton
class TripPlanUseCase with LoggerMixIn {
  final TripPlanRepository _tripPlanRepository;
  final JoinApplyRepository _joinApplyRepository;

  TripPlanUseCase(
      {required TripPlanRepository tripPlanRepository,
      required JoinApplyRepository joinApplyRepository})
      : _tripPlanRepository = tripPlanRepository,
        _joinApplyRepository = joinApplyRepository;

  // ------- Trip Plan -------
  FetchTripPlansUseCase get fetchTripPlans =>
      FetchTripPlansUseCase(repository: _tripPlanRepository, logger: logger);

  CreateTripPlanUseCase get createTripPlan =>
      CreateTripPlanUseCase(repository: _tripPlanRepository, logger: logger);

  ModifyTripPlanUseCase get modifyTripPlan =>
      ModifyTripPlanUseCase(repository: _tripPlanRepository, logger: logger);

  DeleteTripPlanUseCase get deleteTripPlan =>
      DeleteTripPlanUseCase(repository: _tripPlanRepository, logger: logger);

  // ------- Join Apply -------
  FetchJoinApplyUseCase get fetchJoinApplies =>
      FetchJoinApplyUseCase(repository: _joinApplyRepository, logger: logger);

  CreateJoinApplyUseCase get createJoinApply =>
      CreateJoinApplyUseCase(repository: _joinApplyRepository, logger: logger);

  SwitchIsAcceptedUseCase get switchIsAccepted =>
      SwitchIsAcceptedUseCase(repository: _joinApplyRepository, logger: logger);

  EditJoinApplyContentUseCase get editJoinApplyContent =>
      EditJoinApplyContentUseCase(
          repository: _joinApplyRepository, logger: logger);

  DeleteJoinApplyUseCase get deleteJoinApply =>
      DeleteJoinApplyUseCase(repository: _joinApplyRepository, logger: logger);
}
