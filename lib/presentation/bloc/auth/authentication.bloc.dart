import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:module/domain/entity/export.dart';
import 'package:module/domain/usecase/export.dart';
import 'package:module/shared/shared.export.dart';

import '../base/base_state.dart';

part 'authentication.state.dart';

part 'authentication.event.dart';

@lazySingleton
class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState>
    with LoggerMixIn {
  final AuthUseCase _useCase;

  late Stream<UserEntity?> _authStream;

  Stream<UserEntity?> get authStream => _authStream;

  UserEntity? get currentUser => _useCase.currentUser;

  String? get currentUid => _useCase.currentUid;

  AuthenticationBloc(this._useCase) : super(AuthenticationState()) {
    on<InitialSessionEvent>(_onInitialSession);
    on<InitAuthenticationStateEvent>(_onInitAuthState);
    on<SignInWithEmailAndPasswordEvent>(_onSignInWithEmailAndPassword);
    on<SignUpWithEmailAndPasswordEvent>(_onSignUpWithEmailAndPassword);
    on<SignOutEvent>(_onSignOut);
    _authStream = _useCase.authStream;
  }

  Future<void> _onInitialSession(
      InitialSessionEvent event, Emitter<AuthenticationState> emit) async {}

  Future<void> _onInitAuthState(InitAuthenticationStateEvent event,
      Emitter<AuthenticationState> emit) async {
    emit(state.copyWith(
        status: event.status,
        errorMessage: event.errorMessage,
        isAuth: event.isAuth));
  }

  Future<void> _onSignInWithEmailAndPassword(
      SignInWithEmailAndPasswordEvent event,
      Emitter<AuthenticationState> emit) async {
    try {
      emit(state.copyWith(status: Status.loading));
      await _useCase.signIn
          .call(email: event.email, password: event.password)
          .then((res) => res.fold((l) {
                logger.d([LogTags.bloc, l.message]);
                emit(state.copyWith(
                    status: Status.error, errorMessage: l.message));
              }, (r) {
                logger.t([LogTags.bloc, 'sign in success']);
                emit(state.copyWith(status: Status.success, errorMessage: ''));
              }));
    } catch (error) {
      logger.e([LogTags.bloc, error]);
      emit(state.copyWith(status: Status.error, errorMessage: 'Sign In Fails'));
    }
  }

  Future<void> _onSignUpWithEmailAndPassword(
      SignUpWithEmailAndPasswordEvent event,
      Emitter<AuthenticationState> emit) async {
    try {
      emit(state.copyWith(status: Status.loading));
      await _useCase.signUp
          .call(
            email: event.email,
            password: event.password,
            username: event.username,
            description: event.description,
            sex: event.sex,
            bornAt: event.bornAt,
          )
          .then((res) => res.fold((l) {
                logger.e([LogTags.bloc, l.message]);
                emit(state.copyWith(
                    status: Status.error, errorMessage: l.message));
              }, (r) {
                logger.t([LogTags.bloc, 'sign up success']);
                emit(state.copyWith(status: Status.success, errorMessage: ''));
              }));
    } catch (error) {
      logger.e([LogTags.bloc, error]);
      emit(state.copyWith(status: Status.error, errorMessage: 'Sign In Fails'));
    }
  }

  Future<void> _onSignOut(
      SignOutEvent event, Emitter<AuthenticationState> emit) async {
    try {
      emit(state.copyWith(status: Status.loading));
      await _useCase.signOut.call().then((res) => res.fold((l) {
            logger.e([LogTags.bloc, l.message]);
            emit(state.copyWith(status: Status.error, errorMessage: l.message));
          }, (r) {
            logger.t([LogTags.bloc, 'sign out success']);
            emit(state.copyWith(status: Status.initial, errorMessage: ''));
          }));
    } catch (error) {
      logger.e(error);
      emit(
          state.copyWith(status: Status.error, errorMessage: 'Sign Out Fails'));
    }
  }
}
