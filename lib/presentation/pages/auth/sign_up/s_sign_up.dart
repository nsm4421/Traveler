import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/auth/sign_up/cubit.dart';
import '../../../widgets/text_field.widget.dart';

part 'f_form.dart';
part 'w_submit_button.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SignUpFormFragment(),
            SubmitButtonWidget()
          ],
        ),
      ),
    );
  }
}
