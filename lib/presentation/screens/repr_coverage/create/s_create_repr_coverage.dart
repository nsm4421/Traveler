part of 'p_create_repr_coverage.dart';

class CreateReprCoverageScreen extends StatelessWidget {
  const CreateReprCoverageScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("대표담보 생성 페이지"),
      ),
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: SelectReprCoverageCateoryWidget(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: EditReprCoverageNameWidget(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: DefineGuranteeFragment(),
            ),
          ],
        ),
      ),
    );
  }
}
