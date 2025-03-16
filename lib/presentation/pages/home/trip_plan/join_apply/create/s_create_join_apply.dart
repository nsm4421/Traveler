import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:module/presentation/bloc/export.dart';
import 'package:module/shared/shared.export.dart';

part 'f_form.dart';

part 'w_button.dart';

class CreateJoinApplyScreen extends StatelessWidget {
  const CreateJoinApplyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CreateJoinApplyFormFragment(),
          CreateJoinApplyWidget(),
        ],
      ),
    );
  }
}
