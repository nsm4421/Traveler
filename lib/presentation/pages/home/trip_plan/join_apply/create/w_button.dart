part of 's_create_join_apply.dart';

class CreateJoinApplyWidget extends StatelessWidget {
  const CreateJoinApplyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () async {
          FocusScope.of(context).unfocus();
          Timer(500.durationInMilli, () async {
            await context.read<CreateJoinApplyCubit>().submit();
          });
        },
        child: Text("Submit"));
  }
}
