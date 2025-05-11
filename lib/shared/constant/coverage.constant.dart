/// 담보분류
enum CoverageCategory {
  injure(label: "상해", value: 'INJURE'),
  disease(label: "질병", value: 'DISEASE'),
  injureAndDisease(label: "상해및질병", value: 'INJURE_AND_DISEASE'),
  cost(label: "비용", value: 'COST');

  final String label; // 사용자에게 보여줄 텍스트
  final String value; // DB에 저장할 텍스트

  const CoverageCategory({required this.label, required this.value});
}

/** 담보유형
 * - singleBenefit : 담보-급부 (ex.상해사망)
 * - multipleDetailCoverage : 담보-세부보장N (ex.수술비1-5종)
 * - multipleBenefit : 담보-급부N (ex.유사암진단비)
 */
enum CoverageType {
  singleBenefit(
      label: '단순담보', value: 'SINGLE_BENEFIT', description: '급부1 (ex.상해사망)'),
  multipleDetailedCoverage(
      label: '세부보장多',
      value: 'MULTILPLE_DETAILED_COVERAGE',
      description: '세부보장N (ex.수술비1-5종)'),
  multipleBenefit(
      label: '급부多', value: 'MULTILPLE_BENEFIT', description: '급부N (ex.유사암진단비)'),
  ;

  final String label; // 사용자에게 보여줄 텍스트
  final String value; // DB에 저장할 텍스트
  final String description; // 툴팁을 통해 보여줄 세부설명

  const CoverageType(
      {required this.label, required this.value, required this.description});
}
