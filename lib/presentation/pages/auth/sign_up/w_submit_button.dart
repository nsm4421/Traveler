part of 's_sign_up.dart';

class SubmitButtonWidget extends StatelessWidget {
  const SubmitButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () async {
          FocusScope.of(context).unfocus();
          await context.read<SignUpCubit>().submit();
        },
        child: Text("Submit"));
  }
}
