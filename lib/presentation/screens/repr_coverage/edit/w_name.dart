part of 'p_edit_repr_coverage.dart';

class EditReprCoverageNameWidget extends StatelessWidget {
  const EditReprCoverageNameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
            width: 100,
            child:
                Text("대표담보명", style: Theme.of(context).textTheme.titleSmall)),
        const SizedBox(width: 16),
        Expanded(
          child: Card(
            child: CustomTextFieldWidget(
              initText: context.read<EditReprCoverageCubit>().state.name,
              onFocusLeave: (text) {
                context.read<EditReprCoverageCubit>().updateState(name: text);
              },
            ),
          ),
        )
      ],
    );
  }
}
