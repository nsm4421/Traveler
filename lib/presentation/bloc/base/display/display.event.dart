part of 'display.bloc.dart';

class DisplayEvent {}

class InitDisplayEvent extends DisplayEvent {
  final Status? status;
  final String? errorMessage;

  InitDisplayEvent({this.status, this.errorMessage});
}

class MountDisplayEvent extends DisplayEvent {
  final int limit;

  MountDisplayEvent({this.limit = 20});
}

class RefreshDisplayEvent extends DisplayEvent {
  final int limit;

  RefreshDisplayEvent({this.limit = 20});
}

class FetchDisplayEvent extends DisplayEvent {
  final int limit;

  FetchDisplayEvent({this.limit = 20});
}
