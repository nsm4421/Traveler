part of 'p_create_review.dart';

class StepBarWidget extends StatelessWidget {
  const StepBarWidget(
      {super.key, required this.currentIndex, required this.handleJumpPage});

  final int currentIndex;
  final Function(int index) handleJumpPage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(CreateReviewStep.values.length * 2 - 1, (index) {
        if (index.isOdd) {
          return Expanded(
            child: Container(
              height: 2,
              color: index ~/ 2 < currentIndex
                  ? context.colorScheme.primaryContainer
                  : Colors.grey[300],
            ),
          );
        } else {
          final stepIndex = index ~/ 2;
          final isCompleted = stepIndex < currentIndex;
          final isCurrent = stepIndex == currentIndex;
          return GestureDetector(
            onTap: () {
              handleJumpPage(index - 1);
            },
            child: CircleAvatar(
                radius: 20,
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
    );
  }
}
