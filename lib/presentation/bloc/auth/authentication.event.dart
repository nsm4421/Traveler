part of 'authentication.bloc.dart';

final class AuthenticationEvent {}

final class InitialSessionEvent extends AuthenticationEvent {}

final class InitAuthenticationStateEvent extends AuthenticationEvent {
  final Status? status;
  final String? errorMessage;
  final bool? isAuth;

  InitAuthenticationStateEvent({this.status, this.errorMessage, this.isAuth});
}

final class SignInWithEmailAndPasswordEvent extends AuthenticationEvent {
  final String email;
  final String password;

  SignInWithEmailAndPasswordEvent(
      {required this.email, required this.password});
}

final class SignUpWithEmailAndPasswordEvent
    extends SignInWithEmailAndPasswordEvent {
  final String username;
  final String description;
  final Sex sex;
  final DateTime bornAt;

  SignUpWithEmailAndPasswordEvent({
    required super.email,
    required super.password,
    required this.username,
    required this.description,
    required this.sex,
    required this.bornAt,
  });
}

final class SignOutEvent extends AuthenticationEvent {}
