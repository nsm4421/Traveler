class MetaDataModel {
  final String id;
  final String? created_at;
  final String? updated_at;
  final String? removed_at;
  final String? created_by;
  final String? updated_by;

  MetaDataModel(
      {required this.id,
      required this.created_at,
      required this.updated_at,
      this.removed_at,
      this.created_by,
      this.updated_by});
}
