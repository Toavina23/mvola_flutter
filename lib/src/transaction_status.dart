class TransactionStatus {
  TransactionStatus(
      {required this.status,
      required this.serverCorrelationId,
      required this.objectReference});
  String status;
  String serverCorrelationId;
  String objectReference;
}
