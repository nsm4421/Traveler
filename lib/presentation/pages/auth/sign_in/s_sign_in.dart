import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:module/presentation/bloc/auth/authentication.bloc.dart';
import 'package:module/shared/shared.export.dart';

import '../../../widgets/loading_overlay.widget.dart';
import '../../../widgets/text_field.widget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late GlobalKey<FormState> _formKey;
  String _email = '';
  String _password = '';

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>(debugLabel: 'sign-in-form-key');
  }

  void _onEmailChange(String text) => setState(() {
        _email = text;
      });

  void _onPasswordChange(String text) => setState(() {
        _password = text;
      });

  String? _validateEmail(String? text) {
    if (text == null || text.isEmpty) {
      return '이메일을 입력해주세요';
    }
    return null;
  }

  String? _validatePassword(String? text) {
    if (text == null || text.isEmpty) {
      return '비밀번호를 입력해주세요';
    }
    return null;
  }

  void _handleSubmit() {
    _formKey.currentState?.save();
    final ok = _formKey.currentState?.validate();
    if (ok != null &&
        ok &&
        context.read<AuthenticationBloc>().state.status.isReady) {
      FocusScope.of(context).unfocus();
      context.read<AuthenticationBloc>().add(SignInWithEmailAndPasswordEvent(
          email: _email.trim(), password: _password.trim()));
    }
  }

  void _handlePop() {
    context.read<AuthenticationBloc>().add(InitAuthenticationStateEvent(
        status: Status.initial, errorMessage: '', isAuth: false));
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state.status == Status.error) {
          Timer(1.durationInSec, () {
            context
                .read<AuthenticationBloc>()
                .add(InitAuthenticationStateEvent(status: Status.initial));
          });
        }
      },
      child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
        return LoadingOverLayWidget(
            isLoading:
                state.status == Status.loading || state.status == Status.error,
            loadingWidget: const Center(child: CircularProgressIndicator()),
            child: Scaffold(
              resizeToAvoidBottomInset: true,
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  children: [
                    const Spacer(flex: 1),
                    Row(
                      children: [
                        IconButton(
                          onPressed: _handlePop,
                          icon: const Icon(Icons.clear),
                          tooltip: 'Sign In',
                        ),
                        12.width,
                        Text("로그인",
                            style: context.textTheme.titleLarge
                                ?.copyWith(fontWeight: FontWeight.bold)),
                        const Spacer(),
                        IconButton(
                          onPressed: _handleSubmit,
                          icon: const Icon(Icons.login),
                        )
                      ],
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: CustomTextField(
                                onChange: _onEmailChange,
                                validator: _validateEmail,
                                inputDecoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    prefixIcon: Icon(Icons.email_outlined),
                                    hintText: "이메일 주소를 입력해주세요")),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: CustomTextField(
                                onChange: _onPasswordChange,
                                validator: _validatePassword,
                                obsecureText: true,
                                inputDecoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  prefixIcon: Icon(Icons.key),
                                  hintText: "비밀번호를 입력해주세요",
                                )),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(flex: 2),
                  ],
                ),
              ),
            ));
      }),
    );
  }
}
