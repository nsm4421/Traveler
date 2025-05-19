import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:karma/dependency_injection.dart';

import 'package:karma/domain/entities/entities.export.dart';
import 'package:karma/presentation/providers/providers.export.dart';
import 'package:karma/shared/constants/coverage.constant.dart';

part 's_product_modeling.dart';
part 'f_search_coverage.dart';
part 'add_coverage_modal/f_add_coverage_modal.dart';
part 'add_coverage_modal/w_select_repr_coverage_step.dart';
part 'add_coverage_modal/w_filter_coverages.dart';
part 'add_coverage_modal/w_select_properties.dart';
part 'add_coverage_modal/w_on_save_coverage.dart';

class ProductModeingPage extends StatelessWidget {
  const ProductModeingPage(this._product, {super.key});

  final UnitProductHistoryEntity _product;

  @override
  Widget build(BuildContext context) {
    return ProductModelingScreen(_product);
  }
}
