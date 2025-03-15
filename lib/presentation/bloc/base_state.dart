import 'package:module/shared/shared.export.dart';

class BaseState {
  final Status status;
  final String errorMessage;

  BaseState({this.status = Status.initial, this.errorMessage = ''});
}

class DisplayState<T> extends BaseState {
  late final List<T> data;
  late final bool isEnd;

  DisplayState({super.status, super.errorMessage, List<T>? data, bool? isEnd}) {
    this.data = data ?? [];
    this.isEnd = isEnd ?? false;
  }

  DisplayState<T> copyWith(
      {Status? status, String? errorMessage, List<T>? data, bool? isEnd}) {
    return DisplayState(
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage,
        data: data ?? this.data,
        isEnd: this.isEnd);
  }
}
