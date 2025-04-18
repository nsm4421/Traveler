part of 'sign_in.cubit.dart';

class SignInState extends BaseState {
  final String email;
  final String password;

  SignInState(
      {super.status, super.errorMessage, this.email = '', this.password = ''});

  @override
  SignInState copyWith(
      {Status? status, String? errorMessage, String? email, String? password}) {
    return SignInState(
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage,
        email: email ?? this.email,
        password: password ?? this.password);
  }
}
