part of 'authentication.bloc.dart';

final class AuthenticationState extends BaseState {
  final bool isAuth;

  AuthenticationState(
      {super.status = Status.initial,
      super.errorMessage = '',
      this.isAuth = false});

  @override
  AuthenticationState copyWith(
      {Status? status, String? errorMessage, bool? isAuth}) {
    return AuthenticationState(
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage,
        isAuth: isAuth ?? this.isAuth);
  }
}
