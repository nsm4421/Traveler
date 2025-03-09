import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:module/shared/shared.export.dart';

import '../../router/router_config.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(flex: 2),
            Text("Karma",
                style: context.textTheme.displayLarge
                    ?.copyWith(fontWeight: FontWeight.bold)),
            const Spacer(flex: 1),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text("로그인 하러가기"),
                const Spacer(),
                ElevatedButton(
                    onPressed: () => context.push(Routes.signIn.path),
                    child: Text("로그인", style: context.textTheme.labelMedium)),
              ],
            ),
            16.height,
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "아직 계정이 없다면?",
                  style: context.textTheme.labelMedium,
                ),
                const Spacer(),
                ElevatedButton(
                    onPressed: () => context.push(Routes.signUp.path),
                    child: const Text("회원가입")),
              ],
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
