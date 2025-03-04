import '../constant/error_code.constant.dart';

abstract class _Response {
  const _Response();

  bool get ok;
}

class Success<T> extends _Response {
  final T? data;
  final String? message;

  const Success({this.data, this.message});

  @override
  bool get ok => true;
}

class Failure extends _Response {
  final ErrorCode? errorCode;
  final String? message;

  const Failure({this.errorCode, this.message});

  Failure copyWith({String? message, ErrorCode? errorCode}) => Failure(
      message: message ?? this.message, errorCode: errorCode ?? this.errorCode);

  @override
  bool get ok => false;
}
