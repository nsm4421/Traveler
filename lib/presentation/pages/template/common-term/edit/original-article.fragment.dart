part of 'edit-common-term-article.page.dart';

class OriginalArticleFragment extends StatelessWidget {
  const OriginalArticleFragment({super.key});

  @override
  Widget build(BuildContext context) {
    final article = context.read<EditCommonTermTemplateCubit>().state.article;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 조 제목
        Text(article.title,
            style: context.textTheme.bodyLarge
                ?.copyWith(fontWeight: FontWeight.w700)),
        if (article.content.isNotEmpty)
          // 조 본문
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Text(article.content, style: context.textTheme.bodyMedium),
          ),
        if (article.paragraphs.isNotEmpty)
          // 항 list
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: article.paragraphs.length,
                itemBuilder: (context, index) {
                  final paragraph = article.paragraphs[index];
                  return Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(paragraph.content,
                            style: context.textTheme.bodyMedium), // 항 item
                        if (paragraph.subparagraphs.isNotEmpty)
                          // 호 list
                          Padding(
                            padding: const EdgeInsets.only(top: 12),
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: paragraph.subparagraphs.length,
                              itemBuilder: (context, index) {
                                final subparagraph =
                                    paragraph.subparagraphs[index];
                                return Padding(
                                  padding: const EdgeInsets.only(top: 12),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(subparagraph.content,
                                          style: context
                                              .textTheme.bodyMedium), // 호 item
                                      if (subparagraph.items.isNotEmpty)
                                        // 목 list
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 12),
                                          child: ListView.builder(
                                            shrinkWrap: true,
                                            itemCount:
                                                subparagraph.items.length,
                                            itemBuilder: (context, index) {
                                              final item =
                                                  subparagraph.items[index];
                                              return Text(item.content,
                                                  style: context.textTheme
                                                      .bodyMedium); // 목 item
                                            },
                                          ),
                                        )
                                    ],
                                  ),
                                );
                              },
                            ),
                          )
                      ],
                    ),
                  );
                }),
          )
      ],
    );
  }
}
