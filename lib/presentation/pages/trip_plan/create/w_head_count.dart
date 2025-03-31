part of 'p_create_trip_plan.dart';

class MaxHeadCountWidget extends StatefulWidget {
  const MaxHeadCountWidget({super.key});

  @override
  State<MaxHeadCountWidget> createState() => _MaxHeadCountWidgetState();
}

class _MaxHeadCountWidgetState extends State<MaxHeadCountWidget> {
  static const _minValue = 2;
  static const _maxValue = 8;

  late RangeValues _currentRange;

  @override
  void initState() {
    super.initState();
    final minHeadCount = context.read<CreateTripPlanCubit>().state.minHeadCount;
    final maxHeadCount = context.read<CreateTripPlanCubit>().state.maxHeadCount;
    _currentRange =
        RangeValues(minHeadCount.toDouble(), (minHeadCount + maxHeadCount) / 2);
  }

  _handleOnChange(RangeValues values) {
    setState(() {
      _currentRange = RangeValues(
          values.start.toInt().toDouble(), values.end.toInt().toDouble());
    });
    context.read<CreateTripPlanCubit>().initState(
        minHeadCount: _currentRange.start.toInt(),
        maxHeadCount: _currentRange.end.toInt());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.people_alt_outlined),
            12.width,
            Text("인원수",
                style: context.textTheme.titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold)),
            const Spacer(),
            Text(
              '${_currentRange.start.toInt()} ~ ${_currentRange.end.toInt()}명',
            )
          ],
        ),
        8.height,
        RangeSlider(
          values: _currentRange,
          min: _minValue.toDouble(),
          max: _maxValue.toDouble(),
          divisions: _maxValue - _minValue,
          labels: RangeLabels(
            _currentRange.start.toInt().toString(),
            _currentRange.end.toInt().toString(),
          ),
          onChanged: _handleOnChange,
        ),
      ],
    );
  }
}
