import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DateRangePickerWidget extends StatelessWidget {
  const DateRangePickerWidget(this._onSelectionChanged, {super.key, this.mode = DateRangePickerSelectionMode.range});

  final void Function(DateRangePickerSelectionChangedArgs)? _onSelectionChanged;
  final DateRangePickerSelectionMode mode;

  @override
  Widget build(BuildContext context) {
    return SfDateRangePicker(
      onSelectionChanged: _onSelectionChanged,
      selectionMode: mode,
      initialSelectedRange: PickerDateRange(
        DateTime.now(),
        DateTime.now().add(const Duration(days: 5)),
      ),
    );
  }
}
