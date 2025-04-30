enum Team {
  product(id: '1', name: '장기상품파트'),
  enroll(id: '2', name: '청약파트'),
  ;

  final String id;
  final String name;

  const Team({required this.id, required this.name});
}
