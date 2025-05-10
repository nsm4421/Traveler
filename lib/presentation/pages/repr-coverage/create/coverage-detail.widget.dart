part of 'create-repr-coverage.page.dart';

// class CoverateDetailWidget extends StatefulWidget {
//   const CoverateDetailWidget({super.key});

//   @override
//   State<CoverateDetailWidget> createState() => _CoverateDetailWidgetState();
// }

// class _CoverateDetailWidgetState extends State<CoverateDetailWidget> {
//   late List<DetailedCoverageEntity> _detailCoverages;
//   late List<TextEditingController> _nameControllers;

//   @override
//   void initState() {
//     super.initState();
//     _detailCoverages =
//         context.read<CreateReprCoverageCubit>().state.detailedCoverages;
//     _nameControllers = List.generate(
//         _detailCoverages.length,
//         (index) => TextEditingController()
//           ..text = _detailCoverages[index].name
//           ..addListener(_handleChange(index)));
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _nameControllers.forEach((c) => c.dispose());
//   }

//   _handleChange(int index) => () {
//         _detailCoverages[index] = _detailCoverages[index]
//             .copyWith(name: _nameControllers[index].text.trim());
//         _updateCubitState();
//       };

//   _handleAddDetailCoverage() {
//     _nameControllers = [..._nameControllers, TextEditingController()];
//     setState(() {
//       _detailCoverages = [
//         ..._detailCoverages,
//         DetailedCoverageEntity(name: '', code: _detailCoverages.length + 1)
//       ];
//     });
//     _updateCubitState();
//   }

//   _handleDeleteDetailCoverage(int index) => () {
//         setState(() {
//           _nameControllers.removeAt(index);
//           _detailCoverages.removeAt(index);
//           _detailCoverages = List.generate(_detailCoverages.length,
//               (index) => _detailCoverages[index].copyWith(code: index + 1));
//         });
//         _updateCubitState();
//       };

//   _updateCubitState() {
//     context
//         .read<CreateReprCoverageCubit>()
//         .updateState(detailedCoverages: _detailCoverages);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(
//           children: [
//             Text(
//               "세부보장",
//               style: context.textTheme.titleSmall,
//             ),
//             IconButton(
//                 tooltip: '세부보장 추가',
//                 onPressed: _handleAddDetailCoverage,
//                 icon: const Icon(
//                   Icons.add_circle_outline,
//                   size: 16,
//                 ))
//           ],
//         ),
//         8.height,
//         ...List.generate(_detailCoverages.length, (index) {
//           final detailCoverage = _detailCoverages[index];
//           return Card(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
//               child: Column(
//                 children: [
//                   Row(
//                     children: [
//                       Text('세부보장 ${detailCoverage.code}'),
//                       const Spacer(),
//                       IconButton(
//                           tooltip: '세부보장 삭제',
//                           onPressed: _handleDeleteDetailCoverage(index),
//                           icon: const Icon(
//                             Icons.delete_forever_outlined,
//                             size: 12,
//                           ))
//                     ],
//                   ),
//                   TextField(
//                     controller: _nameControllers[index],
//                     decoration: InputDecoration(
//                         border: InputBorder.none,
//                         prefixText: '(${detailCoverage.code}) ',
//                         hintText: '세부보장명을 입력해주세요'),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         })
//       ],
//     );
//   }
// }
