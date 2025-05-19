part of '../p_product_modeling.dart';

class SaveCovereagesStepWidget extends StatelessWidget {
  const SaveCovereagesStepWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            Text('담보생성', style: Theme.of(context).textTheme.titleMedium),
            const Spacer(),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.save),
              tooltip: '저장하기',
            )
          ],
        ),
      ),
      BlocBuilder<AddCoverageCubit, AddCoverageState>(
          builder: (context, state) {
        return Expanded(
          child: Align(
            alignment: Alignment.topCenter,
            child: SingleChildScrollView(
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: DataTable(
                      columns: const [
                        DataColumn(label: Text('담보순번')),
                        DataColumn(label: Text('담보명')),
                      ],
                      rows: state.productCoveragesToAdd
                          .map(
                            (e) => DataRow(cells: [
                              DataCell(Text(e.seq.toString())),
                              DataCell(Text(e.name))
                            ]),
                          )
                          .toList())),
            ),
          ),
        );
      })
    ]);
  }
}
