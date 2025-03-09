part of 'cubit.dart';

class CreateTripPlanState extends BaseState {
  final String title;
  final String content;
  late final Country country;
  final String description;
  final int minHeadCount;
  final int maxHeadCount;
  late final List<String> hashtags;
  late final DateTime startDate;
  late final DateTime endDate;

  CreateTripPlanState({
    super.status = Status.initial,
    super.errorMessage = '',
    this.title = '',
    this.content = '',
    this.description = '',
    this.minHeadCount = 2,
    this.maxHeadCount = 5,
    List<String>? hashtags,
    Country? country,
    DateTime? startDate,
    DateTime? endDate,
  }) {
    this.hashtags = hashtags ?? [];
    this.country = country ?? Country.korea;
    this.startDate = startDate ?? DateTime.now();
    this.endDate = endDate ?? DateTime.now().add(5.durationInDays);
  }

  CreateTripPlanState copyWith({
    Status? status,
    String? errorMessage,
    String? title,
    String? content,
    int? minHeadCount,
    int? maxHeadCount,
    List<String>? hashtags,
    Country? country,
    DateTime? startDate,
    DateTime? endDate,
  }) {
    return CreateTripPlanState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      title: title ?? this.title,
      content: content ?? this.content,
      minHeadCount: minHeadCount ?? this.minHeadCount,
      maxHeadCount: maxHeadCount ?? this.maxHeadCount,
      hashtags: hashtags ?? this.hashtags,
      country: country ?? this.country,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
    );
  }
}
