import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:module/presentation/router/router_config.dart';
import 'package:module/shared/export.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Not Found Page"),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("Go Back To Index Page"),
          6.height,
          ElevatedButton(
              onPressed: () {
                context.push(Routes.entry.path);
              },
              child: const Icon(Icons.home_outlined))
        ],
      ),
    );
  }
}
