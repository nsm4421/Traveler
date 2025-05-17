part of 'p_create_repr_coverage.dart';

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
              onFocusLeave: (text) {
                context.read<CreateReprCoverageCubit>().updateState(name: text);
              },
            ),
          ),
        )
      ],
    );
  }
}
