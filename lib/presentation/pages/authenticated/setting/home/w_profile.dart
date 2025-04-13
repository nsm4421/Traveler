part of 'p_setting.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ConditionalRenderWidget<UserEntity>(
        data: context.read<AuthenticationBloc>().currentUser,
        builder: (user) {
          return ListTile(
            leading: ConditionalRenderWidget<String>(
                data: user.avatarUrl,
                builder: (url) => CircleAvatar(
                    backgroundImage:
                        CachedNetworkImageProvider(user.avatarUrl!))),
            title: Row(
              children: [
                Text(user.username, style: context.textTheme.titleLarge),
              ],
            ),
            subtitle: ConditionalRenderWidget<String>(
                data: user.description, builder: (text) => Text(text)),
            trailing: const SignOutWidget(),
          );
        });
  }
}
