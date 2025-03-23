part of 's_search.dart';

enum SearchOptionEnum {
  all(label: 'ALL', iconData: Icons.square_outlined),
  title(label: "제목만", iconData: Icons.title),
  titleAndContent(label: "제목 및 본문", iconData: Icons.text_fields),
  hashtag(label: "해시태그", iconData: Icons.tag);

  final String label;
  final IconData iconData;

  const SearchOptionEnum({required this.label, required this.iconData});
}
