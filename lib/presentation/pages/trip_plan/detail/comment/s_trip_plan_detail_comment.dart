part of 'p_trip_plan_detail_comment.dart';

class TripPlanDetailCommentScreen extends StatefulWidget {
  const TripPlanDetailCommentScreen({super.key});

  @override
  State<TripPlanDetailCommentScreen> createState() =>
      _TripPlanDetailCommentScreenState();
}

class _TripPlanDetailCommentScreenState
    extends State<TripPlanDetailCommentScreen> {
  late TextEditingController _commentController;

  @override
  void initState() {
    super.initState();
    _commentController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _commentController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          const Expanded(child: DisplayTripPlanDetailCommentFragment()),

          TripPlanDetailCommentTextFieldWidget(_commentController),
        ],
      ),
    );
  }
}
