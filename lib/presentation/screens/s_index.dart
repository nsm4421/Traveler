import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../routers/router_config.dart';

class IndexScreen extends StatelessWidget {
  const IndexScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'SOL2.0 디자인 시안페이지',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  context.push(Routes.reprCoverages.path);
                },
                child: const Text("대표담보 조회페이지")),
            const SizedBox(height: 16),
            ElevatedButton(
                onPressed: () {
                  context.push(Routes.createReprCoverages.path);
                },
                child: const Text("대표담보 생성페이지")),
          ],
        ),
      ),
    );
  }
}
