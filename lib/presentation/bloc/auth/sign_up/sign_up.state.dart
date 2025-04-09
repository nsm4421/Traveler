part of 'sign_up.cubit.dart';

class SignUpState extends BaseState {
  final String email;
  final String password;
  final String passwordConfirm;
  final String username;
  final String description;
  final Sex sex;
  late final DateTime bornAt;
  final File? profileImage;

  SignUpState(
      {super.status,
      super.errorMessage,
      this.email = '',
      this.password = '',
      this.passwordConfirm = '',
      this.username = '',
      this.description = '',
      this.sex = Sex.male,
      DateTime? bornAt,
      this.profileImage}) {
    this.bornAt = bornAt ?? DateTime.now();
  }

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
        bornAt: bornAt ?? this.bornAt,
        profileImage: this.profileImage);
  }

  SignUpState copyWithProfileImage(File? profileImage) {
    return SignUpState(
        status: status,
        errorMessage: errorMessage,
        email: email,
        password: password,
        passwordConfirm: passwordConfirm,
        username: username,
        description: description,
        sex: sex,
        bornAt: bornAt,
        profileImage: profileImage);
  }
}
