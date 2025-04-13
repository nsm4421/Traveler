part of 'p_trip_plan_detail_comment.dart';

class TripPlanDetailCommentTextFieldWidget extends StatelessWidget {
  const TripPlanDetailCommentTextFieldWidget(this._controller, {super.key});

  final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateTripPlanParentCommentCubit,
        AbsCreateParentCommentState<TripPlanEntity>>(
      listener: (context, state) {
        if (state.status == Status.error) {
          Timer(1.durationInSec, () {
            context
              ..showSnackBar(state.errorMessage)
              ..read<CreateTripPlanParentCommentCubit>()
                  .updateState(status: Status.initial, errorMessage: '');
          });
        } else if (state.status == Status.success) {
          _controller.clear();
          FocusScope.of(context).unfocus();
        }
      },
      child: BlocBuilder<CreateTripPlanParentCommentCubit,
              AbsCreateParentCommentState<TripPlanEntity>>(
          builder: (context, state) {
        final clickable =
            state.status == Status.initial || state.status == Status.success;
        return TextField(
            controller: _controller,
            readOnly: !clickable,
            style:
                context.textTheme.bodyLarge?.copyWith(decorationThickness: 0),
            decoration: InputDecoration(
                border: const OutlineInputBorder(),
                suffixIcon: clickable
                    ? IconButton(
                        onPressed: () async {
                          final text = _controller.text.trim();
                          if (text.isEmpty) {
                            return;
                          }
                          await context
                              .read<CreateTripPlanParentCommentCubit>()
                              .create(text, onSuccess: (e) {
                            context
                                .read<DisplayTripPlanParentCommentBloc>()
                                .add(WriteNewCommentEvent(e));
                          });
                        },
                        icon: Icon(
                          Icons.send,
                          color: context.colorScheme.secondary,
                        ))
                    : Transform.scale(
                        scale: 0.5, child: const CircularProgressIndicator())));
      }),
    );
  }
}
