import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../router/router_config.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: GestureDetector(
              onTap: () {
                context.push(Routes.apply.path);
              },
              child: Text("여행 앱 만들기"))),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  context.push(Routes.journey.path);
                },
                child: Text("Journey")),
            ElevatedButton(
                onPressed: () {
                  context.push(Routes.createJourney.path);
                },
                child: Text("Create Journey")),
            ElevatedButton(
                onPressed: () {
                  context.push(Routes.apply.path);
                },
                child: Text("Apply")),
            ElevatedButton(
                onPressed: () {
                  context.push(Routes.createApply.path);
                },
                child: Text("Create Apply")),
          ],
        ),
      ),
    );
  }
}
