import 'package:module/shared/shared.export.dart';

abstract class BaseState {
  final Status status;
  final String errorMessage;

  BaseState({this.status = Status.initial, this.errorMessage = ''});

  BaseState copyWith({Status? status, String? errorMessage});
}
