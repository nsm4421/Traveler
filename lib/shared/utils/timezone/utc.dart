import 'package:injectable/injectable.dart';

@lazySingleton
mixin class UtcMixIn {
  String get now => DateTime.now().toUtc().toString();
}
