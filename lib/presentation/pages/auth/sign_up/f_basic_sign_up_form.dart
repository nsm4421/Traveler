part of 'p_sign_up.dart';

class BasicSignUpFormFragment extends StatefulWidget {
  const BasicSignUpFormFragment({super.key});

  @override
  State<BasicSignUpFormFragment> createState() =>
      _BasicSignUpFormFragmentState();
}

class _BasicSignUpFormFragmentState extends State<BasicSignUpFormFragment> {
  bool _isPasswordVisible = false;
  bool _isPasswordConfirmVisible = false;

  String? _validateUsername(String? text) {
    if (text == null || text.isEmpty) {
      return '유저명을 입력해주세요';
    }
    return null;
  }

  String? _validateEmail(String? text) {
    if (text == null || text.isEmpty) {
      return '이메일을 입력해주세요';
    }
    return null;
  }

  String? _validatePassword(String? text) {
    if (text == null || text.isEmpty) {
      return '비밀번호를 입력해주세요';
    }
    return null;
  }

  String? _validatePasswordConfirm(String? text) {
    if (text == null || text.isEmpty) {
      return '비밀번호를 다시 입력해주세요';
    } else if (text != context.read<SignUpCubit>().state.password) {
      return '비밀번호가 일치하지 않습니다';
    }
    return null;
  }

  String? _validateDescription(String? text) {
    if (text == null || text.isEmpty) {
      return '자기소개글을 입력해주세요';
    }
    return null;
  }

  _updateEmail(text) {
    context.read<SignUpCubit>().update(email: text);
  }

  _updateUsername(text) {
    context.read<SignUpCubit>().update(username: text);
  }

  _updatePassword(text) {
    context.read<SignUpCubit>().update(password: text);
  }

  _updatePasswordConfirm(text) {
    context.read<SignUpCubit>().update(passwordConfirm: text);
  }

  _updateDescription(text) {
    context.read<SignUpCubit>().update(description: text);
  }

  _switchPasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  _switchPasswordConfirmVisibility() {
    setState(() {
      _isPasswordConfirmVisible = !_isPasswordConfirmVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignUpCubit>().formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// 이메일
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Column(
              children: [
                Row(
                  children: [
                    const Icon(Icons.mail_outline),
                    12.width,
                    Text("이메일",
                        style: context.textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold)),
                  ],
                ),
                8.height,
                CustomTextField(
                    initText: context.read<SignUpCubit>().state.email,
                    onFocusLeave: _updateEmail,
                    validator: _validateEmail,
                    inputDecoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "test@naver.com")),
              ],
            ),
          ),

          /// 비밀번호
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Column(
              children: [
                Row(
                  children: [
                    const Icon(Icons.key),
                    12.width,
                    Text("비밀번호",
                        style: context.textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold)),
                  ],
                ),
                8.height,
                CustomTextField(
                    initText: context.read<SignUpCubit>().state.password,
                    onFocusLeave: _updatePassword,
                    validator: _validatePassword,
                    obsecureText: !_isPasswordVisible,
                    inputDecoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: "비밀번호를 입력해주세요",
                        suffixIcon: IconButton(
                            onPressed: _switchPasswordVisibility,
                            icon: _isPasswordVisible
                                ? const Icon(Icons.visibility_off_outlined)
                                : const Icon(Icons.visibility)))),
              ],
            ),
          ),

          /// 비밀번호 확인
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Column(
              children: [
                Row(
                  children: [
                    const Icon(Icons.key),
                    12.width,
                    Text("비밀번호 확인",
                        style: context.textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold)),
                  ],
                ),
                8.height,
                CustomTextField(
                    initText: context.read<SignUpCubit>().state.passwordConfirm,
                    onFocusLeave: _updatePasswordConfirm,
                    validator: _validatePasswordConfirm,
                    obsecureText: !_isPasswordConfirmVisible,
                    inputDecoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: "비밀번호를 다시 입력해주세요",
                        suffixIcon: IconButton(
                            onPressed: _switchPasswordConfirmVisibility,
                            icon: _isPasswordConfirmVisible
                                ? const Icon(Icons.visibility_off_outlined)
                                : const Icon(Icons.visibility)))),
              ],
            ),
          ),

          /// 유저명
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Column(
              children: [
                Row(
                  children: [
                    const Icon(Icons.account_box_outlined),
                    12.width,
                    Text("유저명",
                        style: context.textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold)),
                  ],
                ),
                8.height,
                CustomTextField(
                    initText: context.read<SignUpCubit>().state.username,
                    onFocusLeave: _updateUsername,
                    validator: _validateUsername,
                    inputDecoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: "유저명을 입력해주세요")),
              ],
            ),
          ),

          /// 자기소개
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Column(
              children: [
                Row(
                  children: [
                    const Icon(Icons.abc),
                    12.width,
                    Text("자기소개",
                        style: context.textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold)),
                  ],
                ),
                8.height,
                CustomTextField(
                    initText: context.read<SignUpCubit>().state.description,
                    onFocusLeave: _updateDescription,
                    validator: _validateDescription,
                    minLines: 3,
                    maxLines: 5,
                    maxLength: 1000,
                    inputDecoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "자기소개를 입력해주세요",
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
