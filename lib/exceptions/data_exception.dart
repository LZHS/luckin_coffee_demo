class DataException implements Exception {
  final String message;
  final String errInfo;

  const DataException(this.message, this.errInfo);
}
