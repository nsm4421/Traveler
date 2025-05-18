import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:injectable/injectable.dart';
import 'package:karma/shared/shared.export.dart';

import 'package:karma/domain/entities/entities.export.dart';

part 'edit_repr_coverage.state.dart';

part 'edit_repr_coverage.cubit.g.dart';

@injectable
class EditReprCoverageCubit extends Cubit<EditReprCoverageState> {
  final ReprCoverageEntity? _initValue;

  ReprCoverageEntity? get initValue => _initValue;

  EditReprCoverageCubit(@factoryParam this._initValue)
      : super(EditReprCoverageState(gurantees: [
          GuranteeEntity(benefits: [BenefitEntity(benefitRiskCode: '')])
        ])) {
    emit(state.copyWith(
        name: _initValue?.name ?? state.name,
        category: _initValue?.category ?? state.category,
        gurantees: _initValue?.gurantees ?? state.gurantees));
  }
  void updateState(
      {String? name,
      CoverageCategory? category,
      List<GuranteeEntity>? gurantees}) {
    emit(state.copyWith(
        name: name ?? state.name,
        category: category ?? state.category,
        gurantees: gurantees ?? state.gurantees));
  }

  void insertGurantee() {
    if (state.gurantees.isEmpty) {
      emit(state.copyWith(gurantees: [GuranteeEntity()]));
    } else {
      emit(state.copyWith(
          gurantees: _getGuranteeWithCodeFomated([
        ...state.gurantees,
        GuranteeEntity(benefits: [BenefitEntity()])
      ])));
    }
  }

  void Function() removeGuranteeByCode(String code) => () {
        emit(state.copyWith(
            gurantees: _getGuranteeWithCodeFomated(
                state.gurantees.where((e) => e.code != code))));
      };

  void Function() insertBenefit(String code) => () {
        emit(state.copyWith(
            gurantees: state.gurantees
                .map((g) => g.code == code
                    ? g.copyWith(benefits: [
                        ...g.benefits,
                        BenefitEntity(seq: g.benefits.length + 1)
                      ])
                    : g)
                .toList()));
      };

  void Function() removeBenefitByCodeAndSeq(
          {required String code, required int seq}) =>
      () {
        emit(state.copyWith(
            gurantees: state.gurantees
                .map((g) => g.code == code
                    ? g.copyWith(
                        benefits: _getBenefitWithSeqFormated(
                            g.benefits.where((b) => b.seq != seq)))
                    : g)
                .toList()));
      };

  /// 세부보장코드 포매팅
  /// 세부보장이 1개인 경우 00
  /// 세부보장이 여러개인 경우 01,02, ...
  List<GuranteeEntity> _getGuranteeWithCodeFomated(
      Iterable<GuranteeEntity> gurantees) {
    if (gurantees.isEmpty) {
      return [];
    } else if (gurantees.length == 1) {
      return [gurantees.first.copyWith(code: '00')];
    } else {
      return gurantees.indexed
          .map(
              (e) => e.$2.copyWith(code: (e.$1 + 1).toString().padLeft(2, '0')))
          .toList();
    }
  }

  /// 급부순번 포매팅
  List<BenefitEntity> _getBenefitWithSeqFormated(
      Iterable<BenefitEntity> benefits) {
    if (benefits.isEmpty) {
      return [];
    } else if (benefits.length == 1) {
      return [benefits.first.copyWith(seq: 1)];
    } else {
      return benefits.indexed.map((e) => e.$2.copyWith(seq: e.$1 + 1)).toList();
    }
  }

  Future<void> submit() async {}
}
