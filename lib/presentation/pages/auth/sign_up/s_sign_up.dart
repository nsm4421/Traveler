import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:module/presentation/bloc/export.dart';
import 'package:module/shared/shared.export.dart';

import '../../../widgets/date_text_field.dart';
import '../../../widgets/loading_overlay.widget.dart';
import '../../../widgets/text_field.widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late GlobalKey<FormState> _formKey;
  String _email = '';
  String _password = '';
  String _passwordConfirm = '';
  String _username = '';
  String _description = '';
  late Sex _sex;

  late DateTime _bornAt;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>(debugLabel: 'sign-in-form-key');
    _sex = Sex.male;
    _bornAt = DateTime.now();
  }

  void _onEmailChange(String text) => setState(() {
        _email = text;
      });

  void _onPasswordChange(String text) => setState(() {
        _password = text;
      });

  void _onPasswordConfirmChange(String text) => setState(() {
        _passwordConfirm = text;
      });

  void _onUsernameChange(String text) => setState(() {
        _username = text;
      });

  void _onDescriptionChange(String text) => setState(() {
        _description = text;
      });

  void _onSexChange(Sex sex) => setState(() {
        _sex = sex;
      });

  void _onBornAtChange(DateTime bornAt) => setState(() {
        _bornAt = bornAt;
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

  String? _validatePasswordConfirm(String? text) {
    if (text == null || text.isEmpty) {
      return '비밀번호를 다시 입력해주세요';
    } else if (text != _password) {
      return '비밀번호가 일치하지 않습니다';
    }
    return null;
  }

  String? _validateUsername(String? text) {
    if (text == null || text.isEmpty) {
      return '유저명을 입력해주세요';
    }
    return null;
  }

  String? _validateDescription(String? text) {
    if (text == null || text.isEmpty) {
      return '자기소개글을 입력해주세요';
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
      context.read<AuthenticationBloc>().add(SignUpWithEmailAndPasswordEvent(
          email: _email.trim(),
          password: _password.trim(),
          username: _username.trim(),
          description: _description.trim(),
          sex: _sex,
          bornAt: _bornAt));
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
            if (context.mounted) {
              context
                  .read<AuthenticationBloc>()
                  .add(InitAuthenticationStateEvent(status: Status.initial));
            }
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
            appBar: AppBar(
              leading: IconButton(
                onPressed: _handlePop,
                icon: const Icon(Icons.clear),
                tooltip: 'Sign Up',
              ),
              title: Text("회원가입",
                  style: context.textTheme.titleLarge
                      ?.copyWith(fontWeight: FontWeight.bold)),
              actions: [
                IconButton(
                  onPressed: _handleSubmit,
                  icon: const Icon(Icons.add_box_outlined),
                )
              ],
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  children: [
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    const Icon(Icons.mail_outline),
                                    12.width,
                                    Text("이메일",
                                        style: context.textTheme.titleMedium
                                            ?.copyWith(
                                                fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                8.height,
                                CustomTextField(
                                    onChange: _onEmailChange,
                                    validator: _validateEmail,
                                    inputDecoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: "test@naver.com")),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    const Icon(Icons.key),
                                    12.width,
                                    Text("비밀번호",
                                        style: context.textTheme.titleMedium
                                            ?.copyWith(
                                                fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                8.height,
                                CustomTextField(
                                    onChange: _onPasswordChange,
                                    validator: _validatePassword,
                                    obsecureText: true,
                                    inputDecoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: "비밀번호를 입력해주세요",
                                    )),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    const Icon(Icons.key),
                                    12.width,
                                    Text("비밀번호 확인",
                                        style: context.textTheme.titleMedium
                                            ?.copyWith(
                                                fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                8.height,
                                CustomTextField(
                                    onChange: _onPasswordConfirmChange,
                                    validator: _validatePasswordConfirm,
                                    obsecureText: true,
                                    inputDecoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: "비밀번호를 다시 입력해주세요",
                                    )),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    const Icon(Icons.account_box_outlined),
                                    12.width,
                                    Text("유저명",
                                        style: context.textTheme.titleMedium
                                            ?.copyWith(
                                                fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                8.height,
                                CustomTextField(
                                    onChange: _onUsernameChange,
                                    validator: _validateUsername,
                                    inputDecoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: "유저명을 입력해주세요")),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    const Icon(Icons.abc),
                                    12.width,
                                    Text("자기소개",
                                        style: context.textTheme.titleMedium
                                            ?.copyWith(
                                                fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                8.height,
                                CustomTextField(
                                    onChange: _onDescriptionChange,
                                    validator: _validateDescription,
                                    minLines: 3,
                                    maxLines: 5,
                                    maxLength: 1000,
                                    inputDecoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: "자기소개를 입력해주세요",
                                    )),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: Row(
                              children: [
                                Row(
                                  children: [
                                    const Icon(Icons.people_alt_outlined),
                                    12.width,
                                    Text("성별",
                                        style: context.textTheme.titleMedium
                                            ?.copyWith(
                                                fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                const Spacer(),
                                ...Sex.values.map((item) {
                                  final selected = item == _sex;
                                  return Padding(
                                    padding: const EdgeInsets.only(left: 8),
                                    child: ElevatedButton(
                                        onPressed: () => _onSexChange(item),
                                        child: Row(
                                          children: [
                                            Icon(item.iconData,
                                                size: selected ? 24 : 20),
                                            8.width,
                                            Text(
                                              item.label,
                                              style: selected
                                                  ? context.textTheme.labelLarge
                                                      ?.copyWith(
                                                          fontWeight:
                                                              FontWeight.bold)
                                                  : context
                                                      .textTheme.labelMedium,
                                            )
                                          ],
                                        )),
                                  );
                                })
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Icon(Icons.date_range_rounded),
                                    12.width,
                                    Text("생년월일",
                                        style: context.textTheme.titleMedium
                                            ?.copyWith(
                                                fontWeight: FontWeight.bold)),
                                    const Spacer(),
                                    Text(
                                        '${_bornAt.year}-${_bornAt.month}-${_bornAt.day}')
                                  ],
                                ),
                                8.height,
                                DateInputTextField(onChange: _onBornAtChange),
                              ],
                            ),
                          ),
                          30.height
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
