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
    "eyJ4NXQiOiJPRE5tWkRFMll6UTRNVEkxTVRZME1tSmhaR00yTUdWa1lUZGhOall5TWpnM01XTmpNalJqWWpnMll6bGpNRGRsWWpZd05ERmhZVGd6WkRoa1lUVm1OZyIsImtpZCI6Ik9ETm1aREUyWXpRNE1USTFNVFkwTW1KaFpHTTJNR1ZrWVRkaE5qWXlNamczTVdOak1qUmpZamcyWXpsak1EZGxZall3TkRGaFlUZ3paRGhrWVRWbU5nX1JTMjU2IiwiYWxnIjoiUlMyNTYifQ.eyJzdWIiOiJ0b2F2aW5hYW5kckBnbWFpbC5jb21AY2FyYm9uLnN1cGVyIiwiYXV0IjoiQVBQTElDQVRJT04iLCJhdWQiOiJCZmpnWGRSN1phVUdmeHBlU2lYWjZaN1FMaUFhIiwibmJmIjoxNjU4ODUyMDA0LCJhenAiOiJCZmpnWGRSN1phVUdmeHBlU2lYWjZaN1FMaUFhIiwic2NvcGUiOiJFWFRfSU5UX01WT0xBX1NDT1BFIiwiaXNzIjoiaHR0cHM6XC9cL2FwaW0ucHJlcC50ZWxtYS5tZzo5NDQzXC9vYXV0aDJcL3Rva2VuIiwiZXhwIjoxNjU4ODU1NjA0LCJpYXQiOjE2NTg4NTIwMDQsImp0aSI6ImVkYTliOWRlLTlhMzItNDhhYy1hN2IzLWVlNGU3NjRjNDhiOSJ9.ZIr_BtbdMauCoZbZJ6sgEmDYz5YdqQw29M5idcwGlDsUazGqH6w6k6jWqTFDXREp-jwcT7bB_vMatA2-rmz7YpRMrspwZAjCfotCKWiATBUKb3OcsKr5HL9BNVElwsKEjW8Fsfyc9eRSniIBh-3Xk3VFh5ZFl_3ar3sRxxoL9O5-UcSZvjh19faBNg_wsQTT0DRu8pcAfGWaiIoZ1aLLytI0THp6OPy4N7uOH5v3A1Gly1nfuZMqSMeinVXb8d2UmxY-8LKlq6DvN-wacmT8LBHaw5-kZpkkewhpL2G6HNNW-mUf2eVDC0W0g6GffcwsgJV86mluQmbEiHbKQRIkLA";

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
