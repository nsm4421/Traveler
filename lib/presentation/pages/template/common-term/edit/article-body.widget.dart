part of 'edit-common-term-article.page.dart';

/// 조(條) 제목
class EditArticleTitleWidget extends StatefulWidget {
  const EditArticleTitleWidget({super.key});

  @override
  State<EditArticleTitleWidget> createState() => _EditArticleTitleWidgetState();
}

class _EditArticleTitleWidgetState extends State<EditArticleTitleWidget>
    with DebounceMixin {
  late TextEditingController _controller;
  late FocusNode _focusNode;
  late bool _isBorderVisible;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController()
      ..text = context.read<EditCommonTermTemplateCubit>().state.article.title;
    _focusNode = FocusNode()..addListener(_handleFocus);
    _isBorderVisible = false;
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _focusNode
      ..removeListener(_handleFocus)
      ..dispose();
  }

  _handleFocus() {
    setState(() {
      _isBorderVisible = _focusNode.hasFocus;
    });
    if (!_focusNode.hasFocus) {
      context.read<EditCommonTermTemplateCubit>().updateState(
          article: context
              .read<EditCommonTermTemplateCubit>()
              .state
              .article
              .copyWith(title: _controller.text.trim()));
    }
  }

  _handleAddContent() async => await debounce(() async {
        final temp = context.read<EditCommonTermTemplateCubit>().state.article;
        context
            .read<EditCommonTermTemplateCubit>()
            .updateState(article: temp.copyWith(content: '조(條) 본문'));
      });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditCommonTermTemplateCubit,
        EditCommonTermTemplateState>(builder: (context, state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "조(條)",
                style: context.textTheme.labelLarge,
              ),
              const Spacer(),
              if (state.article.content.isEmpty)
                IconButton(
                    tooltip: '조(條) 본문 추가하기',
                    onPressed: _handleAddContent,
                    icon: const Icon(Icons.add_circle_outline))
            ],
          ),
          TextField(
              controller: _controller,
              focusNode: _focusNode,
              style: context.textTheme.bodyLarge
                  ?.copyWith(fontWeight: FontWeight.w700),
              maxLines: null,
              decoration: InputDecoration(
                hintText: '조(條) 제목을 입력해주세요',
                hintStyle: context.textTheme.labelLarge
                    ?.copyWith(color: Colors.grey.withAlpha(50)),
                border: _isBorderVisible
                    ? const OutlineInputBorder()
                    : InputBorder.none,
              )),
        ],
      );
    });
  }
}

/// 조(條) 본문
class EditArticleContentWidget extends StatefulWidget {
  const EditArticleContentWidget({super.key});

  @override
  State<EditArticleContentWidget> createState() =>
      _EditArticleContentWidgetState();
}

class _EditArticleContentWidgetState extends State<EditArticleContentWidget>
    with DebounceMixin {
  late TextEditingController _controller;
  late FocusNode _focusNode;
  late bool _isBorderVisible;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController()
      ..text =
          context.read<EditCommonTermTemplateCubit>().state.article.content;
    _focusNode = FocusNode()..addListener(_handleFocus);
    _isBorderVisible = false;
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _focusNode
      ..removeListener(_handleFocus)
      ..dispose();
  }

  _handleFocus() {
    setState(() {
      _isBorderVisible = _focusNode.hasFocus;
    });
    if (!_focusNode.hasFocus) {
      context.read<EditCommonTermTemplateCubit>().updateState(
          article: context
              .read<EditCommonTermTemplateCubit>()
              .state
              .article
              .copyWith(content: _controller.text.trim()));
    }
  }

  _handleDrop() async => await debounce(() async {
        context.read<EditCommonTermTemplateCubit>().updateState(
            article: context
                .read<EditCommonTermTemplateCubit>()
                .state
                .article
                .copyWith(content: ''));
      });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditCommonTermTemplateCubit,
        EditCommonTermTemplateState>(builder: (context, state) {
      return TextField(
          controller: _controller,
          focusNode: _focusNode,
          style: context.textTheme.bodyMedium,
          maxLines: null,
          decoration: InputDecoration(
              hintText: '조(條) 본문을 입력해주세요',
              hintStyle: context.textTheme.labelLarge
                  ?.copyWith(color: Colors.grey.withAlpha(50)),
              border: _isBorderVisible
                  ? const OutlineInputBorder()
                  : InputBorder.none,
              suffixIcon: IconButton(
                  tooltip: '조(條) 본문 삭제하기',
                  onPressed: _handleDrop,
                  icon: const Icon(Icons.delete_forever_outlined))));
    });
  }
}

/// 항(項)
class EditParagraphsWidget extends StatefulWidget {
  const EditParagraphsWidget({super.key});

  @override
  State<EditParagraphsWidget> createState() => _EditParagraphsWidgetState();
}

class _EditParagraphsWidgetState extends State<EditParagraphsWidget>
    with DebounceMixin {
  late List<TextEditingController> _controllers;
  late List<FocusNode> _focusNodes;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(
        context
            .read<EditCommonTermTemplateCubit>()
            .state
            .article
            .paragraphs
            .length,
        (index) => TextEditingController()
          ..text = context
              .read<EditCommonTermTemplateCubit>()
              .state
              .article
              .paragraphs[index]
              .content);
    _focusNodes = List.generate(
        context
            .read<EditCommonTermTemplateCubit>()
            .state
            .article
            .paragraphs
            .length,
        (index) => FocusNode()..addListener(_handleFocus(index)));
  }

  @override
  void dispose() {
    super.dispose();
    _controllers.forEach((c) => c.dispose());
    _focusNodes.forEach((f) => f.dispose());
  }

  VoidCallback _handleFocus(int index) => () {
        if (!_focusNodes[index].hasFocus) {
          final temp =
              context.read<EditCommonTermTemplateCubit>().state.article;
          final paragrpahs = temp.paragraphs
              .asMap()
              .entries
              .map((e) => e.key == index
                  ? e.value.copyWith(content: _controllers[index].text.trim())
                  : e.value)
              .toList();
          paragrpahs.removeWhere(
              (p) => p.content.isEmpty && p.subparagraphs.isNotEmpty);
          context
              .read<EditCommonTermTemplateCubit>()
              .updateState(article: temp.copyWith(paragraphs: paragrpahs));
        }
        setState(() {});
      };

  _handleAddParagraph() async => await debounce(() async {
        final temp = context.read<EditCommonTermTemplateCubit>().state.article;
        context.read<EditCommonTermTemplateCubit>().updateState(
                article: temp.copyWith(paragraphs: [
              ...temp.paragraphs,
              ParagraphEntity(content: '항(項)')
            ]));
      });
  _handleAddSubParagraph(int index) => () async => await debounce(() async {
        final temp = context.read<EditCommonTermTemplateCubit>().state.article;
        final paragraphs = temp.paragraphs
            .asMap()
            .entries
            .map((e) => e.key == index
                ? e.value.copyWith(
                    subparagraphs: [SubparagraphEntity(content: '호(號) 본문')])
                : e.value)
            .toList();
        context
            .read<EditCommonTermTemplateCubit>()
            .updateState(article: temp.copyWith(paragraphs: paragraphs));
      });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditCommonTermTemplateCubit,
        EditCommonTermTemplateState>(builder: (context, state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "항(項)",
                style: context.textTheme.labelLarge,
              ),
              const Spacer(),
              if (state.article.paragraphs.isEmpty)
                IconButton(
                    tooltip: '항(項) 추가하기',
                    onPressed: _handleAddParagraph,
                    icon: const Icon(Icons.add_circle_outline))
            ],
          ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: state.article.paragraphs.length,
              itemBuilder: (context, index) {
                final paragraph = state.article.paragraphs[index];
                return Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "${index + 1}항(項)",
                          style: context.textTheme.labelLarge,
                        ),
                        const Spacer(),
                        if (paragraph.subparagraphs.isEmpty)
                          IconButton(
                              tooltip: '호(號) 추가하기',
                              onPressed: _handleAddSubParagraph(index),
                              icon: const Icon(Icons.add_circle_outline))
                      ],
                    ),
                    TextField(
                        controller: _controllers[index],
                        focusNode: _focusNodes[index],
                        style: context.textTheme.bodyMedium,
                        maxLines: null,
                        decoration: InputDecoration(
                          hintText: '항(項)을 입력해주세요',
                          hintStyle: context.textTheme.labelLarge
                              ?.copyWith(color: Colors.grey.withAlpha(50)),
                          border: _focusNodes[index].hasFocus
                              ? const OutlineInputBorder()
                              : InputBorder.none,
                        )),
                    // if (paragraph.subparagraphs.isNotEmpty)
                    //   SubparagraphsWidget(paragraph.subparagraphs)
                  ],
                );
              }),
        ],
      );
    });
  }
}

class SubparagraphsWidget extends StatefulWidget {
  const SubparagraphsWidget(this._subparagraphs, {super.key});

  final List<SubparagraphEntity> _subparagraphs;

  @override
  State<SubparagraphsWidget> createState() => _SubparagraphsWidgetState();
}

class _SubparagraphsWidgetState extends State<SubparagraphsWidget> {
  late List<SubparagraphEntity> _subparagraphs;
  late List<TextEditingController> _controllers;

  @override
  void initState() {
    super.initState();
    _subparagraphs = widget._subparagraphs;
    _controllers = List.generate(
        _subparagraphs.length,
        (index) =>
            TextEditingController()..text = _subparagraphs[index].content);
  }

  @override
  void dispose() {
    super.dispose();
    _controllers.forEach((c) => c.dispose());
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: _subparagraphs.length,
        itemBuilder: (context, index) {
          final subparagraph = _subparagraphs[index];
          return Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      subparagraph.content,
                      style: context.textTheme.bodySmall,
                    ),
                  ),
                  12.width,
                  Expanded(
                    flex: 1,
                    child: TextField(
                      controller: _controllers[index],
                      decoration: InputDecoration(
                          prefixText: '${index + 1}.',
                          border: const OutlineInputBorder()),
                      style: context.textTheme.bodySmall,
                    ),
                  ),
                ],
              ),
              if (subparagraph.items.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: ItemsWidget(subparagraph.items),
                ),
            ],
          );
        });
  }
}

class ItemsWidget extends StatefulWidget {
  const ItemsWidget(this._items, {super.key});

  final List<ItemEntity> _items;

  @override
  State<ItemsWidget> createState() => _ItemsWidgetState();
}

class _ItemsWidgetState extends State<ItemsWidget> {
  late List<ItemEntity> _items;
  late List<TextEditingController> _controllers;

  @override
  void initState() {
    super.initState();
    _items = widget._items;
    _controllers = List.generate(_items.length,
        (index) => TextEditingController()..text = _items[index].content);
  }

  @override
  void dispose() {
    super.dispose();
    _controllers.forEach((c) => c.dispose());
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: _items.length,
        itemBuilder: (context, index) => Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        _items[index].content,
                        style: context.textTheme.bodyMedium,
                      ),
                    ),
                    12.width,
                    Expanded(
                      flex: 1,
                      child: TextField(
                        controller: _controllers[index],
                        decoration: InputDecoration(
                            prefixText: '${index + 1})',
                            border: const OutlineInputBorder()),
                        style: context.textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
              ],
            ));
  }
}
