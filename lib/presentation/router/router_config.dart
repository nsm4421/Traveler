import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:module/domain/entity/term.entity.dart';
import 'package:module/presentation/pages/template/common-term/common-term-template.page.dart';
import 'package:module/presentation/pages/template/common-term/edit/edit-common-term-article.page.dart';
part 'routes.dart';

@lazySingleton
class CustomRouter {
  late final GlobalKey<NavigatorState> _rootNavigatorKey;

  CustomRouter() {
    _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
  }

  @lazySingleton
  GoRouter get routerConfig => GoRouter(
        initialLocation: Routes.displayCommonTermTemplate.path,
        navigatorKey: _rootNavigatorKey,
        routes: [
          GoRoute(
              path: Routes.displayCommonTermTemplate.path,
              builder: (_, __) => CommonTermTemplatePage()),
          GoRoute(
              path: Routes.editCommonTermTemplate.path,
              builder: (_, state) {
                try {
                  return EditCommonTermArticlePage(
                      state.extra as ArticleEntity);
                } catch (error) {
                  log(error.toString());
                  return Text("NOT FOUND");
                }
              }),
        ],
      );
}
