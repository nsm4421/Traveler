import 'package:either_dart/src/either.dart';
import 'package:injectable/injectable.dart';
import 'package:module/domain/entity/export.dart';
import 'package:module/domain/usecase/export.dart';
import 'package:module/presentation/bloc/export.dart';
import 'package:module/shared/shared.export.dart';

@lazySingleton
class DisplayReviewBloc extends AbsDisplayBloc<ReviewEntity> {
  final ReviewUseCase _useCase;

  DisplayReviewBloc(this._useCase);

  @override
  Future<Either<Failure, Success<List<ReviewEntity>>>> handleFetchEvent(
      FetchDisplayEvent event) async {
    return _useCase.fetchReview(limit: event.limit, cursor: cursor);
  }

  @override
  Future<Either<Failure, Success<List<ReviewEntity>>>> handleMountEvent(
      MountDisplayEvent event) {
    return _useCase.fetchReview(limit: event.limit);
  }

  @override
  Future<Either<Failure, Success<List<ReviewEntity>>>> handleRefreshEvent(
      RefreshDisplayEvent event) {
    return _useCase.fetchReview(limit: event.limit);
  }
}
