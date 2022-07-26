import 'package:dio/dio.dart';

/// configuration pour les requêtes vers l'api mvola
const transactionInitUrl = "/mvola/mm/transactions/type/merchantpay/1.0.0/";
const transactionDetailsUrl = "/mvola/mm/transactions/type/merchantpay/1.0.0/";
const transactionStatusUrl =
    "/mvola/mm/transactions/type/merchantpay/1.0.0/status/";

///Put here the state of you app
///This is used to determine what configurations should be used by dio
///Put DEV for development mode and PROD for production mode
const env = "DEV";

///Put here the api token of your app generated on mvola's devportal
const mvolaProdApiToken = "";
const mvolaDevApiToken =
    "eyJ4NXQiOiJPRE5tWkRFMll6UTRNVEkxTVRZME1tSmhaR00yTUdWa1lUZGhOall5TWpnM01XTmpNalJqWWpnMll6bGpNRGRsWWpZd05ERmhZVGd6WkRoa1lUVm1OZyIsImtpZCI6Ik9ETm1aREUyWXpRNE1USTFNVFkwTW1KaFpHTTJNR1ZrWVRkaE5qWXlNamczTVdOak1qUmpZamcyWXpsak1EZGxZall3TkRGaFlUZ3paRGhrWVRWbU5nX1JTMjU2IiwiYWxnIjoiUlMyNTYifQ.eyJzdWIiOiJ0b2F2aW5hYW5kckBnbWFpbC5jb21AY2FyYm9uLnN1cGVyIiwiYXV0IjoiQVBQTElDQVRJT04iLCJhdWQiOiJCZmpnWGRSN1phVUdmeHBlU2lYWjZaN1FMaUFhIiwibmJmIjoxNjU4ODYxNzE5LCJhenAiOiJCZmpnWGRSN1phVUdmeHBlU2lYWjZaN1FMaUFhIiwic2NvcGUiOiJFWFRfSU5UX01WT0xBX1NDT1BFIiwiaXNzIjoiaHR0cHM6XC9cL2FwaW0ucHJlcC50ZWxtYS5tZzo5NDQzXC9vYXV0aDJcL3Rva2VuIiwiZXhwIjoxNjU4ODY1MzE5LCJpYXQiOjE2NTg4NjE3MTksImp0aSI6IjJlZTU5MTU0LWJiNTMtNDUwMC1hM2FjLTU2NzIyZDBhOWY3MiJ9.Ns5YgKH1bqLW5s2w6Gg8NAdpxDP-GB1ca4hJlMLkTc2rHCg0dO0gC05Bzy3Vongb8DSm7k-ZjxdsbG90B8YLW0g8EgV8ZRjlMGPu-bOjGzGLG149mk_PDd_GMeByGXRLedqqflqRvocWacEVWUr41jBpDzxTi_mqNJcINicjNe8R2KRsWpUHlni-935rnqRUfn9K_FnRxtYBoWlQxMyglPfCEq-G5yXVj0kParYQMTQsXYCJzNwPPnTCt3ohArDfUqWko5qdMQfFv_gyAFDZsD05vYO2NFQQKsLga2TYbrmdVCcxGalBZLVpzCrw5G9UuSwVUKXGt9JpImzpfQ2peQ";

///Put here your company's phone number
const accountProdIdentifier = "";
const accountDevIdentifier = "0343500004";

///Put here your company's name
const companyName = "App";

///Production configuration
final prodConfig = BaseOptions(baseUrl: "https://api.mvola.mg/", headers: {
  "Authorization": "Bearer $mvolaProdApiToken",
  "Version": "1.0",
  "UserLanguage": "FR",
  "UserAccountIdentifier": "msisdn;$accountProdIdentifier",
  "Content-Type": "application/json",
  "PartnerName": companyName,
  "Cache-Control": "no-cache",
});

///Sandbox mode configuration
final devConfig = BaseOptions(baseUrl: "https://devapi.mvola.mg/", headers: {
  "Authorization": "Bearer $mvolaDevApiToken",
  "Version": "1.0",
  "UserLanguage": "FR",
  "UserAccountIdentifier": "msisdn;$accountDevIdentifier",
  "Content-Type": "application/json",
  "PartnerName": companyName,
  "Cache-Control": "no-cache",
});
