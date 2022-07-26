class TransactionResult {
  TransactionResult({required this.success});
  bool success;
  List<String>? _errors;
  Map<String, dynamic>? _payload;

  set setErrors(List<String> errorList) {
    _errors = errorList;
    success = false;
  }

  set setPayload(Map<String, dynamic> payload) {
    _payload = payload;
  }

  get getTransactionPayload => _payload;
  get getTransactionErrors => _errors;

  void failed() {
    success = false;
  }
}
