import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:module/domain/usecase/export.dart';
import 'package:module/shared/shared.export.dart';

import '../../base/base_state.dart';

part 'sign_in.state.dart';

@injectable
class SignInCubit extends Cubit<SignInState> with LoggerMixIn {
  final AuthUseCase _useCase;
  late final GlobalKey<FormState> _formKey;

  GlobalKey<FormState> get formKey => _formKey;

  SignInCubit(this._useCase) : super(SignInState()) {
    _formKey = GlobalKey<FormState>(debugLabel: 'sign-in-form-key');
  }

  void update({String? email, String? password}){
    emit(state.copyWith(email: email, password: password));
  }

  Future<void> submit() async {
    if (!_ok) {
      return;
    }
    try {
      emit(state.copyWith(status: Status.loading));
      await _useCase.signIn(email: state.email, password: state.password).then(
          (res) => res.fold(
              (l) => emit(state.copyWith(
                  status: Status.error, errorMessage: l.message)),
              (r) => emit(state.copyWith(status: Status.success))));
    } catch (error) {
      logger.e(error);
    }
  }

  bool get _ok {
    _formKey.currentState?.save();
    final ok = _formKey.currentState?.validate();
    if (ok == null || !ok) {
      return false;
    }
    return true;
  }
}
