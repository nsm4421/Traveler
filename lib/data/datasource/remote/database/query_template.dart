import 'package:module/shared/shared.export.dart';

mixin class QueryTemplateMixIn {
  String get joinCreatorQueryTemplateOnSelect =>
      '*, creator:${Tables.users.name}(id, username, sex, born_at, avatar_url)';
}
