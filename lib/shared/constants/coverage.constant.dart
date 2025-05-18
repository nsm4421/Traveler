enum CoverageCategory {
  injure("상해"),
  disease("질병"),
  injureAndDisease("상해및질병"),
  cost("비용");

  final String label;

  const CoverageCategory(this.label);
}

// 담보조건 유형
enum CoverageConditionMenu {
  renewal(options: ['00', '01'], labels: ['갱신형 미운영', '갱신형']),
  specialCondition(options: ['00', '01'], labels: ['특조부 미운영', '특조부 운영']),
  convertable(options: ['00', '01'], labels: ['전환형 미운영', '전환형 운영']),
  beforBirth(options: ['00', '01'], labels: ['출생전담보 미운영', '출생전담보 운영']),
  addCov(options: ['00', '01'], labels: ['추가담보 미운영', '추가담보 운영']),
  ;

  final List<String> options;
  final List<String> labels;

  const CoverageConditionMenu({required this.options, required this.labels});
}
