part of '../p_product_modeling.dart';

class AddCoverageModalFragment extends StatelessWidget {
  const AddCoverageModalFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddCoverageCubit, AddCoverageState>(
        builder: (context, state) {
      return switch (state.step) {
        AddCoverageStep.selectReprCoverage => SelectReprCoverageStepWidget(),
        AddCoverageStep.selectProperties => SelectPropertiesStepWidget(),
        AddCoverageStep.filterCoverages => FiterCoverageStepWidget(),
        AddCoverageStep.save => SaveCovereagesStepWidget(),
      };
    });
  }
}
