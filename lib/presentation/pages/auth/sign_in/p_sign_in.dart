import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:module/dependency_injection.dart';
import 'package:module/presentation/bloc/export.dart';
import 'package:module/shared/shared.export.dart';

import '../../../widgets/loading_overlay.widget.dart';
import '../../../widgets/text_field.widget.dart';

part 's_sign_in.dart';

Page Function(BuildContext, GoRouterState) signInPageBuilder =
    (context, state) {
  final view = BlocProvider(
      create: (_) => getIt<SignInCubit>(),
      child: BlocListener<SignInCubit, SignInState>(
        listener: (context, state) {
          if (state.status == Status.error) {
            Timer(1.durationInSec, () {
              context.showSnackBar(state.errorMessage,
                  duration: 2.durationInSec);
              context
                  .read<AuthenticationBloc>()
                  .add(InitAuthenticationStateEvent(status: Status.initial));
            });
          }
        },
        child: BlocBuilder<SignInCubit, SignInState>(builder: (context, state) {
          return LoadingOverLayWidget(
              isLoading: state.status == Status.loading ||
                  state.status == Status.error,
              loadingWidget: const Center(child: CircularProgressIndicator()),
              child: const SignInScreen());
        }),
      ));
  return NoTransitionPage(child: view);
};
