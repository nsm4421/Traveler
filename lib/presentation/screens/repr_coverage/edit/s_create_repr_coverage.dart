part of 'p_edit_repr_coverage.dart';

class EditReprCoverageScreen extends StatelessWidget {
  const EditReprCoverageScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.read<EditReprCoverageCubit>().initValue == null
            ? "대표담보 생성 페이지"
            : "대표담보 수정 페이지"),
        actions: [
          IconButton(
              onPressed: () {
                // TODO : 저장
              },
              icon: Icon(Icons.save))
        ],
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
