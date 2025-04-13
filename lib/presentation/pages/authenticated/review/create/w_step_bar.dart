part of 'p_create_review.dart';

class StepBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const StepBarWidget(
      {super.key, required this.currentStepIndex, required this.handleJumpPage});

  final int currentStepIndex;
  final Function(int index) handleJumpPage;

  static const double _height = 40;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(CreateReviewStep.values.length * 2 - 1, ($index) {
          if ($index.isOdd) {
            return Expanded(
              child: Container(
                height: 2,
                color: $index ~/ 2 < currentStepIndex
                    ? context.colorScheme.primaryContainer
                    : Colors.grey[300],
              ),
            );
          } else {
            final stepIndex = $index ~/ 2;
            final isCompleted = stepIndex < currentStepIndex;
            final isCurrent = stepIndex == currentStepIndex;
            return GestureDetector(
              onTap: () async {
                handleJumpPage(stepIndex);
              },
              child: CircleAvatar(
                  radius: _height / 2,
                  backgroundColor: (isCompleted || isCurrent)
                      ? context.colorScheme.primary
                      : Colors.grey[300],
                  child: Icon(
                    CreateReviewStep.values[stepIndex].iconData,
                    color: isCompleted || isCurrent ? Colors.white : Colors.black,
                  )),
            );
          }
        }),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(_height);
}
