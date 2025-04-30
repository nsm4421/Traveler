import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:module/dependency_injection.dart';
import 'package:module/domain/entity/term.entity.dart';
import 'package:module/presentation/bloc/template/common-term/edit/edit-common-term-template.cubit.dart';
import 'package:module/shared/export.dart';

part 'edit-common-term-article.screen.dart';
part 'article-body.widget.dart';
part 'original-article.fragment.dart';
part 'edit-article.fragment.dart';

class EditCommonTermArticlePage extends StatelessWidget {
  const EditCommonTermArticlePage(this._article, {super.key});

  final ArticleEntity _article;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<EditCommonTermTemplateCubit>(param1: _article),
      child: EditCommonTermArticleScreen(),
    );
  }
}
