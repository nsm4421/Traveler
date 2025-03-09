import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../router/router_config.dart';
import '../../widgets/sign_out.widget.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Auth Screen")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  context.push(Routes.signUp.path);
                },
                child: Text("Sign Up")),
            ElevatedButton(
                onPressed: () {
                  context.push(Routes.signIn.path);
                },
                child: Text("Sign In")),
          ],
        ),
      ),
    );
  }
}
