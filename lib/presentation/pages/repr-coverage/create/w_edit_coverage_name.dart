part of 'p_create_repr_coverage.dart';

class EditCoverageNameWidget extends StatefulWidget {
  const EditCoverageNameWidget(this._coverageType, {super.key});

  final CoverageType _coverageType;

  @override
  State<EditCoverageNameWidget> createState() => _EditCoverageNameWidgetState();
}

class _EditCoverageNameWidgetState extends State<EditCoverageNameWidget> {
  late final TextEditingController _controller;
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _focusNode = FocusNode()..addListener(_handleFocus);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _focusNode
      ..addListener(_handleFocus)
      ..dispose();
  }

  _handleFocus() {
    setState(() {});
    if (!_focusNode.hasFocus) {
      _updateCubitState(_controller.text.trim());
    }
  }

  _updateCubitState(String? name) {
    switch (widget._coverageType) {
      case CoverageType.singleBenefit:
        context
            .read<CreateSingleBenefitReprCoverageCubit>()
            .updateState(name: name);
      case CoverageType.multipleBenefit:
        context
            .read<CreateMultipleBenefitReprCoverageCubit>()
            .updateState(name: name);
      case CoverageType.multipleDetailedCoverage:
        context
            .read<CreateMultipleDetailedCoverageReprCoverageCubit>()
            .updateState(name: name);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(
              Icons.title_rounded,
              size: 16,
            ),
            2.width,
            Text('대표담보명', style: context.textTheme.titleSmall),
          ],
        ),
        4.height,
        Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            child: TextFormField(
              controller: _controller,
              focusNode: _focusNode,
              decoration: InputDecoration(
                  hintText: '담보명을 입력해주세요',
                  helperText: '대표담보코드는 각 대표담보명에 따라 자동채번되요',
                  border: _focusNode.hasFocus
                      ? const OutlineInputBorder()
                      : const UnderlineInputBorder()),
            ),
          ),
        ),
      ],
    );
  }
}
