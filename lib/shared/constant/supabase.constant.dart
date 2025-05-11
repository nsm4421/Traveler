enum Tables {
  benefit(name: 'benefits', description: '급부'),
  reprCoverage(name: 'repr_covs', description: '대표담보');

  final String name;
  final String description;

  const Tables({required this.name, required this.description});
}

enum Rpcs {
  fetchAllGroupedReprCoverages("FETCH_ALL_GROUPED_REPR_COV",
      description: '대표담보코드 테이블의 각 행을 요약해서 반환하는 RPC함수');

  final String name;
  final String? description;

  const Rpcs(this.name, {this.description});
}
