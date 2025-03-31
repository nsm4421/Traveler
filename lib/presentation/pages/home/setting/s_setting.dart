part of 'p_setting.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting'),
        actions: [
          IconButton(
              onPressed: () {
                context.read<AuthenticationBloc>().add(SignOutEvent());
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Column(
        children: [
          ProfileWidget(),
          Spacer(flex: 3),
          ElevatedButton(
              onPressed: () {
                // TODO : 회원탈퇴 페이지로
              },
              child: Text("회원탈퇴")),
          Spacer(flex: 1),
        ],
      ),
    );
  }
}
