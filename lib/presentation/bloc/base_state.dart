import 'package:module/shared/shared.export.dart';

class BaseState {
  final Status status;
  final String errorMessage;

  BaseState({required this.status, required this.errorMessage});
}
