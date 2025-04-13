import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:module/domain/usecase/export.dart';
import 'package:module/shared/shared.export.dart';

import '../../base/base_state.dart';

part 'sign_up.state.dart';

@injectable
class SignUpCubit extends Cubit<SignUpState> with LoggerMixIn {
  final AuthUseCase _useCase;
  late final GlobalKey<FormState> _formKey;

  GlobalKey<FormState> get formKey => _formKey;

  SignUpCubit(this._useCase) : super(SignUpState()) {
    _formKey = GlobalKey<FormState>(debugLabel: 'sign-up-form-key');
  }

  void update({
    Status? status,
    String? errorMessage,
    String? email,
    String? password,
    String? passwordConfirm,
    String? username,
    String? description,
    Sex? sex,
    DateTime? bornAt,
  }) {
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

  void selectProfileImage(File file) {
    emit(state.copyWithProfileImage(file));
  }

  void unSelectProfileImage() {
    emit(state.copyWithProfileImage(null));
  }

  Future<void> submit() async {
    if (!_ok) {
      return;
    }
    try {
      emit(state.copyWith(status: Status.loading));
      await _useCase
          .signUp(
            username: state.username,
            email: state.email,
            description: state.description,
            sex: state.sex,
            bornAt: state.bornAt,
            password: state.password,
            profileImage: state.profileImage!,
          )
          .then((res) => res.fold(
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
    } else if (state.profileImage == null) {
      return false;
    }
    return true;
  }
}
