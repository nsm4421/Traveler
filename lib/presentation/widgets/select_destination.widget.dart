import 'package:flutter/material.dart';
import 'package:module/shared/shared.export.dart';

class SelectDestinationWidget extends StatefulWidget {
  const SelectDestinationWidget({super.key});

  @override
  State<SelectDestinationWidget> createState() =>
      _SelectDestinationWidgetState();
}

class _SelectDestinationWidgetState extends State<SelectDestinationWidget> {
  bool _isCollapsed = false;

  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  dispose() {
    super.dispose();
    _controller.dispose();
  }

  _handleIsCollapsed() {
    setState(() {
      _isCollapsed = !_isCollapsed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleIsCollapsed,
      child: Card(
        elevation: 0,
        clipBehavior: Clip.antiAlias,
        child: AnimatedContainer(
          duration: 300.durationInMilli,
          curve: Curves.easeIn,
          height: _isCollapsed ? 60 : 300,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Where do you want to go?",
                style: context.textTheme.titleMedium?.copyWith(
                    color: context.colorScheme.primary,
                    fontWeight: FontWeight.bold),
              ),
              8.height,
              if (!_isCollapsed)
                TextFormField(
                  controller: _controller,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.flag), hintText: "Search Country"),
                )
            ],
          ),
        ),
      ),
    );
  }
}
