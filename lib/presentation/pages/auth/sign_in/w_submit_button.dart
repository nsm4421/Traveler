part of 's_sign_in.dart';

class SubmitButtonWidget extends StatelessWidget {
  const SubmitButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () async {
          FocusScope.of(context).unfocus();
          await context.read<SignInCubit>().submit();
        },
        child: Text("Submit"));
  }
}
