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
    // TODO
  }
}
