part of 's_sign_in.dart';

class SignInFormFragment extends StatefulWidget {
  const SignInFormFragment({super.key});

  @override
  State<SignInFormFragment> createState() => _SignInFormFragmentState();
}

class _SignInFormFragmentState extends State<SignInFormFragment> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late FocusNode _emailFocus;
  late FocusNode _passwordFocus;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _emailFocus = FocusNode()..addListener(_handleEmailFocus);
    _passwordFocus = FocusNode()..addListener(_handlePasswordFocus);
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocus
      ..removeListener(_handleEmailFocus)
      ..dispose();
    _passwordFocus
      ..removeListener(_handlePasswordFocus)
      ..dispose();
    super.dispose();
  }

  _handleEmailFocus() {
    if (!_emailFocus.hasFocus) {
      context.read<SignInCubit>().update(email: _emailController.text.trim());
    }
  }

  _handlePasswordFocus() {
    if (!_passwordFocus.hasFocus) {
      context
          .read<SignInCubit>()
          .update(password: _passwordController.text.trim());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignInCubit>().formKey,
      child: Column(
        children: [
          TextField(
            controller: _emailController,
            focusNode: _emailFocus,
            decoration: InputDecoration(prefixIcon: Icon(Icons.email_outlined)),
          ),
          TextField(
            controller: _passwordController,
            focusNode: _passwordFocus,
            decoration:
                InputDecoration(prefixIcon: Icon(Icons.password_outlined)),
          )
        ],
      ),
    );
  }
}
