part of 'p_trip_plan_detail.dart';

class CreateApplyFragment extends StatefulWidget {
  const CreateApplyFragment({super.key});

  @override
  State<CreateApplyFragment> createState() => _CreateApplyFragmentState();
}

class _CreateApplyFragmentState extends State<CreateApplyFragment> {
  static const int _maxLength = 500;
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  _handleSubmit() {
    context
        .read<CreateJoinApplyBloc>()
        .add(SubmitJoinApplyEvent(_controller.text.trim()));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateJoinApplyBloc, CreateJoinApplyState>(
      listener: (context, state) {
        if (state.status == Status.success) {
          context.showSnackBar('Success!');
          if (context.mounted) {
            context.pop();
          }
        } else if (state.status == Status.error) {
          context.showSnackBar(state.errorMessage);
          Timer(1.durationInSec, () {
            context.read<CreateJoinApplyBloc>().add(
                InitJoinApplyEvent(status: Status.initial, errorMessage: ''));
          });
        }
      },
      child: BlocBuilder<CreateJoinApplyBloc, CreateJoinApplyState>(
        builder: (context, state) {
          return Scaffold(
            body: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: switch (state.applyStatus) {
                  ApplyStatus.unMounted =>
                    const Center(child: CircularProgressIndicator()),
                  ApplyStatus.appliedBefore => Center(
                        child: Text(
                      "이미 지원하였습니다",
                      style: context.textTheme.displaySmall,
                    )),
                  ApplyStatus.alreadyClosed => Center(
                        child: Text(
                      "이미 마감되었습니다",
                      style: context.textTheme.displaySmall,
                    )),
                  ApplyStatus.canApply => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "참가신청서",
                              style: context.textTheme.titleLarge,
                            ),
                            const Spacer(),
                            IconButton(
                                onPressed: state.status == Status.initial
                                    ? _handleSubmit
                                    : null,
                                icon: const Icon(Icons.check))
                          ],
                        ),
                        8.height,
                        Text(
                          "간단한 인사말을 남겨주세요",
                          style: context.textTheme.labelSmall,
                        ),
                        12.height,
                        TextField(
                          maxLength: _maxLength,
                          minLines: 3,
                          maxLines: 10,
                          controller: _controller,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                        )
                      ],
                    ),
                }),
          );
        },
      ),
    );
  }
}
