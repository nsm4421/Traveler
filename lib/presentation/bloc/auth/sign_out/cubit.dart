import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:module/domain/usecase/auth/usecase.dart';
import 'package:module/shared/shared.export.dart';

@injectable
class SignOutCubit extends Cubit<Status> {
  SignOutCubit(this._useCase) : super(Status.initial);

  final AuthUseCase _useCase;

  Future<void> signOut() async {
    await _useCase.signOut();
  }
}
