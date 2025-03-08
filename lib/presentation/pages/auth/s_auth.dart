import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../router/router_config.dart';
import '../../widgets/sign_out.widget.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: GestureDetector(
              onTap: () {
                context.push(Routes.apply.path);
              },
              child: Text("Auth Screen"))),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SignOutWidget(),
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
            ElevatedButton(
                onPressed: () {
                  context.push(Routes.journey.path);
                },
                child: Text("Journey")),
            ElevatedButton(
                onPressed: () {
                  context.push(Routes.createJourney.path);
                },
                child: Text("Create Journey")),
            ElevatedButton(
                onPressed: () {
                  context.push(Routes.apply.path);
                },
                child: Text("Apply")),
            ElevatedButton(
                onPressed: () {
                  context.push(Routes.createApply.path);
                },
                child: Text("Create Apply")),
          ],
        ),
      ),
    );
  }
}
