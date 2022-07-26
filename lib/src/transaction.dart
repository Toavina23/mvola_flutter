import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mvola_flutter/mvola_dio.config.dart';
import 'package:mvola_flutter/src/transaction_result.dart';
import 'package:mvola_flutter/src/transaction_status.dart';
import 'package:sprintf/sprintf.dart';
import 'package:usage/uuid/uuid.dart';

///Represent a transaction
class Transaction {
  Transaction(
      {required this.amount,
      required this.customerNumber,
      required this.descriptionText});

  final double amount;
  String? partnerTransactionRef;
  final String customerNumber;
  String merchantNumber =
      env == "DEV" ? accountDevIdentifier : accountProdIdentifier;
  String partnerName = companyName;
  String? originalTransactionRef;
  String currency = "Ar";
  final String descriptionText;

  String? serverCorrelationId;

  Future<TransactionResult> make() async {
    TransactionResult transactionResult = TransactionResult(success: true);
    BaseOptions dioBaseOptions = env == "DEV" ? devConfig : prodConfig;
    Dio dio = Dio(dioBaseOptions);
    dio.options.headers["X-CorrelationID"] = Uuid().generateV4();
    try {
      final response = await dio.post(transactionInitUrl,
          data: jsonEncode(buildTransactionData()));
      if (response.statusCode != 202) {
        transactionResult.failed();
      } else {
        serverCorrelationId = response.data["serverCorrelationId"];
      }
    } on DioError catch (e) {
      transactionResult.failed();
    }
    return transactionResult;
  }

  Future<TransactionStatus?> getTransactionStatus() async {
    BaseOptions dioBaseOptions = env == "DEV" ? devConfig : prodConfig;
    Dio dio = Dio(dioBaseOptions);
    dio.options.headers["X-CorrelationID"] = Uuid().generateV4();
    try {
      final response =
          await dio.get("$transactionStatusUrl$serverCorrelationId");
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return TransactionStatus(
            status: response.data["status"],
            serverCorrelationId: response.data["serverCorrelationId"],
            objectReference: response.data["objectReference"]);
      }
    } catch (e) {
      print(e);
      return null;
    }
    return null;
  }

  String removeUnavailableCharacters(String original) {
    String result = original.replaceAll(RegExp(r'[^A-Za-z0-9 \-\._,]'), '');
    return result;
  }

  String createTransactionReference() {
    return Uuid().generateV4().replaceAll(RegExp(r'[^A-Za-z0-9]'), '');
  }

  String formatTransactionDate(DateTime dateTime) {
    String format = "%s-%02d-%02dT%s:%s:%s.%sZ";
    return sprintf(format, [
      dateTime.year,
      dateTime.month,
      dateTime.day,
      dateTime.hour,
      dateTime.minute,
      dateTime.second,
      dateTime.millisecond
    ]);
  }

  Map<String, dynamic> buildTransactionData() {
    Map<String, dynamic> data = {};
    data.addAll({
      "amount": amount.toString().split(".")[0],
      "currency": currency,
      "descriptionText": removeUnavailableCharacters(descriptionText),
      "requestDate": formatTransactionDate(DateTime.now()),
      "requestingOrganisationTransactionReference":
          createTransactionReference(),
      "debitParty": [
        {"key": "msisdn", "value": customerNumber}
      ],
      "creditParty": [
        {"key": "msisdn", "value": merchantNumber}
      ],
      "metadata": [
        {
          "key": "partnerName",
          "value": removeUnavailableCharacters(partnerName)
        },
      ]
    });
    if (originalTransactionRef != null) {
      data.addAll({"originalTransactionReference": originalTransactionRef!});
    }
    return data;
  }
}
