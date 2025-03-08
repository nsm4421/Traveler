import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:module/domain/usecase/export.dart';
import 'package:module/shared/shared.export.dart';

import '../../base_state.dart';

part 'state.dart';

@injectable
class SignInCubit extends Cubit<SignInState> with LoggerMixIn {
  late GlobalKey<FormState> _formKey;
  final AuthUseCase _useCase;

  SignInCubit(this._useCase) : super(SignInState()) {
    _formKey = GlobalKey<FormState>(debugLabel: 'sign-up-form-key');
  }

  GlobalKey<FormState> get formKey => _formKey;

  void update({String? email, String? password}) {
    emit(state.copyWith(email: email, password: password));
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
          .signIn(
        email: 'test1@naver.com',
        password: 'nsm*951221',
        // email: state.email,
        // password: state.password,
        // username: state.username,
        // description: state.description
      )
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
