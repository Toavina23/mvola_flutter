class TransactionResult {
  TransactionResult({required this.success});
  bool success;
  List<String>? _errors;

  set setErrors(List<String> errorList) {
    _errors = errorList;
    success = false;
  }

  get getTransactionErrors => _errors;

  void failed() {
    success = false;
  }
}
