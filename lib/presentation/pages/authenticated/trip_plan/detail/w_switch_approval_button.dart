part of 'p_trip_plan_detail.dart';

class SwitchApprovalButtonWidget extends StatelessWidget {
  const SwitchApprovalButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<JoinApplyApprovalCubit, JoinApplyApprovalState>(
      listener: (context, state) {
        context.read<DisplayJoinApplyBloc>().add(UpdateJoinApplyApprovalEvent(
            tripPlanId: state.tripPlanId, isAccepted: state.isAccepted));
      },
      child: BlocBuilder<JoinApplyApprovalCubit, JoinApplyApprovalState>(
          builder: (context, state) {
        return Switch(
          value: state.isAccepted,
          onChanged: (bool newValue) async {
            await context
                .read<JoinApplyApprovalCubit>()
                .switchIsAccepted(newValue);
          },
        );
      }),
    );
  }
}
