import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:module/presentation/router/router_config.dart';
import 'package:module/shared/export.dart';

part 'repr-coverage.screen.dart';
part 'navigate-to-create-page-modal.dart';

class ReprCoveragePage extends StatelessWidget {
  const ReprCoveragePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ReprCoverageScreen();
  }
}
