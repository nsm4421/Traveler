import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:module/presentation/widgets/date_picker.widget.dart';

import '../../widgets/select_destination.widget.dart';

class ApplyScreen extends StatelessWidget {
  const ApplyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
      child: Scaffold(
        body: SingleChildScrollView(
          child: SelectDestinationWidget(),
        ),
      ),
    );
  }
}
