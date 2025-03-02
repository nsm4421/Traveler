import 'package:module/data/model/export.dart';
import 'package:module/shared/shared.export.dart';

class ApplyEntity extends BaseEntity {
  final String uid;
  final String planId;
  final String content;

  ApplyEntity(
      {required super.id,
      required super.createdAt,
      required this.uid,
      required this.planId,
      required this.content});

  factory ApplyEntity.from(ApplyModel model) => ApplyEntity(
      id: model.id,
      createdAt: DateTime.tryParse(model.created_at),
      uid: model.uid,
      planId: model.plan_id,
      content: model.content);
}
