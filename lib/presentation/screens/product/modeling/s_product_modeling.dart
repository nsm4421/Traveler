part of 'p_product_modeling.dart';

final _mockReprCoverage = ReprCoverageEntity(
    code: '6AAAA',
    name: '수술비(1-5종)',
    category: CoverageCategory.injureAndDisease,
    gurantees: [
      ...List.generate(
          5,
          (index) => GuranteeEntity(
              code: (index + 1).toString().padLeft(2, '0'),
              name: '상해${index + 1}종',
              benefits: [])),
      ...List.generate(
          5,
          (index) => GuranteeEntity(
              code: (index + 6).toString().padLeft(2, '0'),
              name: '질병${index + 1}종',
              benefits: []))
    ]);

final _mockProductCoverages = [
  ...List.generate(
      _mockReprCoverage.gurantees.length,
      (index) => ProductCoverageEntity.fromReprCoverageWithProperty(
            reprCoverageWithProperty: ReprCoverageWithPropertiesEntity(
                reprCoverage: _mockReprCoverage),
            guranteeCode: (index + 1).toString().padLeft(2, '0'),
            seq: index + 1,
          )),
  ...List.generate(
      _mockReprCoverage.gurantees.length,
      (index) => ProductCoverageEntity.fromReprCoverageWithProperty(
            reprCoverageWithProperty: ReprCoverageWithPropertiesEntity(
                reprCoverage: _mockReprCoverage, isRenewal: true),
            guranteeCode: (index + 1).toString().padLeft(2, '0'),
            seq: index + 11,
          )),
  ...List.generate(
      _mockReprCoverage.gurantees.length,
      (index) => ProductCoverageEntity.fromReprCoverageWithProperty(
            reprCoverageWithProperty: ReprCoverageWithPropertiesEntity(
                reprCoverage: _mockReprCoverage,
                isRenewal: true,
                isSpecialConditioned: true),
            guranteeCode: (index + 1).toString().padLeft(2, '0'),
            seq: index + 21,
          ))
];

enum ReprCovPopUpMenu {
  copy("복사"),
  delete("삭제");

  final String label;

  const ReprCovPopUpMenu(this.label);
}

class ProductModelingScreen extends StatefulWidget {
  const ProductModelingScreen(this._product, {super.key});

  final UnitProductHistoryEntity _product;

  @override
  State<ProductModelingScreen> createState() => _ProductModelingScreenState();
}

class _ProductModelingScreenState extends State<ProductModelingScreen> {
  Future<void> _showContextMenu(Offset position) async {
    await BrowserContextMenu.disableContextMenu();
    final selected = await showMenu<ReprCovPopUpMenu>(
      context: context,
      position: RelativeRect.fromLTRB(
          position.dx, position.dy, position.dx, position.dy),
      items: ReprCovPopUpMenu.values
          .map((e) => PopupMenuItem(
                value: e,
                child: Text(e.label),
              ))
          .toList(),
    );
    // TODO : 선택한거에 따라 다른거 렌더링
    await BrowserContextMenu.enableContextMenu();
  }

  _handlePointerDown(e) async {
    if (e.kind != PointerDeviceKind.mouse || e.buttons != kSecondaryMouseButton)
      return;
    await _showContextMenu(e.position);
  }

  _handleShowModal() async {
    await showDialog(
        context: context,
        builder: (context) => Dialog(
              insetPadding:
                  const EdgeInsets.symmetric(horizontal: 48, vertical: 36),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: BlocProvider(
                  create: (_) =>
                      getIt<AddCoverageCubit>(param1: widget._product),
                  child: const AddCoverageModalFragment()),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('상품모델링'),
        actions: [
          IconButton(
            onPressed: _handleShowModal,
            icon: const Icon(Icons.add_circle_outline_outlined),
            tooltip: '담보추가하기',
          )
        ],
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: DataTable(columns: const [
            DataColumn(label: Text('대표담보코드')),
            DataColumn(label: Text('대표담보명')),
            DataColumn(label: Text('담보순번')),
            DataColumn(label: Text('담보명')),
          ], rows: [
            ...List.generate(
                _mockProductCoverages.length,
                (index) => DataRow(cells: [
                      DataCell(Listener(
                          onPointerDown: _handlePointerDown,
                          child:
                              Text(index == 0 ? _mockReprCoverage.code : ''))),
                      DataCell(Listener(
                          onPointerDown: _handlePointerDown,
                          child:
                              Text(index == 0 ? _mockReprCoverage.name : ''))),
                      DataCell(
                          Text((_mockProductCoverages[index].seq).toString())),
                      DataCell(Text(_mockProductCoverages[index].name)),
                    ])),
          ]),
        ),
      ),
    );
  }
}
