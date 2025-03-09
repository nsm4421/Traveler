import 'package:flutter/material.dart';

import '../../../widgets/sign_out.widget.dart';

class DisplayTripScreen extends StatelessWidget {
  const DisplayTripScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Display Trip'),
      ),
      body: SignOutWidget(),
    );
  }
}
