part of 'common-term-template.page.dart';

class CommonTermTemplateScreen extends StatelessWidget {
  const CommonTermTemplateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("보통약관 템플릿 페이지"),
      ),
      body: Column(
        children: [
          // 헤더
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
            ),
            child: Row(
              children: [
                ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 500),
                    child: TextField(
                      decoration: InputDecoration(hintText: "검색어를 입력해주세요"),
                    )),
                Spacer(),
                ElevatedButton(onPressed: () {}, child: Text("개정일자"))
              ],
            ),
          ),

          Row(
            children: [
              // 목차
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("제1관 목적 및 용어의 정의"),
                    Text("제2관 보험금의 지급"),
                    Text("3관"),
                  ],
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    context.push(Routes.editCommonTermTemplate.path,
                        extra: mockData.subsections.first.articles[1]);
                  },
                  child: Text("TEST"))
              // 조항
              // CommonTermPreviewFragment(mockData),
            ],
          ),
        ],
      ),
    );
  }
}
