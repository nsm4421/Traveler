part of 's_repr_coverage.dart';

enum PopUpMenu {
  copy('복사'),
  edit('수정'),
  delete('삭제');

  final String label;

  const PopUpMenu(this.label);
}

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
              context.push(Routes.createReprCoverages.path);
              return;
            case PopUpMenu.delete:
            // TODO : 삭제 팝업 띄우기
            case PopUpMenu.copy:
            // TODO : 복사 페이지로 라우팅
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
