part of 'p_repr_coverage.dart';

class NavigateToCreatePageButtonWidget extends StatelessWidget {
  const NavigateToCreatePageButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        tooltip: '대표 담보 생성하기',
        onPressed: () async {
          await showDialog(
              context: context,
              barrierDismissible: true,
              builder: (context) {
                return AlertDialog(
                  title: const Text('대표담보 생성하기'),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: CoverageType.values.map((type) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        child: ElevatedButton(
                            onPressed: () {
                              context.push(Routes.createReprCoverage.path,
                                  extra: type);
                            },
                            child: Text(type.label)),
                      );
                    }).toList(),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => context.pop(),
                      child: const Text('닫기'),
                    ),
                  ],
                );
              });
        },
        icon: const Icon(Icons.add_circle_outline_outlined));
  }
}
