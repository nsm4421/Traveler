import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:module/presentation/bloc/journey/create/cubit.dart';
import 'package:module/shared/shared.export.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

part 'f_select_date.dart';

part 'f_edit_content.dart';

part 'w_submit_button.dart';

class CreateJourneyScreen extends StatelessWidget {
  const CreateJourneyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CREATE JOURNEY"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SelectDateFragment(),
            EditContentFragment(),
            SubmitButton(),
          ],
        ),
      ),
    );
  }
}
