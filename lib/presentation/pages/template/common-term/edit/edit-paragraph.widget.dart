part of 'edit-common-term-article.page.dart';

/// 항(項)
class EditParagraphsWidget extends StatefulWidget {
  const EditParagraphsWidget({super.key});

  @override
  State<EditParagraphsWidget> createState() => _EditParagraphsWidgetState();
}

class _EditParagraphsWidgetState extends State<EditParagraphsWidget>
    with DebounceMixin {
  late List<ParagraphEntity> _paragraphs;
  late List<TextEditingController> _controllers;
  late List<FocusNode> _focusNodes;

  @override
  void initState() {
    super.initState();
    _paragraphs =
        context.read<EditCommonTermTemplateCubit>().state.article.paragraphs;
    _controllers = List.generate(_paragraphs.length,
        (index) => TextEditingController()..text = _paragraphs[index].content);
    _focusNodes = List.generate(_paragraphs.length,
        (index) => FocusNode()..addListener(_handleFocus(index)));
  }

  @override
  dispose() {
    super.dispose();
    _controllers.forEach((c) => c.dispose());
    _focusNodes.forEach((f) => f.dispose());
  }

  _updateBlocState() {
    context.read<EditCommonTermTemplateCubit>().updateState(
        article: context
            .read<EditCommonTermTemplateCubit>()
            .state
            .article
            .copyWith(paragraphs: _paragraphs));
  }

  _handleAddParagraph() async => await debounce(() async {
        setState(() {
          _paragraphs = [..._paragraphs, ParagraphEntity(content: '')];
          _controllers.add(TextEditingController());
          _focusNodes.add(
              FocusNode()..addListener(_handleFocus(_paragraphs.length - 1)));
        });
        _updateBlocState();
      });

  _handleDropParagraph(int index) => () async => await debounce(() async {
        setState(() {
          _paragraphs.removeAt(index);
          _controllers.removeAt(index);
          _focusNodes.removeAt(index);
        });
        _updateBlocState();
      });

  VoidCallback _handleFocus(int index) => () {
        setState(() {});
        if (_focusNodes[index].hasFocus) return;
        _paragraphs = _paragraphs
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
          // 항(項) 추가하기 버튼
          IconButton(
              tooltip: '항(項) 추가하기',
              onPressed: _handleAddParagraph,
              icon: Transform.rotate(
                angle: -math.pi,
                child: const Icon(Icons.turn_left),
              )),
          4.width,
          // 항(項) 목록
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: _paragraphs.length,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          // 항(項) 텍스트 필드
                          Expanded(
                            child: TextField(
                                controller: _controllers[index],
                                focusNode: _focusNodes[index],
                                style: context.textTheme.bodyMedium,
                                maxLines: null,
                                decoration: InputDecoration(
                                  prefixText: '[${index + 1}] ',
                                  hintText: '항(項)을 입력해주세요',
                                  hintStyle: context.textTheme.labelLarge
                                      ?.copyWith(
                                          color: Colors.grey.withAlpha(50)),
                                  border: _focusNodes[index].hasFocus
                                      ? const OutlineInputBorder()
                                      : InputBorder.none,
                                )),
                          ),

                          // 항(項) 삭제하기 버튼
                          IconButton(
                              tooltip: '항(項) 삭제하기',
                              onPressed: _handleDropParagraph(index),
                              icon: const Icon(
                                Icons.delete_forever_outlined,
                              ))
                        ],
                      ),
                      // 하위 호(號) 목록
                      EditSubParagraphsWidget(_paragraphs[index])
                    ],
                  );
                }),
          ),
        ],
      );
    });
  }
}
