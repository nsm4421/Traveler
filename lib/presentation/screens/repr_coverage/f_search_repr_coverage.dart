part of 'p_repr_coverage.dart';

class SearchReprCoverageFragment extends StatefulWidget {
  const SearchReprCoverageFragment({super.key});

  @override
  State<SearchReprCoverageFragment> createState() =>
      _SearchReprCoverageFragmentState();
}

class _SearchReprCoverageFragmentState
    extends State<SearchReprCoverageFragment> {
  late TextEditingController _controller;
  late FocusNode _focusNode;
  late bool _showBorder;
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _focusNode = FocusNode()..addListener(_handleFocus);
    _showBorder = _focusNode.hasFocus;
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _focusNode
      ..removeListener(_handleFocus)
      ..dispose();
  }

  _handleFocus() {
    setState(() {
      _showBorder = _focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints:
          BoxConstraints(maxWidth: MediaQuery.of(context).size.width / 3),
      child: TextField(
        focusNode: _focusNode,
        controller: _controller,
        decoration: InputDecoration(
            hintText: '대표담보 검색',
            hintStyle: Theme.of(context).textTheme.labelMedium,
            suffixIcon: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
              tooltip: '대표담보 검색',
            ),
            border:
                _showBorder ? const UnderlineInputBorder() : InputBorder.none),
      ),
    );
  }
}
