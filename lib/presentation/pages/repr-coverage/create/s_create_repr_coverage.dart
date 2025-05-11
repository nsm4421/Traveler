part of 'p_create_repr_coverage.dart';

class CreateRepresentCoverageScreen extends StatelessWidget {
  const CreateRepresentCoverageScreen(this._coverageType, {super.key});

  final CoverageType _coverageType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("대표담보 생성 페이지"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 담보분류
            SelectCoverageCateogryWidget(_coverageType),

            /// 담보명
            EditCoverageNameWidget(_coverageType),

            /// 세부보장
            // CoverateDetailWidget()
          ],
        ),
      ),
    );
  }
}
