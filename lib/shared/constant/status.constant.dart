enum Status {
  initial(isReady: true),
  loading,
  pending,
  success(isReady: true),
  error;

  final bool isReady; // emit 메써드 사용가능 수 있는지 여부

  const Status({this.isReady = false});
}
