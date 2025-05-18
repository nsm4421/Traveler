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
            Text('담보생성', style: Theme.of(context).textTheme.titleSmall),
            Spacer(),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.save),
              tooltip: '저장하기',
            )
          ],
        ),
      ),
      Expanded(
        child: Align(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: DataTable(columns: const [
                  DataColumn(label: Text('담보순번')),
                  DataColumn(label: Text('담보명')),
                ], rows: [
                  ...List.generate(5, (index) {
                    return DataRow(cells: [
                      DataCell(Text((index + 100).toString())),
                      DataCell(Text("수술비2(1-5종)[상해${index + 1}종]")),
                    ]);
                  }),
                  ...List.generate(5, (index) {
                    return DataRow(cells: [
                      DataCell(Text((index + 105).toString())),
                      DataCell(Text("수술비2(1-5종)[질병${index + 1}종]")),
                    ]);
                  }),
                  ...List.generate(5, (index) {
                    return DataRow(cells: [
                      DataCell(Text((index + 110).toString())),
                      DataCell(Text("갱신형 수술비2(1-5종)[상해${index + 1}종]")),
                    ]);
                  }),
                  ...List.generate(5, (index) {
                    return DataRow(cells: [
                      DataCell(Text((index + 115).toString())),
                      DataCell(Text("갱신형 수술비2(1-5종)[질병${index + 1}종]")),
                    ]);
                  }),
                  ...List.generate(5, (index) {
                    return DataRow(cells: [
                      DataCell(Text((index + 120).toString())),
                      DataCell(Text("갱신형 수술비2(1-5종)(출생전)[상해${index + 1}종]")),
                    ]);
                  }),
                  ...List.generate(5, (index) {
                    return DataRow(cells: [
                      DataCell(Text((index + 125).toString())),
                      DataCell(Text("갱신형 수술비2(1-5종)(출생전)[질병${index + 1}종]")),
                    ]);
                  }),
                ])),
          ),
        ),
      )
    ]);
  }
}
