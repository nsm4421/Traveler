import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../routers/router_config.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const IndexScreen();
  }
}

class IndexScreen extends StatelessWidget {
  const IndexScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            DrawerHeader(
              child: Text(
                'Drawer 예시 UI ',
              ),
            ),
            Column(
              children: [
                Text("구상중..."),
              ],
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text(
          'SOL2.0 디자인 시안페이지',
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 24),
          Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: 'SOL2.0은 ',
                        style: Theme.of(context).textTheme.bodyMedium),
                    TextSpan(
                        text: '☆한개의 모델링☆',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold)),
                    TextSpan(
                      text: '으로 별지, 약관, 산방, PV가 나오게 하는 것이 목표임\n\n',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    TextSpan(
                      text: '기존에 없던 ',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    TextSpan(
                        text: '☆통합상품코드, 대표담보코드☆',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold)),
                    TextSpan(
                        text: ' 같은 개념들을 도입할 예정\n\n',
                        style: Theme.of(context).textTheme.bodyMedium),
                    TextSpan(
                        text: 'UI기획 초안 관련 내용 설명을 위해 만든 페이지',
                        style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Column(
            children: [
              Card(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Row(
                    children: [
                      const Text("대표담보 조회페이지"),
                      const Spacer(),
                      IconButton(
                          tooltip: "Let't go",
                          onPressed: () {
                            context.push(Routes.reprCoverages.path);
                          },
                          icon: const Icon(Icons.arrow_right_alt))
                    ],
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Row(
                    children: [
                      const Text("상품모델링페이지"),
                      const Spacer(),
                      IconButton(
                          tooltip: "Let't go",
                          onPressed: () {
                            context.push(Routes.productModeing.path);
                          },
                          icon: Icon(Icons.arrow_right_alt))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
