part of 'authentication.bloc.dart';

final class AuthenticationEvent {}

final class InitialSessionEvent extends AuthenticationEvent {}

final class InitAuthenticationStateEvent extends AuthenticationEvent {
  final Status? status;
  final String? errorMessage;
  final bool? isAuth;

  InitAuthenticationStateEvent({this.status, this.errorMessage, this.isAuth});
}

final class SignOutEvent extends AuthenticationEvent {}

final class EditProfileEvent extends AuthenticationEvent {
  final String? description;
  final Sex? sex;
  final DateTime? bornAt;
  final File? profileImage;

  EditProfileEvent(
      {this.description, this.sex, this.bornAt, this.profileImage});
}
