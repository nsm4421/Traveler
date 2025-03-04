import 'package:flutter/material.dart';
import 'package:module/domain/entity/export.dart';
import 'package:module/shared/shared.export.dart';

abstract interface class JourneyRepository {
  Future<void> create({
    required String content,
    required Country country,
    required DateTimeRange dateTimeRange,
  });

  Future<List<JourneyEntity>> fetch();

  Future<void> modify({
    required String id,
    required String content,
    required Country country,
    required DateTimeRange dateTimeRange,
  });

  Future<void> delete(String id);
}
