/// 담보분류
enum CoverageCategory {
  injure("상해"),
  disease("질병"),
  injureAndDisease("상해및질병"),
  cost("비용");

  final String label;

  const CoverageCategory(this.label);
}

/** 담보유형
 * - singleBenefit : 담보-급부 (ex.상해사망)
 * - multipleDetailCoverage : 담보-세부보장N (ex.수술비1-5종)
 * - multipleBenefit : 담보-급부N (ex.유사암진단비)
 */
enum CoverageType {
  singleBenefit(label: '단순담보', description: '담보1-급부1 (ex.상해사망)'),
  multipleDetailedCoverage(
      label: '세부보장多', description: '담보1-세부보장N (ex.수술비1-5종)'),
  multipleBenefit(label: '급부多', description: '담보1-급부N (ex.유사암진단비)'),
  ;

  final String label;
  final String description;

  const CoverageType({required this.label, required this.description});
}
