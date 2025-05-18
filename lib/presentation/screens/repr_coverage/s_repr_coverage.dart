part of 'p_repr_coverage.dart';

class ReprCoverageScreen extends StatefulWidget {
  const ReprCoverageScreen({super.key});

  @override
  State<ReprCoverageScreen> createState() => _ReprCoverageScreenState();
}

class _ReprCoverageScreenState extends State<ReprCoverageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("대표담보 조회 페이지"),
        actions: [
          IconButton(
              tooltip: '대표담보 생성하기',
              onPressed: () {
                context.push(Routes.editReprCoverages.path);
              },
              icon: const Icon(Icons.add_circle_outline_outlined))
        ],
      ),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: SearchReprCoverageFragment(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Expanded(child: DisplayReprCovereagesFragment()),
          )
        ],
      ),
    );
  }
}
