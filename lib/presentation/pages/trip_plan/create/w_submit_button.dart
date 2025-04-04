part of 'p_create_trip_plan.dart';

class SubmitButtonWidget extends StatelessWidget {
  const SubmitButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () async {
          FocusScope.of(context).unfocus();
          Timer(200.durationInMilli, () async {
            if (context.mounted) {
              // TODO : Validation
              await context.read<CreateTripPlanCubit>().submit();
            }
          });
        },
        icon: const Icon(Icons.check));
  }
}
