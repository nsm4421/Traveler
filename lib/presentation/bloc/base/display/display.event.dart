part of 'abs_display.bloc.dart';

abstract class AbsDisplayEvent {}

class InitDisplayEvent extends AbsDisplayEvent {
  final Status? status;
  final String? errorMessage;

  InitDisplayEvent({this.status, this.errorMessage});
}

class MountDisplayEvent extends AbsDisplayEvent {
  final int limit;

  MountDisplayEvent({this.limit = 20});
}

class RefreshDisplayEvent extends AbsDisplayEvent {
  final int limit;

  RefreshDisplayEvent({this.limit = 20});
}

class FetchDisplayEvent extends AbsDisplayEvent {
  final int limit;

  FetchDisplayEvent({this.limit = 20});
}
