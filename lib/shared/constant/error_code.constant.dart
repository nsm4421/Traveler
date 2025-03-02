enum ErrorCode {
  notFound(code: 404, description: 'not found'),
  unKnown(code: 9999, description: 'error with unknown clause');

  final int code;
  final String? description;

  const ErrorCode({required this.code, this.description});
}
