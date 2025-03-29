import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:module/domain/entity/export.dart';
import 'package:module/domain/repository/export.dart';
import 'package:module/shared/shared.export.dart';

import '../comment/abs_comment.usecase.dart';

part 'scenario/create_trip_plan.usecase.dart';

part 'scenario/modify_trip_plan.usecase.dart';

part 'scenario/delete_trip_plan.usecase.dart';

part 'scenario/fetch_trip_plan.usecase.dart';

part 'scenario/join_apply/fetch_join_apply.usecase.dart';

part 'scenario/join_apply/create_join_apply.usecase.dart';

part 'scenario/join_apply/modify_join_apply.usecase.dart';

part "scenario/join_apply/delete_join_apply.usecase.dart";

part 'scenario/comment/create_parent_comment.usecase.dart';

part 'scenario/comment/create_child_comment.usecase.dart';

part 'scenario/comment/fetch_parent_comments.usecase.dart';

part 'scenario/comment/fetch_child_comments.usecase.dart';

part 'scenario/comment/delete_comment.usecase.dart';

@lazySingleton
class TripPlanUseCase extends AbsCommentUseCase with LoggerMixIn {
  final TripPlanRepository _tripPlanRepository;
  final TripCommentCommentRepository _tripCommentCommentRepository;
  final JoinApplyRepository _joinApplyRepository;

  TripPlanUseCase(
      {required TripPlanRepository tripPlanRepository,
      required TripCommentCommentRepository tripCommentCommentRepository,
      required JoinApplyRepository joinApplyRepository})
      : _tripPlanRepository = tripPlanRepository,
        _tripCommentCommentRepository = tripCommentCommentRepository,
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

  // ------- Comment -------
  @override
  CreateTripPlanParentCommentUseCase get createParentComment =>
      CreateTripPlanParentCommentUseCase(
          repository: _tripCommentCommentRepository, logger: logger);

  @override
  CreateTripPlanChildCommentUseCase get createChildComment =>
      CreateTripPlanChildCommentUseCase(
          repository: _tripCommentCommentRepository, logger: logger);

  @override
  FetchTripPlanParentCommentsUseCase get fetchParentComments =>
      FetchTripPlanParentCommentsUseCase(
          repository: _tripCommentCommentRepository, logger: logger);

  @override
  FetchTripPlanChildCommentsUseCase get fetchChildComments =>
      FetchTripPlanChildCommentsUseCase(
          repository: _tripCommentCommentRepository, logger: logger);

  @override
  DeleteTripPlanCommentUseCase get deleteComment =>
      DeleteTripPlanCommentUseCase(
          repository: _tripCommentCommentRepository, logger: logger);

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
