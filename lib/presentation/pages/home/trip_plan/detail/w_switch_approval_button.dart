part of 's_detail.dart';

class SwitchApprovalButtonWidget extends StatelessWidget {
  const SwitchApprovalButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JoinApplyApprovalCubit, JoinApplyApprovalState>(
        builder: (context, state) {
      return Switch(
        value: state.isAccepted,
        onChanged: (bool newValue) async {
          await context
              .read<JoinApplyApprovalCubit>()
              .switchIsAccepted(newValue);
        },
      );
    });
  }
}
