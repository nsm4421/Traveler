part of 'p_trip_plan_detail.dart';

class TripPlanDetailScreen extends StatelessWidget {
  const TripPlanDetailScreen(this._entity, {super.key});

  final TripPlanEntity _entity;

  @override
  Widget build(BuildContext context) {
    final currentUid = context.read<AuthenticationBloc>().currentUid;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              if (context.mounted) {
                context.pop();
              }
            },
            icon: const Icon(Icons.clear)),
        title: const Text('상세 페이지', overflow: TextOverflow.ellipsis),
        centerTitle: true,
      ),
      body: Column(
        children: [
          InfoFragment(_entity),
          BlocBuilder<DisplayJoinApplyBloc, AbsDisplayState<JoinApplyEntity>>(
            builder: (context, state) {
              final applies =
                  state.data.where((item) => item.creator.id != currentUid);
              return applies.isEmpty
                  ? Center(
                      child: Text(
                        "아직 지원자가 없습니다.\n첫번째 지원자가 되어보세요",
                        style: context.textTheme.labelLarge,
                      ),
                    )
                  : DisplayApplyFragment(
                      tripPlan: _entity, applies: applies.toList());
            },
          ),
        ],
      ),
    );
  }
}
