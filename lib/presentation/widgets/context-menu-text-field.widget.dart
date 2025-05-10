import 'dart:developer';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// 텍스트를 지정한 상태에서 오른쪽 마우스를 클릭한 경우
class ContextMenuWithDraggedText<T> {
  final String label;
  final T value;
  final Future<void> Function(String draggedText) onSelect;

  ContextMenuWithDraggedText(
      {required this.label, required this.value, required this.onSelect});
}

// 텍스트를 지정하지 않은 상태에서 오른쪽 마우스를 클릭한 경우
class ContextMenuWithoutDraggedText<T> {
  final String label;
  final T value;
  final Future<void> Function() onSelect;

  ContextMenuWithoutDraggedText(
      {required this.label, required this.value, required this.onSelect});
}

class ContextMenuTextFieldWidget<T> extends StatefulWidget {
  const ContextMenuTextFieldWidget(
      {super.key,
      this.menusWithDraggedText,
      this.menusWithoutDraggedText,
      this.onError,
      this.maxLine,
      this.inputDecoration});

  final List<ContextMenuWithDraggedText<T>>? menusWithDraggedText;
  final List<ContextMenuWithoutDraggedText<T>>? menusWithoutDraggedText;
  final VoidCallback? onError;
  final int? maxLine;
  final InputDecoration? inputDecoration;

  @override
  State<ContextMenuTextFieldWidget> createState() =>
      _ContextMenuTextFieldWidgetState();
}

class _ContextMenuTextFieldWidgetState<T>
    extends State<ContextMenuTextFieldWidget> {
  late TextEditingController _controller;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    assert(!(((widget.menusWithDraggedText == null)) &&
        (widget.menusWithoutDraggedText == null)));
    _controller = TextEditingController();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _focusNode.dispose();
  }

  // 오른쪽 마우스 클릭시 이벤트
  _handlePonterDown(PointerDownEvent event) async {
    if (event.kind != PointerDeviceKind.mouse ||
        event.buttons != kSecondaryMouseButton) return; // 오른쪽 마우스 클릭 이벤트만 수신
    try {
      await BrowserContextMenu.disableContextMenu(); // 기본 우클릭 동작 방지
      final dragged = _controller.value.selection; // 드래그된 영역
      dragged.start == dragged.end
          ? await _handleOnSelectWithoutDragedText(event)
          : await _handleOnSelectWithDragedText(event,
              draggedText:
                  _controller.text.substring(dragged.start, dragged.end));
    } catch (error) {
      // 에러처리를 하지 않은 경우 단순히 log찍기
      (widget.onError ??
          () {
            log(error.toString());
          })();
    } finally {
      await BrowserContextMenu.enableContextMenu(); // 기본 우클릭 동작 원복시키기
    }
  }

  // 텍스트를 드래그 후, 오른쪽 마우스를 클릭해 메뉴를 선택한 경우
  _handleOnSelectWithDragedText(PointerDownEvent event,
      {required String draggedText}) async {
    if (widget.menusWithDraggedText == null) return;
    final selected = await showMenu<T>(
        context: context,
        position: RelativeRect.fromLTRB(
          event.position.dx,
          event.position.dy,
          event.position.dx,
          event.position.dy,
        ),
        items: widget.menusWithDraggedText!
            .map((m) => PopupMenuItem<T>(value: m.value, child: Text(m.value)))
            .toList());
    if (selected == null) return;
    await widget.menusWithDraggedText!
        .firstWhere((m) => m.value == selected)
        .onSelect(draggedText);
  }

  // 텍스트를 드래그 없이, 오른쪽 마우스를 클릭해 메뉴를 선택한 경우
  _handleOnSelectWithoutDragedText(PointerDownEvent event) async {
    if (widget.menusWithoutDraggedText == null) return;
    final selected = await showMenu<T>(
        context: context,
        position: RelativeRect.fromLTRB(
          event.position.dx,
          event.position.dy,
          event.position.dx,
          event.position.dy,
        ),
        items: widget.menusWithoutDraggedText!
            .map((m) => PopupMenuItem<T>(value: m.value, child: Text(m.value)))
            .toList());
    if (selected == null) return;
    await widget.menusWithoutDraggedText!
        .firstWhere((m) => m.value == selected)
        .onSelect();
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: _handlePonterDown,
      child: TextField(
        controller: _controller,
        focusNode: _focusNode,
        maxLines: widget.maxLine,
        decoration: widget.inputDecoration ??
            const InputDecoration(border: OutlineInputBorder()),
      ),
    );
  }
}
