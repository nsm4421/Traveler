import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:karma/domain/entities/coverage/product_coverage.entity.dart';
import 'package:karma/domain/entities/entities.export.dart';
import 'package:karma/shared/shared.export.dart';

part 'add_coverage.state.dart';
part 'add_coverage.cubit.g.dart';

@injectable
class AddCoverageCubit extends Cubit<AddCoverageState> {
  final UnitProductHistoryEntity _product;

  AddCoverageCubit(@factoryParam this._product) : super(AddCoverageState());

  void selectReprCoverage(ReprCoverageEntity reprCoverage) {
    emit(state.copyWith(
      reprCoverage: reprCoverage,
      step: AddCoverageStep.selectProperties,
    ));
  }

  void unSelectReprCoverage() {
    emit(state.copyWith(
      reprCoverage: null,
      step: AddCoverageStep.selectReprCoverage,
    ));
  }

  void goToFilterStep() {
    emit(state.copyWith(
      step: AddCoverageStep.filterCoverages,
    ));
  }

  void goToSaveStep() {
    emit(state.copyWith(
      step: AddCoverageStep.save,
    ));
  }
}
