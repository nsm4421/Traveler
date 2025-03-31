part of 'p_setting.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({super.key});

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  late UserEntity? _user;

  @override
  void initState() {
    super.initState();
    _user = context.read<AuthenticationBloc>().currentUser;
  }

  @override
  Widget build(BuildContext context) {
    return _user == null
        ? SizedBox.shrink()
        : ListTile(
            title: Row(
              children: [
                Text(
                  _user!.username,
                  style: context.textTheme.titleLarge,
                ),
                8.width,
                Icon(_user!.sex!.iconData),
              ],
            ),
            subtitle: Text(
              _user!.description,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: IconButton(
              icon: Icon(Icons.edit_outlined),
              onPressed: () {
                // TODO : 프로필 수정 페이지로 라우팅
              },
            ),
          );
  }
}
