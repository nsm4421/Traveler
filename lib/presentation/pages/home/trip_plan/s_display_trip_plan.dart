part of 'p_display_trip_plan.dart';

class DisplayTripPlanScreen extends StatelessWidget {
  const DisplayTripPlanScreen(this.titleText, {super.key});

  final String titleText;

  @override
  Widget build(BuildContext context) {
    return BlocListener<DisplayTripPlanBloc, AbsDisplayState<TripPlanEntity>>(
      listener: (context, state) {
        if (state.status == Status.error) {
          context.showSnackBar(state.errorMessage);
          Timer(1.durationInSec, () {
            if (context.mounted) {
              context.read<DisplayTripPlanBloc>().add(
                  InitDisplayEvent(status: Status.initial, errorMessage: ''));
            }
          });
        }
      },
      child: BlocBuilder<DisplayTripPlanBloc, AbsDisplayState<TripPlanEntity>>(
        builder: (context, state) {
          return LoadingOverLayWidget(
            isLoading: (state.status == Status.loading),
            child: Scaffold(
                appBar: AppBar(
                  title: Text(titleText),
                  actions: [
                    IconButton(
                      onPressed: () {
                        context.push(Routes.createTripPlan.path);
                      },
                      icon: const Icon(Icons.add_box_outlined),
                    )
                  ],
                ),
                body: RefreshIndicator(
                    onRefresh: () async {
                      context
                          .read<DisplayTripPlanBloc>()
                          .add(RefreshDisplayEvent());
                    },
                    child: TripPlanListFragment(state.data))),
          );
        },
      ),
    );
  }
}
