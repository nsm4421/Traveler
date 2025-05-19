import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
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
        reprCoverageCandidates: [
          ReprCoverageWithPropertiesEntity(reprCoverage: reprCoverage),
        ],
        reprCoveragesSelected: []));
  }

  void unSelectReprCoverage() {
    emit(state.copyWith(
        reprCoverage: null,
        step: AddCoverageStep.selectReprCoverage,
        reprCoverageCandidates: [],
        reprCoveragesSelected: []));
  }

  void goToFilterStep() {
    emit(state.copyWith(
      step: AddCoverageStep.filterCoverages,
    ));
  }

  void goToSaveStep() {
    List<ProductCoverageEntity> coverages = [];
    for (final reprCoverageWithProperty in state.reprCoveragesSelected) {
      for (final gurantee in reprCoverageWithProperty.reprCoverage.gurantees) {
        coverages.add(ProductCoverageEntity.fromReprCoverageWithProperty(
            reprCoverageWithProperty: reprCoverageWithProperty,
            guranteeCode: gurantee.code));
      }
    }
    coverages = List.generate(
        coverages.length, (index) => coverages[index].copyWith(seq: index + 1));
    emit(state.copyWith(
        step: AddCoverageStep.save, productCoveragesToAdd: coverages));
  }

  void checkOption({
    bool? renewalChecked,
    bool? specialConditionChecked,
    bool? convertableChecked,
    bool? beforeBirthChecked,
    bool? addCovChecked,
  }) {
    emit(state.copyWith(
      renewalChecked: renewalChecked ?? state.renewalChecked,
      specialConditionChecked:
          specialConditionChecked ?? state.specialConditionChecked,
      convertableChecked: convertableChecked ?? state.convertableChecked,
      beforeBirthChecked: beforeBirthChecked ?? state.beforeBirthChecked,
      addCovChecked: addCovChecked ?? state.addCovChecked,
    ));
    List<ReprCoverageWithPropertiesEntity> canditates = [
      ReprCoverageWithPropertiesEntity(reprCoverage: state.reprCoverage!),
    ];
    if (state.renewalChecked) {
      canditates = [
        ...canditates,
        ...canditates.map((e) => e.copyWith(isRenewal: true))
      ];
    } else {
      canditates.removeWhere((e) => e.isRenewal);
    }
    if (state.addCovChecked) {
      canditates = [
        ...canditates,
        ...canditates.map((e) => e.copyWith(isAddCov: true))
      ];
    } else {
      canditates.removeWhere((e) => e.isAddCov);
    }
    if (state.convertableChecked) {
      canditates = [
        ...canditates,
        ...canditates.map((e) => e.copyWith(isConvertable: true))
      ];
    } else {
      canditates.removeWhere((e) => e.isConvertable);
    }
    if (state.specialConditionChecked) {
      canditates = [
        ...canditates,
        ...canditates.map((e) => e.copyWith(isSpecialConditioned: true))
      ];
    } else {
      canditates.removeWhere((e) => e.isSpecialConditioned);
    }
    if (state.beforeBirthChecked) {
      canditates = [
        ...canditates,
        ...canditates.map((e) => e.copyWith(isBeforeBirth: true))
      ];
    } else {
      canditates.removeWhere((e) => e.isBeforeBirth);
    }
    emit(state.copyWith(
        reprCoverageCandidates: _getSortedCoverages(canditates)));
  }

  void addCoverage(ReprCoverageWithPropertiesEntity coverage) {
    emit(state.copyWith(
        reprCoverageCandidates: _getSortedCoverages(state.reprCoverageCandidates
            .where((e) => !e.eq(coverage))
            .toList()),
        reprCoveragesSelected: _getSortedCoverages(
          [...state.reprCoveragesSelected, coverage],
        )));
  }

  void popCoverages(ReprCoverageWithPropertiesEntity coverage) {
    print(coverage.name);
    emit(state.copyWith(
      reprCoverageCandidates:
          _getSortedCoverages([...state.reprCoverageCandidates, coverage]),
      reprCoveragesSelected: _getSortedCoverages(
          state.reprCoveragesSelected.where((e) => !e.eq(coverage)).toList()),
    ));
  }

  List<ReprCoverageWithPropertiesEntity> _getSortedCoverages(
      List<ReprCoverageWithPropertiesEntity> coverages) {
    final $coverages = [...coverages];
    $coverages.sort((a, b) => ((a.isRenewal & !b.isRenewal) ||
            (a.isSpecialConditioned & !b.isSpecialConditioned) ||
            (a.isBeforeBirth & !b.isBeforeBirth) ||
            (a.isAddCov & !b.isAddCov) ||
            (a.isConvertable & !b.isConvertable))
        ? 1
        : 0);
    return $coverages;
  }
}
