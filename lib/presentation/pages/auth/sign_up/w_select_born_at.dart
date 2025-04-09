part of 'p_sign_up.dart';

class SelectBornAtWidget extends StatelessWidget {
  const SelectBornAtWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(builder: (context, state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.date_range_rounded),
              12.width,
              Text("생년월일",
                  style: context.textTheme.titleMedium
                      ?.copyWith(fontWeight: FontWeight.bold)),
              const Spacer(),
              Text(state.bornAt.yyyymmdd)
            ],
          ),
          8.height,
          DateInputTextField(onChange: (dt) {
            context.read<SignUpCubit>().update(bornAt: dt);
          }),
        ],
      );
    });
  }
}
