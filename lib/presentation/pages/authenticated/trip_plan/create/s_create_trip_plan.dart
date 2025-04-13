part of 'p_create_trip_plan.dart';

class CreateTripScreen extends StatelessWidget {
  const CreateTripScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateTripPlanCubit, CreateTripPlanState>(
      listener: (context, state) {
        if (state.status == Status.error) {
          Timer(1.durationInSec, () {
            if (context.mounted) {
              context
                  .read<CreateTripPlanCubit>()
                  .initState(status: Status.initial, errorMessage: '');
            }
          });
        } else if (state.status == Status.success) {
          Timer(1.durationInSec, () {
            if (context.mounted) {
              context.pop();
            }
          });
        }
      },
      child: BlocBuilder<CreateTripPlanCubit, CreateTripPlanState>(
          builder: (context, state) {
        return LoadingOverLayWidget(
            isLoading: state.status != Status.initial,
            loadingWidget: const Center(child: CircularProgressIndicator()),
            child: Scaffold(
              appBar: AppBar(
                title: const Text("여행계획 짜기"),
                elevation: 0,
                actions: const [SubmitButtonWidget()],
              ),
              body: const SingleChildScrollView(
                child: CreateTripFormFragment(),
              ),
            ));
      }),
    );
  }
}
