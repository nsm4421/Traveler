enum Status {
  initial,
  loading,
  success,
  error;
}

abstract class AbsBlocState {
  final Status status;
  final String message;

  AbsBlocState({required this.status, required this.message});
}
