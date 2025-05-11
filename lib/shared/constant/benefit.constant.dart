enum BenefitCategory {
  injure(label: "상해", value: 'INJURE'),
  disease(label: "질병", value: 'DISEASE'),
  injureAndDisease(label: "상해및질병", value: 'INJURE_AND_DISEASE'),
  cost(label: "비용", value: 'COST');

  final String label;
  final String value; // DB에 저장할 텍스트

  const BenefitCategory({required this.label, required this.value});
}
