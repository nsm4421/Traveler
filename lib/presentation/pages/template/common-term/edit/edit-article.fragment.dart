part of 'edit-common-term-article.page.dart';

class EditArticleFragment extends StatelessWidget {
  const EditArticleFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditCommonTermTemplateCubit,
        EditCommonTermTemplateState>(builder: (context, state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 조(條) 제목
          const EditArticleTitleWidget(),
          // 조(條) 본문
          if (state.article.content.isNotEmpty)
            const EditArticleContentWidget(),

          /// 항(項)
          if (state.article.paragraphs.isNotEmpty) const EditParagraphsWidget(),
        ],
      );
    });
  }
}
