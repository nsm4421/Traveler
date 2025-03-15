import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../router/router_config.dart';

class MyTripScreen extends StatelessWidget {
  const MyTripScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Trip"),
        actions: [
          IconButton(
              onPressed: () {
                context.push(Routes.createTrip.path);
              },
              icon: Icon(Icons.add_box_outlined))
        ],
      ),
    );
  }
}
