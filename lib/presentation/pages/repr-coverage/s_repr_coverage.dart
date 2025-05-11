part of 'p_repr_coverage.dart';

class ReprCoverageScreen extends StatelessWidget {
  const ReprCoverageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("대표담보"),
        actions: const [NavigateToCreatePageButtonWidget()],
      ),
      body: const Column(
        children: [Text("TODO : 대표담보 목록 보여주기")],
      ),
    );
  }
}
