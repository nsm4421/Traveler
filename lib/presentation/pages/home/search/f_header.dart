part of 'p_search.dart';

class HeaderFragment extends StatefulWidget {
  const HeaderFragment({super.key});

  @override
  State<HeaderFragment> createState() => _HeaderFragmentState();
}

class _HeaderFragmentState extends State<HeaderFragment> {
  late TextEditingController _controller;
  late SearchOptionEnum _option;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _option = SearchOptionEnum.values.first;
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  _handleClear() {
    _controller.clear();
  }

  _handleTapOption(SearchOptionEnum option) => () {
        setState(() {
          _option = option;
        });
      };

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(left: 12, right: 12, top: context.padding.top + 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: _controller,
            style:
                context.textTheme.bodyLarge?.copyWith(decorationThickness: 0),
            decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                prefixIcon: Icon(Icons.search),
                suffixIcon: IconButton(
                  onPressed: _handleClear,
                  icon: Icon(Icons.clear),
                )),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: SearchOptionEnum.values.map((item) {
                return GestureDetector(
                  onTap: _handleTapOption(item),
                  child: Container(
                    margin: const EdgeInsets.only(top: 12, right: 16),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                    decoration: BoxDecoration(
                        border: item == _option
                            ? Border.all(
                                color: context.colorScheme.primaryContainer,
                                width: 2,
                              )
                            : null,
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(item.iconData,
                            size: 18,
                            color: item == _option
                                ? context.colorScheme.primary
                                : null),
                        8.width,
                        Text(
                          item.label,
                          style: context.textTheme.labelLarge?.copyWith(
                              color: item == _option
                                  ? context.colorScheme.primary
                                  : null,
                              fontWeight:
                                  item == _option ? FontWeight.w700 : null),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(growable: false),
            ),
          )
        ],
      ),
    );
  }
}
