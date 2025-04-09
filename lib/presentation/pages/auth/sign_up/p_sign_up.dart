import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:module/dependency_injection.dart';

import 'package:module/shared/shared.export.dart';
import 'package:module/presentation/bloc/export.dart';

import '../../../widgets/date_text_field.dart';
import '../../../widgets/loading_overlay.widget.dart';
import '../../../widgets/text_field.widget.dart';

import 'package:image_picker/image_picker.dart';

part 's_sign_up.dart';

part 'f_basic_sign_up_form.dart';

part 'w_select_born_at.dart';

part 'w_select_profile_image.dart';

Page Function(BuildContext, GoRouterState) signUpPageBuilder =
    (context, state) {
  final view = BlocProvider(
      create: (_) => getIt<SignUpCubit>(), child: const SignUpScreen());
  return NoTransitionPage(child: view);
};
