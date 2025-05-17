import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:karma/domain/entities/entities.export.dart';
import 'package:karma/presentation/routers/router_config.dart';
import 'package:karma/shared/shared.export.dart';

part 'w_repr_coverage_item.dart';

final _mockData = [
  ReprCoverageEntity(
    code: 'I00001',
    name: '상해사망',
    category: CoverageCategory.injure,
  ),
  ReprCoverageEntity(
    code: 'I00002',
    name: '상해후유장해',
    category: CoverageCategory.injure,
  ),
  ReprCoverageEntity(
    code: 'D00003',
    name: '질병사망',
    category: CoverageCategory.disease,
  ),
  ReprCoverageEntity(
    code: 'D00004',
    name: '질병후유장해',
    category: CoverageCategory.disease,
  ),
  ReprCoverageEntity(
    code: 'A00004',
    name: '수술비1-5종',
    category: CoverageCategory.injureAndDisease,
  ),
];

class ReprCoverageScreen extends StatelessWidget {
  const ReprCoverageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("대표담보 조회 페이지"),
        actions: [
          IconButton(
              tooltip: '대표담보 생성하기',
              onPressed: () {
                context.push(Routes.createReprCoverages.path);
              },
              icon: const Icon(Icons.add_circle_outline_outlined))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
                itemCount: _mockData.length,
                itemBuilder: (context, index) =>
                    ReprCoverageItemWidget(_mockData[index]),
                separatorBuilder: (context, index) => const Padding(
                      padding: EdgeInsets.only(bottom: 8),
                      child: Divider(
                        indent: 16,
                        endIndent: 16,
                      ),
                    )),
          )
        ],
      ),
    );
  }
}
