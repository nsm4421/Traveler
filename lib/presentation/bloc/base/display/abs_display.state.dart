part of 'abs_display.bloc.dart';

class AbsDisplayState<T extends BaseEntity> extends BaseState {
  late final List<T> data;
  late final bool isEnd;

  AbsDisplayState(
      {super.status, super.errorMessage, List<T>? data, bool? isEnd}) {
    this.data = data ?? [];
    this.isEnd = isEnd ?? false;
  }

  @override
  AbsDisplayState<T> copyWith(
      {Status? status, String? errorMessage, List<T>? data, bool? isEnd}) {
    return AbsDisplayState(
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage,
        data: data ?? this.data,
        isEnd: this.isEnd);
  }
}
