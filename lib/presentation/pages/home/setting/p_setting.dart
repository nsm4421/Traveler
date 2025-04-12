import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:module/domain/entity/export.dart';
import 'package:module/presentation/bloc/export.dart';
import 'package:module/presentation/widgets/sign_out.widget.dart';
import 'package:module/shared/shared.export.dart';

import '../../../router/router_config.dart';
import '../../../widgets/conditional.widget.dart';

part 's_setting.dart';

part 'w_profile.dart';

Page Function(BuildContext, GoRouterState) settingPageBuilder =
    (context, state) {
  return const NoTransitionPage(child: SettingScreen());
};
