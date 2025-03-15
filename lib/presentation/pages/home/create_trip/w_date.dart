part of 's_create_trip.dart';

class SelectDateWidget extends StatefulWidget {
  const SelectDateWidget({super.key});

  @override
  State<SelectDateWidget> createState() => _SelectDateWidgetState();
}

class _SelectDateWidgetState extends State<SelectDateWidget> {
  _handleOnChange(DateRangePickerSelectionChangedArgs args) {
    try {
      final startDate = args.value.startDate as DateTime;
      final endDate = args.value.endDate as DateTime;
      context
          .read<CreateTripPlanCubit>()
          .initState(startDate: startDate, endDate: endDate);
    } catch (error) {
      log('select date fails error:${error.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Icon(Icons.calendar_today_outlined),
            12.width,
            Text("여행일자",
                style: context.textTheme.titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold)),
            const Spacer(),
            ElevatedButton(onPressed: () async {
              await showModalBottomSheet(
                  context: context,
                  builder: (_) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 12),
                      child: SfDateRangePicker(
                          onSelectionChanged: _handleOnChange,
                          selectionMode: DateRangePickerSelectionMode.range,
                          initialSelectedRange: PickerDateRange(
                              context
                                  .read<CreateTripPlanCubit>()
                                  .state
                                  .startDate,
                              context
                                  .read<CreateTripPlanCubit>()
                                  .state
                                  .endDate)),
                    );
                  });
            }, child: BlocBuilder<CreateTripPlanCubit, CreateTripPlanState>(
              builder: (context, state) {
                return Text(
                  "${state.startDate.yyyymmdd} ~ ${state.endDate.yyyymmdd}",
                  overflow: TextOverflow.ellipsis,
                  style: context.textTheme.labelLarge,
                );
              },
            ))
          ],
        ),
      ],
    );
  }
}
