part of 'display.bloc.dart';

class DisplayState<T extends BaseEntity> extends BaseState {
  late final List<T> data;
  late final bool isEnd;

  DisplayState({super.status, super.errorMessage, List<T>? data, bool? isEnd}) {
    this.data = data ?? [];
    this.isEnd = isEnd ?? false;
  }

  @override
  DisplayState<T> copyWith(
      {Status? status, String? errorMessage, List<T>? data, bool? isEnd}) {
    return DisplayState(
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage,
        data: data ?? this.data,
        isEnd: this.isEnd);
  }
}
