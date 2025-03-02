import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../router/router_config.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("여행 앱 만들기")),
      body: SingleChildScrollView(
        child: Column(
          children: [TextFormField()],
        ),
      ),
    );
  }
}
