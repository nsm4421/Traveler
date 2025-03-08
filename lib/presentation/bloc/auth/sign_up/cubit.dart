import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:module/domain/usecase/export.dart';
import 'package:module/shared/shared.export.dart';

import '../sign_in/cubit.dart';

part 'state.dart';

@injectable
class SignUpCubit extends Cubit<SignUpState> with LoggerMixIn {
  late GlobalKey<FormState> _formKey;
  final AuthUseCase _useCase;

  SignUpCubit(this._useCase) : super(SignUpState(bornAt: DateTime.now())) {
    _formKey = GlobalKey<FormState>(debugLabel: 'sign-up-form-key');
  }

  GlobalKey<FormState> get formKey => _formKey;

  void update(
      {Status? status,
      String? errorMessage,
      String? email,
      String? password,
      String? passwordConfirm,
      String? username,
      String? description,
      Sex? sex,
      DateTime? bornAt}) {
    emit(state.copyWith(
        status: status,
        errorMessage: errorMessage,
        email: email,
        password: password,
        passwordConfirm: passwordConfirm,
        username: username,
        description: description,
        sex: sex,
        bornAt: bornAt));
  }

  Future<void> submit() async {
    try {
      _formKey.currentState?.save();
      final ok = _formKey.currentState?.validate();
      if (ok == null || !ok) {
        logger.e([LogTags.bloc, 'sign up fails due to insufficient info']);
        return;
      }
      logger.t('sign up request');
      emit(state.copyWith(status: Status.loading));
      await _useCase
          .signUp(
              email: 'test1@naver.com',
              password: 'nsm*951221',
              username: 'test1',
              description: 'description test',
              // email: state.email,
              // password: state.password,
              // username: state.username,
              // description: state.description,
              sex: state.sex,
              bornAt: state.bornAt)
          .then((res) => res.fold((l) {
                logger.e([LogTags.bloc, l.message]);
                emit(state.copyWith(
                    status: Status.error, errorMessage: l.message));
              }, (r) {
                logger.d([LogTags.bloc, 'success']);
                emit(state.copyWith(status: Status.success, errorMessage: ''));
              }));
    } catch (error) {
      emit(state.copyWith(status: Status.error, errorMessage: 'error occurs'));
    }
  }
}
