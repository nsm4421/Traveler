part of 'common-term-template.page.dart';

class CommonTermPreviewFragment extends StatelessWidget {
  const CommonTermPreviewFragment(this._section, {super.key});

  final SectionEntity _section;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 절 제목
        ConditionalWidgetBuilder<String>(
            data: _section.title,
            widgetBuilder: (title) {
              return Text(title, style: context.textTheme.titleLarge);
            }),
        if (_section.subsections.isNotEmpty)
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _section.subsections.length,
              itemBuilder: (context, index) {
                final subsection = _section.subsections[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 관 제목
                    Text(
                      subsection.title,
                      style: context.textTheme.titleMedium,
                    ),
                    if (subsection.articles.isNotEmpty)
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: subsection.articles.length,
                          itemBuilder: (context, index) {
                            final article = subsection.articles[index];
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // 조 제목
                                Text(
                                  article.title,
                                  style: context.textTheme.titleSmall,
                                ),
                                // 조 부제목
                                ConditionalWidgetBuilder<String>(
                                    data: article.content,
                                    widgetBuilder: (subtitle) {
                                      return Text(
                                        subtitle,
                                        style: context.textTheme.bodyMedium,
                                      );
                                    }),

                                if (article.paragraphs.isNotEmpty)
                                  ListView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: article.paragraphs.length,
                                      itemBuilder: (context, index) {
                                        final paragraph =
                                            article.paragraphs[index];
                                        return Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(paragraph.content),
                                            if (paragraph
                                                .subparagraphs.isNotEmpty)
                                              ListView.builder(
                                                  shrinkWrap: true,
                                                  physics:
                                                      const NeverScrollableScrollPhysics(),
                                                  itemCount: paragraph
                                                      .subparagraphs.length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    final subparagraph =
                                                        paragraph.subparagraphs[
                                                            index];
                                                    return Column(
                                                      children: [
                                                        Text(subparagraph
                                                            .content),
                                                        ListView.builder(
                                                            shrinkWrap: true,
                                                            physics:
                                                                const NeverScrollableScrollPhysics(),
                                                            itemCount:
                                                                subparagraph
                                                                    .items
                                                                    .length,
                                                            itemBuilder:
                                                                (context,
                                                                    index) {
                                                              final item =
                                                                  subparagraph
                                                                          .items[
                                                                      index];
                                                              return Text(
                                                                  item.content);
                                                            })
                                                      ],
                                                    );
                                                  })
                                          ],
                                        );
                                      })
                              ],
                            );
                          })
                  ],
                );
              })
      ],
    );
  }
}
