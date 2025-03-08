part of 'cubit.dart';

class SignUpState extends SignInState {
  final String passwordConfirm;
  final String username;
  final String description;
  final Sex sex;
  late final DateTime bornAt;

  SignUpState(
      {super.status,
      super.errorMessage,
      super.email,
      super.password,
      this.passwordConfirm = '',
      this.username = '',
      this.description = '',
      this.sex = Sex.male,
      required this.bornAt});

  @override
  SignUpState copyWith({
    Status? status,
    String? errorMessage,
    String? email,
    String? password,
    String? passwordConfirm,
    String? username,
    String? description,
    Sex? sex,
    DateTime? bornAt,
  }) {
    return SignUpState(
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage,
        email: email ?? this.email,
        password: password ?? this.password,
        passwordConfirm: passwordConfirm ?? this.passwordConfirm,
        username: username ?? this.username,
        description: description ?? this.description,
        sex: sex ?? this.sex,
        bornAt: bornAt ?? this.bornAt);
  }
}
