part of 'p_create_trip_plan.dart';

class CreateTripFormFragment extends StatelessWidget {
  const CreateTripFormFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          ContentWidget(context.read<CreateTripPlanCubit>().formKey),
          12.height,
          const HashtagWidget(),
          12.height,
          const MaxHeadCountWidget(),
          12.height,
          const SelectDateWidget(),
          30.height
        ],
      ),
    );
  }
}
