import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:module/presentation/bloc/auth/authentication.bloc.dart';
import 'package:module/shared/shared.export.dart';

import '../../../widgets/loading_overlay.widget.dart';
import '../../../widgets/text_field.widget.dart';

part 's_sign_in.dart';

Page Function(BuildContext, GoRouterState) signInPageBuilder =
    (context, state) {
  const view = SignInScreen();
  return const NoTransitionPage(child: view);
};
