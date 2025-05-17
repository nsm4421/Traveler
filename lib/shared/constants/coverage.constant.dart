enum CoverageCategory {
  injure("상해"),
  disease("질병"),
  injureAndDisease("상해및질병"),
  cost("비용");

  final String label;

  const CoverageCategory(this.label);
}
