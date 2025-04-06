import 'package:injectable/injectable.dart';

@lazySingleton
mixin class UtcMixIn {
  DateTime get nowDt => DateTime.now().toUtc();
}
