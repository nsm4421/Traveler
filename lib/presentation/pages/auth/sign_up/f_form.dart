part of 's_sign_up.dart';

class SignUpFormFragment extends StatefulWidget {
  const SignUpFormFragment({super.key});

  @override
  State<SignUpFormFragment> createState() => _SignUpFormFragmentState();
}

class _SignUpFormFragmentState extends State<SignUpFormFragment> {
  void _onEmailChange(String text) {
    context.read<SignUpCubit>().update(email: text);
  }

  void _onPasswordChange(String text) {
    context.read<SignUpCubit>().update(password: text);
  }

  void _onPasswordConfirmChange(String text) {
    context.read<SignUpCubit>().update(passwordConfirm: text);
  }

  void _onDescriptionChange(String text) {
    context.read<SignUpCubit>().update(description: text);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignUpCubit>().formKey,
      child: Column(
        children: [
          CustomTextField(
            onChange: _onEmailChange,
            inputDecoration: InputDecoration(
                labelText: "Email", prefixIcon: Icon(Icons.email_outlined)),
          ),
          CustomTextField(
            onChange: _onPasswordChange,
            inputDecoration: InputDecoration(
                labelText: "Password",
                prefixIcon: Icon(Icons.password_outlined)),
          ),
          CustomTextField(
            onChange: _onPasswordConfirmChange,
            inputDecoration: InputDecoration(
                labelText: "Password Confirm",
                prefixIcon: Icon(Icons.password_outlined)),
          ),
          CustomTextField(
            onChange: _onDescriptionChange,
            inputDecoration: InputDecoration(
                labelText: "Description", prefixIcon: Icon(Icons.abc)),
          ),
        ],
      ),
    );
  }
}
