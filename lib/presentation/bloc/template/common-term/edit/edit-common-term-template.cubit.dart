import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:module/domain/entity/term.entity.dart';
import 'package:module/presentation/bloc/state.dart';
import 'package:module/shared/export.dart';

part 'edit-common-term-template.state.dart';

@injectable
class EditCommonTermTemplateCubit extends Cubit<EditCommonTermTemplateState> {
  EditCommonTermTemplateCubit(@factoryParam this._initValue)
      : super(EditCommonTermTemplateState(article: _initValue));

  final ArticleEntity _initValue;

  ArticleEntity get initValue => _initValue;

  void updateState({Status? status, String? message, ArticleEntity? article}) {
    emit(state.copyWith(status: status, message: message, article: article));
  }
}
