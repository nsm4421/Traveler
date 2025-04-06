part of 'abs_display.bloc.dart';

abstract class AbsDisplayEvent {}

class InitDisplayEvent extends AbsDisplayEvent {
  final Status? status;
  final String? errorMessage;

  InitDisplayEvent({this.status, this.errorMessage});
}

class MountDisplayEvent extends AbsDisplayEvent {
  final int limit;
  final bool reverse;

  MountDisplayEvent({this.limit = 20, this.reverse = false});
}

class RefreshDisplayEvent extends AbsDisplayEvent {
  final int limit;
  final bool reverse;

  RefreshDisplayEvent({this.limit = 20, this.reverse = false});
}

class FetchDisplayEvent extends AbsDisplayEvent {
  final int limit;
  final bool insertOnHead;
  final bool reverse;

  FetchDisplayEvent(
      {this.limit = 20, this.insertOnHead = false, this.reverse = false});
}
