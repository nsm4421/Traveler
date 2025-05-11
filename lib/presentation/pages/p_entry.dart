import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:module/presentation/router/router_config.dart';

class EntryPage extends StatelessWidget {
  const EntryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("SOL2.0 기획안 데모"),
          ElevatedButton(
              onPressed: () {
                context.push(Routes.reprCoverage.path);
              },
              child: Text("대표담보 페이지")),
          ElevatedButton(
              onPressed: () {
                context.push(Routes.createReprCoverage.path);
              },
              child: Text("대표담보 생성페이지"))
        ],
      ),
    );
  }
}
