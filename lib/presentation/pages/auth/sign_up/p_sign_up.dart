import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:module/shared/shared.export.dart';
import 'package:module/presentation/bloc/export.dart';

import '../../../widgets/date_text_field.dart';
import '../../../widgets/loading_overlay.widget.dart';
import '../../../widgets/text_field.widget.dart';

part 's_sign_up.dart';

Page Function(BuildContext, GoRouterState) signUpPageBuilder =
    (context, state) {
  const view = SignUpScreen();
  return const NoTransitionPage(child: view);
};
