part of 's_create_journey.dart';

class SelectDateFragment extends StatefulWidget {
  const SelectDateFragment({super.key});

  @override
  State<SelectDateFragment> createState() => _SelectDateFragmentState();
}

class _SelectDateFragmentState extends State<SelectDateFragment> {
  String _handleFormatDate(DateTime? date) =>
      date == null ? "NONE" : '${date.year}-${date.month}-${date.day}';

  _onDateChanged(args) {
    try {
      if (args.value == null) return;
      final startDate = args.value.startDate;
      final endDate = args.value.endDate;
      context
          .read<CreateJourneyCubit>()
          .updateDate(startDate: startDate, endDate: endDate ?? startDate);
    } catch (error) {
      log('select date fails|${error.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateJourneyCubit, CreateJourneyState>(
        builder: (context, state) {
      return Column(
        children: [
          SfDateRangePicker(
            onSelectionChanged: _onDateChanged,
            selectionMode: DateRangePickerSelectionMode.range,
            initialSelectedRange: PickerDateRange(
              DateTime.now(),
              DateTime.now().add(5.durationInDays),
            ),
          ),
          Text("Start Date : ${_handleFormatDate(state.startDate)}"),
          Text("End Date : ${_handleFormatDate(state.endDate)}"),
        ],
      );
    });
  }
}
