part of 's_create_journey.dart';

class SubmitButtonWidget extends StatelessWidget {
  const SubmitButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () async {
          FocusScope.of(context).unfocus();
          await context.read<CreateJourneyCubit>().submit();
        },
        child: Text("Submit"));
  }
}
