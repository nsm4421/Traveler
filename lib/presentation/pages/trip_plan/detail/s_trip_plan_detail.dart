part of 'p_trip_plan_detail.dart';

class TripPlanDetailScreen extends StatelessWidget {
  const TripPlanDetailScreen(this._tripPlan, {super.key});

  final TripPlanEntity _tripPlan;

  @override
  Widget build(BuildContext context) {
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
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// 여행정보
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: InfoFragment(_tripPlan),
          ),

          /// 지원신청
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: BlocBuilder<DisplayJoinApplyBloc,
                  AbsDisplayState<JoinApplyEntity>>(builder: (context, state) {
                return DisplayApplyFragment(
                    tripPlan: _tripPlan, applies: state.data);
              })),

          /// 댓글
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: CommentButtonWidget(_tripPlan),
          ),
        ],
      ),
    );
  }
}
