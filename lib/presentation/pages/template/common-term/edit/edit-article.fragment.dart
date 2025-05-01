part of 'edit-common-term-article.page.dart';

class EditArticleFragment extends StatefulWidget {
  const EditArticleFragment({super.key});

  @override
  State<EditArticleFragment> createState() => _EditArticleFragmentState();
}

class _EditArticleFragmentState extends State<EditArticleFragment>
    with DebounceMixin {
  late TextEditingController _titleController;
  late TextEditingController _contentController;
  late FocusNode _contentFocusNode;
  late FocusNode _titleFocusNode;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController()
      ..text = context.read<EditCommonTermTemplateCubit>().state.article.title;
    _titleFocusNode = FocusNode()..addListener(_handleTitleFocus);
    _contentController = TextEditingController()
      ..text =
          context.read<EditCommonTermTemplateCubit>().state.article.content ??
              '';
    _contentFocusNode = FocusNode()..addListener(_handleContentFocus);
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _titleFocusNode
      ..removeListener(_handleTitleFocus)
      ..dispose();
    _contentController.dispose();
    _contentFocusNode
      ..removeListener(_handleContentFocus)
      ..dispose();
  }

  _handleTitleFocus() {
    if (!_titleFocusNode.hasFocus) {
      context.read<EditCommonTermTemplateCubit>().updateState(
          article: context
              .read<EditCommonTermTemplateCubit>()
              .state
              .article
              .copyWith(title: _titleController.text.trim()));
    }
    setState(() {});
  }

  _handleAddContent() async => await debounce(() async {
        context.read<EditCommonTermTemplateCubit>().updateState(
            article: context
                .read<EditCommonTermTemplateCubit>()
                .state
                .article
                .copyWithContent(''));
      });

  _handleContentFocus() {
    if (!_contentFocusNode.hasFocus) {
      final text = _contentController.text.trim();
      context.read<EditCommonTermTemplateCubit>().updateState(
          article: context
              .read<EditCommonTermTemplateCubit>()
              .state
              .article
              .copyWithContent(text.isNotEmpty ? text : null));
    }
    setState(() {});
  }

  _handleDropContent() async => await debounce(() async {
        _contentController.clear();
        context.read<EditCommonTermTemplateCubit>().updateState(
            article: context
                .read<EditCommonTermTemplateCubit>()
                .state
                .article
                .copyWithContent(null));
      });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditCommonTermTemplateCubit,
        EditCommonTermTemplateState>(builder: (context, state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// 조(條)
          Row(
            children: [
              // 조 제목 텍스트 필드
              Expanded(
                child: TextField(
                    controller: _titleController,
                    focusNode: _titleFocusNode,
                    style: context.textTheme.bodyLarge
                        ?.copyWith(fontWeight: FontWeight.w700),
                    maxLines: null,
                    decoration: InputDecoration(
                        hintText: '조(條) 제목을 입력해주세요',
                        hintStyle: context.textTheme.labelLarge
                            ?.copyWith(color: Colors.grey.withAlpha(50)),
                        border: _titleFocusNode.hasFocus
                            ? const OutlineInputBorder()
                            : InputBorder.none,
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child: (state.article.content == null)
                              ? IconButton(
                                  tooltip: '조(條) 본문 추가하기',
                                  onPressed: _handleAddContent,
                                  icon: const Icon(Icons.add_circle_outline))
                              : null,
                        ))),
              ),
            ],
          ),

          if (state.article.content != null)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      // 조 본문 텍스트필드
                      Expanded(
                        child: TextField(
                          controller: _contentController,
                          focusNode: _contentFocusNode,
                          style: context.textTheme.bodyMedium,
                          maxLines: null,
                          decoration: InputDecoration(
                              hintText: '조(條) 본문을 입력해주세요',
                              hintStyle: context.textTheme.labelLarge
                                  ?.copyWith(color: Colors.grey.withAlpha(50)),
                              border: _contentFocusNode.hasFocus
                                  ? const OutlineInputBorder()
                                  : InputBorder.none),
                        ),
                      ),

                      4.width,
                      IconButton(
                          tooltip: '조(條) 본문 삭제하기',
                          onPressed: _handleDropContent,
                          // 조 본문 삭제 버튼
                          icon: const Icon(Icons.delete_forever_outlined))
                    ],
                  ),
                ),
              ],
            ),

          /// 항(項)
          const Padding(
            padding: EdgeInsets.only(left: 4),
            child: EditParagraphsWidget(),
          ),
        ],
      );
    });
  }
}
