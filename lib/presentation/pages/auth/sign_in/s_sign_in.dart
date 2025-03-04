import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:module/presentation/bloc/auth/sign_in/cubit.dart';

part 'f_form.dart';

part 'w_submit_button.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SignInFormFragment(),
            SubmitButtonWidget()
          ],
        ),
      ),
    );
  }
}
