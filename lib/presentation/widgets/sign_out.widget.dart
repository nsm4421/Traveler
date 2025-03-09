import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:module/shared/shared.export.dart';

import '../bloc/auth/bloc.dart';

enum SignOutButtonType {
  icon;
}

class SignOutWidget extends StatelessWidget {
  const SignOutWidget({super.key, this.type});

  final SignOutButtonType? type;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () async {
          context.read<AuthenticationBloc>().add(SignOutEvent());
        },
        child: switch (type) {
          SignOutButtonType.icon => const Icon(Icons.logout),
          (_) => Text(
              "Sign Out",
              style: context.textTheme.titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            )
        });
  }
}
