import '../constant/error_code.constant.dart';

abstract class _Response {
  const _Response();

  bool get ok;
}

class _Success<T> extends _Response {
  final T? data;

  const _Success({this.data});

  @override
  bool get ok => true;
}

class _Failure extends _Response {
  final ErrorCode? errorCode;
  final String? message;

  const _Failure({this.errorCode, this.message});

  _Failure copyWith({String? message, ErrorCode? errorCode}) => _Failure(
      message: message ?? this.message, errorCode: errorCode ?? this.errorCode);

  @override
  bool get ok => false;
}

/// response wrapper for data layer(repository)
class ApiSuccess<T> extends _Success<T> {
  ApiSuccess({super.data});
}

class ApiFailure extends _Failure {}

/// response wrapper for domain layer(useCase)
class SuccessResult<T> extends _Success<T> {
  SuccessResult({super.data});

  factory SuccessResult.from(ApiSuccess<T> apiResponse) =>
      SuccessResult<T>(data: apiResponse.data);
}

class FailureResult extends _Failure {
  const FailureResult({super.errorCode, super.message});

  factory FailureResult.from(ApiFailure apiResponse) => FailureResult(
      errorCode: apiResponse.errorCode, message: apiResponse.message);
}
