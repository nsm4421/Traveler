import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:module/domain/entity/term.entity.dart';
import 'package:module/presentation/router/router_config.dart';
import 'package:module/presentation/widgets/conditional_widget_builder.widget.dart';
import 'package:module/shared/extension/build_context.extension.dart';
part 'common-term-template.screen.dart';
part 'common-term-preview.fragment.dart';

final mockData = SectionEntity(subsections: [
  SubSectionEntity(title: '제1관 목적 및 용어의 정의', articles: [
    ArticleEntity(
        title: '제1조(목적)',
        content:
            '이 보험계약(이하「계약」이라 합니다)은 보험계약자(이하「계약자」라 합니다)와 보험회사(이하「회사」라 합니다) 사이에 피보험자의 상해에 대한 위험을 보장하기 위하여 체결됩니다'),
    ArticleEntity(
        title: '제2조(용어의 정의)',
        content: '이 계약에서 사용되는 용어의 정의는, 이 계약의 다른 조항에서 달리 정의되지 않는 한 다음과 같습니다.',
        paragraphs: [
          ParagraphEntity(content: '계약 관련 용어', subparagraphs: [
            SubparagraphEntity(
                content: '계약자:회사와 계약을 체결하고 보험료를 납입할 의무를 지는 사람을 말합니다.')
          ])
        ]),
  ])
]);

class CommonTermTemplatePage extends StatelessWidget {
  const CommonTermTemplatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: CommonTermTemplateScreen());
  }
}
