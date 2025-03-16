import 'package:module/shared/shared.export.dart';

class BaseState {
  final Status status;
  final String errorMessage;

  BaseState({this.status = Status.initial, this.errorMessage = ''});
}

