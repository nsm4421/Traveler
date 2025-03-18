part of 's_detail.dart';

class CreateApplyFragment extends StatefulWidget {
  const CreateApplyFragment({super.key});

  @override
  State<CreateApplyFragment> createState() => _CreateApplyFragmentState();
}

class _CreateApplyFragmentState extends State<CreateApplyFragment> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: _controller,
            ),
            ElevatedButton(onPressed: () {}, child: Text("제출하기"))
          ],
        ),
      ),
    );
  }
}
