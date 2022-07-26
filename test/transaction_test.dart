import 'package:flutter_test/flutter_test.dart';
import 'package:mvola_flutter/src/transaction.dart';
import 'package:mvola_flutter/src/transaction_result.dart';
import 'package:mvola_flutter/src/transaction_status.dart';

void main() {
  group('Transaction', () {
    test("result string should not contain special character", () {
      final transaction = Transaction(
          amount: 1000,
          customerNumber: "034000000",
          descriptionText: "this is a description");
      String cleaned = transaction.removeUnavailableCharacters(" @()#-._,");
      expect(cleaned, " -._,");
    });
    test("the transaction reference length should not be greater than 50", () {
      final transaction = Transaction(
          amount: 100000000,
          customerNumber: "034000000",
          descriptionText: "this is a description");
      String transactionRef = transaction.createTransactionReference();
      expect(transactionRef.length, lessThanOrEqualTo(50));
    });
    test("the transaction currency should be Ar", () {
      final transaction = Transaction(
          amount: 100000000,
          customerNumber: "034000000",
          descriptionText: "this is a description");
      final data = transaction.buildTransactionData();
      expect(data["currency"], "Ar");
    });

    test("transanction date format should be valid", () {
      final transaction = Transaction(
          amount: 2000,
          customerNumber: "034350003",
          descriptionText: "this is a description");
      DateTime dateTime = DateTime(2022, 7, 23, 12, 45, 53, 223);
      String formatedDate = transaction.formatTransactionDate(dateTime);
      expect(formatedDate, "2022-07-23T12:45:53.223Z");
    });

    test("transaction result status should be success", () async {
      final transaction = Transaction(
          amount: 2000,
          customerNumber: "0343500003",
          descriptionText: "this is a description");
      TransactionResult result = await transaction.make();
      expect(result.success, true);
    });

    test("transaction status code should be completed or pending", () async {
      final transaction = Transaction(
          amount: 2000,
          customerNumber: "0343500003",
          descriptionText: "this is a description");
      TransactionResult result = await transaction.make();
      TransactionStatus? transationStatus =
          await transaction.getTransactionStatus();
      bool valid = false;
      if (transationStatus != null) {
        valid = transationStatus.status == "pending" ||
            transationStatus.status == "completed";
        print(transationStatus.status);
      }
      expect(valid, true);
    });
  });
}
