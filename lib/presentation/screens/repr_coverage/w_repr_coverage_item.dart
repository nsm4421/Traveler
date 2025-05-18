part of 'p_repr_coverage.dart';

class ReprCoverageItemWidget extends StatelessWidget {
  const ReprCoverageItemWidget(this._coverage, {super.key});

  final ReprCoverageEntity _coverage;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
          width: 80,
          child: Center(
            child: Text(
              _coverage.category.label,
            ),
          )),
      title: Text(
        "[${_coverage.code}] ${_coverage.name}",
        softWrap: true,
      ),
      trailing: PopupMenuButton<PopUpMenu>(
        onSelected: (menu) {
          switch (menu) {
            case PopUpMenu.edit:
              context.push(Routes.editReprCoverages.path);
              return;
            case PopUpMenu.delete:
              return;
            case PopUpMenu.copy:
              context.push(Routes.editReprCoverages.path, extra: _coverage);
              return;
          }
        },
        itemBuilder: (context) => PopUpMenu.values
            .map(
              (e) => PopupMenuItem(value: e, child: Text(e.label)),
            )
            .toList(),
        icon: const Icon(Icons.more_vert),
      ),
    );
  }
}
