part of 'cubit.dart';

class CreateJourneyState extends BaseState {
  final String title;
  final String content;
  final Country country;
  final DateTime? startDate;
  final DateTime? endDate;

  CreateJourneyState({
    super.status = Status.initial,
    super.errorMessage = '',
    this.title = '',
    this.content = '',
    this.country = Country.korea,
    this.startDate,
    this.endDate,
  });

  CreateJourneyState copyWith(
      {Status? status,
      String? errorMessage,
      String? title,
      String? content,
      Country? country}) {
    return CreateJourneyState(
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage,
        title: title ?? this.title,
        content: content ?? this.content,
        country: country ?? this.country,
        startDate: this.startDate,
        endDate: this.endDate);
  }

  CreateJourneyState copyWithDate(
      {DateTime? startDate, DateTime? endDate}) {
    return CreateJourneyState(
        status: this.status,
        errorMessage: this.errorMessage,
        title: this.title,
        content: this.content,
        country: this.country,
        startDate: startDate,
        endDate: endDate);
  }
}
