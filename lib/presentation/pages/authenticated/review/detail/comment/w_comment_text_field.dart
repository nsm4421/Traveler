part of 'p_review_comment.dart';

class CommentTextFieldWidget extends StatefulWidget {
  const CommentTextFieldWidget({super.key});

  @override
  State<CommentTextFieldWidget> createState() => _CommentTextFieldWidgetState();
}

class _CommentTextFieldWidgetState extends State<CommentTextFieldWidget>
    with DebounceMixin {
  late TextEditingController _controller;

  static const _maxLength = 1000;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    setState(() {});
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  _handleCreateComment() async {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    await debounce(() async {
      context.read<CreateParentReviewCommentCubit>().create(text,
          onSuccess: (e) async {
        context
            .read<DisplayParentReviewCommentBloc>()
            .add(WriteNewCommentEvent<ReviewCommentEntity>(e));
      });
    }, delay: 1.durationInSec);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateParentReviewCommentCubit,
        AbsCreateParentCommentState<ReviewEntity>>(
      listenWhen: (prev, curr) =>
          (prev.status != curr.status) &&
          (curr.status == Status.error || curr.status == Status.success),
      listener: (context, state) async {
        Timer(1.durationInSec, () {
          if (state.status == Status.success) {
            _controller.clear();
          } else if (state.status == Status.error) {
            context.showSnackBar('댓글 중 오류 발생');
          }
          context
              .read<CreateParentReviewCommentCubit>()
              .updateState(status: Status.initial);
        });
      },
      child: BlocBuilder<CreateParentReviewCommentCubit,
          AbsCreateParentCommentState<ReviewEntity>>(builder: (context, state) {
        return TextField(
          readOnly: !state.status.isReady,
          controller: _controller,
          minLines: 1,
          maxLines: 3,
          maxLength: _maxLength,
          decoration: InputDecoration(
              hintText: '댓글을 작성해주세요',
              border: const OutlineInputBorder(),
              suffixIcon: state.status.isReady
                  ? IconButton(
                      onPressed: _handleCreateComment,
                      icon: const Icon(Icons.send),
                    )
                  : Transform.scale(
                      scale: 0.5,
                      child: const CircularProgressIndicator(),
                    ),
              counterText: ''),
        );
      }),
    );
  }
}
