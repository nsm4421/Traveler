part of 'edit-common-term-article.page.dart';

/// 호(號)
class EditSubParagraphsWidget extends StatefulWidget {
  const EditSubParagraphsWidget(this._$paragraph, {super.key});

  final ParagraphEntity _$paragraph;

  @override
  State<EditSubParagraphsWidget> createState() =>
      _EditSubParagraphsWidgetState();
}

class _EditSubParagraphsWidgetState extends State<EditSubParagraphsWidget>
    with DebounceMixin {
  late String _paragraphId; // 상위 항 id
  late List<SubparagraphEntity> _subparagaphs;
  late List<TextEditingController> _controllers;
  late List<FocusNode> _focusNodes;

  @override
  void initState() {
    super.initState();
    _paragraphId = widget._$paragraph.id;
    _subparagaphs = widget._$paragraph.subparagraphs;
    _controllers = List.generate(
        _subparagaphs.length,
        (index) =>
            TextEditingController()..text = _subparagaphs[index].content);
    _focusNodes = List.generate(_subparagaphs.length,
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
                    ? p.copyWith(subparagraphs: _subparagaphs)
                    : p)
                .toList()));
  }

  _handleAddSubpragraph() async => await debounce(() async {
        setState(() {
          _subparagaphs = [..._subparagaphs, SubparagraphEntity(content: '')];
          _controllers.add(TextEditingController());
          _focusNodes.add(
              FocusNode()..addListener(_handleFocus(_subparagaphs.length - 1)));
        });
        _updateBlocState();
      });

  _handleDropSubParagraph(int index) => () async => await debounce(() async {
        setState(() {
          _subparagaphs.removeAt(index);
          _controllers.removeAt(index);
          _focusNodes.removeAt(index);
        });
        _updateBlocState();
      });

  VoidCallback _handleFocus(int index) => () {
        setState(() {});
        if (_focusNodes[index].hasFocus) return;
        _subparagaphs = _subparagaphs
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
          // 호(號) 추가하기 버튼
          IconButton(
              tooltip: '호(號) 추가하기',
              onPressed: _handleAddSubpragraph,
              icon: Transform.rotate(
                angle: -math.pi,
                child: const Icon(Icons.turn_left),
              )),
          4.width,
          // 호(號) 목록
          Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: _subparagaphs.length,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                  controller: _controllers[index],
                                  focusNode: _focusNodes[index],
                                  style: context.textTheme.bodyMedium,
                                  maxLines: null,
                                  decoration: InputDecoration(
                                    prefixText: '(${index + 1}) ',
                                    hintText: '호(號)를 입력해주세요',
                                    hintStyle: context.textTheme.labelLarge
                                        ?.copyWith(
                                            color: Colors.grey.withAlpha(50)),
                                    border: _focusNodes[index].hasFocus
                                        ? const OutlineInputBorder()
                                        : InputBorder.none,
                                  )),
                            ),
                            // 호(號) 삭제하기 버튼
                            IconButton(
                                tooltip: '호(號) 삭제하기',
                                onPressed: _handleDropSubParagraph(index),
                                icon: const Icon(Icons.delete_forever_outlined))
                          ],
                        ),
                        // 하위 목(目) 목록
                        EditItemsWidget(
                          paragraphId: _paragraphId,
                          subparagraph: _subparagaphs[index],
                        )
                      ],
                    );
                  })),
        ],
      );
    });
  }
}
