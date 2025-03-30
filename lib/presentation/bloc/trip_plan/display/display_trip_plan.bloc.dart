import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

import 'package:module/domain/entity/export.dart';
import 'package:module/domain/usecase/export.dart';
import 'package:module/shared/shared.export.dart';

import '../../base/display/abs_display.bloc.dart';

@injectable
class DisplayTripPlanBloc extends AbsDisplayBloc<TripPlanEntity> {
  final TripPlanUseCase _useCase;
  final String? _uid;

  DisplayTripPlanBloc(
      {required TripPlanUseCase useCase, @factoryParam String? uid})
      : _useCase = useCase,
        _uid = uid;

  @override
  Future<Either<Failure, Success<List<TripPlanEntity>>>> handleFetchEvent(
          FetchDisplayEvent event) async =>
      await _useCase.fetchTripPlans
          .call(uid: _uid, limit: event.limit, cursor: cursor);

  @override
  Future<Either<Failure, Success<List<TripPlanEntity>>>> handleMountEvent(
          MountDisplayEvent event) async =>
      await _useCase.fetchTripPlans.call(uid: _uid, limit: event.limit);

  @override
  Future<Either<Failure, Success<List<TripPlanEntity>>>> handleRefreshEvent(
          RefreshDisplayEvent event) async =>
      await _useCase.fetchTripPlans.call(uid: _uid, limit: event.limit);
}
