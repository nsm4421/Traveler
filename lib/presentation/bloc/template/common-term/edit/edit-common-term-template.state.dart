part of 'edit-common-term-template.cubit.dart';

class EditCommonTermTemplateState extends BaseState {
  final ArticleEntity article;

  EditCommonTermTemplateState(
      {super.status, super.message, required this.article});

  @override
  EditCommonTermTemplateState copyWith(
      {Status? status, String? message, ArticleEntity? article}) {
    return EditCommonTermTemplateState(
      status: status ?? this.status,
      message: message ?? this.message,
      article: article ?? this.article,
    );
  }
}
