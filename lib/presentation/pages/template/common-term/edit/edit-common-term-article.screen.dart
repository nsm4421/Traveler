part of 'edit-common-term-article.page.dart';

class EditCommonTermArticleScreen extends StatelessWidget {
  const EditCommonTermArticleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('조항 수정페이지'),
        actions: [
          IconButton(
              onPressed: () {
                // TODO : 저장버튼
              },
              icon: const Icon(Icons.check))
        ],
      ),
      body: Row(
        children: [
          Expanded(
            child: OriginalArticleFragment(),
            flex: 1,
          ),
          Expanded(
            child: EditArticleFragment(),
            flex: 1,
          ),
        ],
      ),
    );
  }
}
