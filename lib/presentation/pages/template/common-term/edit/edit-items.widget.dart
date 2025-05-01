part of 'edit-common-term-article.page.dart';

/// 목(目)
class EditItemsWidget extends StatefulWidget {
  const EditItemsWidget(
      {super.key, required this.paragraphId, required this.subparagraph});

  final String paragraphId;
  final SubparagraphEntity subparagraph;

  @override
  State<EditItemsWidget> createState() => _EditItemsWidgetState();
}

class _EditItemsWidgetState extends State<EditItemsWidget> with DebounceMixin {
  late String _paragraphId; // 상위 항 id
  late String _subparagraphId; // 상위 호 id
  late List<ItemEntity> _items;
  late List<TextEditingController> _controllers;
  late List<FocusNode> _focusNodes;

  @override
  void initState() {
    super.initState();
    _paragraphId = widget.paragraphId;
    _subparagraphId = widget.subparagraph.id;
    _items = widget.subparagraph.items;
    _controllers = List.generate(_items.length,
        (index) => TextEditingController()..text = _items[index].content);
    _focusNodes = List.generate(_items.length,
        (index) => FocusNode()..addListener(_handleFocus(index)));
  }

  @override
  dispose() {
    super.dispose();
    _controllers.forEach((c) => c.dispose());
    _focusNodes.forEach((f) => f.dispose());
  }

  _updateBlocState() {
    final temp = context.read<EditCommonTermTemplateCubit>().state.article;
    context.read<EditCommonTermTemplateCubit>().updateState(
        article: temp.copyWith(
            paragraphs: temp.paragraphs
                .map((p) => p.id == _paragraphId
                    ? p.copyWith(
                        subparagraphs: p.subparagraphs
                            .map((s) => s.id == _subparagraphId
                                ? s.copyWith(items: _items)
                                : s)
                            .toList())
                    : p)
                .toList()));
  }

  _handleAddItem() async => await debounce(() async {
        setState(() {
          _items = [..._items, ItemEntity(content: '')];
          _controllers.add(TextEditingController());
          _focusNodes
              .add(FocusNode()..addListener(_handleFocus(_items.length - 1)));
        });
        _updateBlocState();
      });

  _handleDropItem(int index) => () async => await debounce(() async {
        setState(() {
          _items.removeAt(index);
          _controllers.removeAt(index);
          _focusNodes.removeAt(index);
        });
        _updateBlocState();
      });

  VoidCallback _handleFocus(int index) => () {
        setState(() {});
        if (_focusNodes[index].hasFocus) return;
        _items = _items
            .asMap()
            .entries
            .map((e) => e.key == index
                ? e.value.copyWith(content: _controllers[index].text.trim())
                : e.value)
            .toList();
      };

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditCommonTermTemplateCubit,
        EditCommonTermTemplateState>(builder: (context, state) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 목(目) 추가하기 버튼
          IconButton(
              tooltip: '목(目) 추가하기',
              onPressed: _handleAddItem,
              icon: Transform.rotate(
                angle: -math.pi,
                child: const Icon(Icons.turn_left),
              )),
          4.width,
          // 호(號) 목록
          Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: _items.length,
                  itemBuilder: (context, index) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: TextField(
                              controller: _controllers[index],
                              focusNode: _focusNodes[index],
                              style: context.textTheme.bodyMedium,
                              maxLines: null,
                              decoration: InputDecoration(
                                prefixText: '${index + 1}) ',
                                hintText: '목(目)를 입력해주세요',
                                hintStyle: context.textTheme.labelLarge
                                    ?.copyWith(
                                        color: Colors.grey.withAlpha(50)),
                                border: _focusNodes[index].hasFocus
                                    ? const OutlineInputBorder()
                                    : InputBorder.none,
                              )),
                        ),
                        4.width,
                        // 목(目) 삭제하기 버튼
                        IconButton(
                            onPressed: _handleDropItem(index),
                            icon: const Icon(Icons.delete_forever_outlined))
                      ],
                    );
                  })),
        ],
      );
    });
  }
}
