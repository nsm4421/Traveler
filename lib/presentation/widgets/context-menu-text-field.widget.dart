import 'dart:developer';
import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ContextMenuTextFieldWidget extends StatefulWidget {
  const ContextMenuTextFieldWidget({super.key});

  @override
  State<ContextMenuTextFieldWidget> createState() =>
      _ContextMenuTextFieldWidgetState();
}

class _ContextMenuTextFieldWidgetState
    extends State<ContextMenuTextFieldWidget> {
  late TextEditingController _textEditingController;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    _textEditingController.dispose();
    _focusNode.dispose();
  }

  _handlePonterDown(PointerDownEvent event) async {
    if (event.kind != PointerDeviceKind.mouse ||
        event.buttons != kSecondaryMouseButton) return;
    try {
      await BrowserContextMenu.disableContextMenu(); // 기본 우클릭 동작 방지
      final selection = _textEditingController.value.selection;

      final result = await showMenu<String>(
        context: context,
        position: RelativeRect.fromLTRB(
          event.position.dx,
          event.position.dy,
          event.position.dx,
          event.position.dy,
        ),
        items: [
          PopupMenuItem(value: 'paste', child: Text('Paste')),
        ],
      );
      if (result == null) return;
    } catch (error) {
      log(error.toString());
    } finally {
      await BrowserContextMenu.enableContextMenu(); // 기본 우클릭 동작 방지
    }
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: _handlePonterDown,
      child: TextField(
        controller: _textEditingController,
        focusNode: _focusNode,
        maxLines: null,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
