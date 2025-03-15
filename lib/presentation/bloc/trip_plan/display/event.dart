part of 'bloc.dart';

final class DisplayTripPlanEvent {}

final class InitDisplayTripPlanEvent extends DisplayTripPlanEvent {
  final Status? status;
  final String? errorMessage;

  InitDisplayTripPlanEvent({this.status, this.errorMessage});
}

final class MountDisplayTripPlanEvent extends DisplayTripPlanEvent {
  final String? uid; // 검색할 유저 id
  final int limit;

  MountDisplayTripPlanEvent({this.uid, this.limit = 20});
}

final class RefreshDisplayTripPlanEvent extends DisplayTripPlanEvent {
  final int limit;

  RefreshDisplayTripPlanEvent({this.limit = 20});
}

final class FetchDisplayTripPlanEvent extends DisplayTripPlanEvent {
  final int limit;

  FetchDisplayTripPlanEvent({this.limit = 20});
}
