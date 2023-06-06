import 'dart:convert';

List<ShippingResponseModel> shippingResponseModelFromJson(String str) => List<ShippingResponseModel>.from(json.decode(str).map((x) => ShippingResponseModel.fromJson(x)));

String shippingResponseModelToJson(List<ShippingResponseModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ShippingResponseModel {
  ShippingResponseModel({
    required this.carrierCode,
    required this.methodCode,
    required this.carrierTitle,
    required this.methodTitle,
    required this.amount,
    required this.baseAmount,
    required this.available,
    required this.errorMessage,
    required this.priceExclTax,
    required this.priceInclTax,
  });

  String carrierCode;
  String methodCode;
  String carrierTitle;
  String methodTitle;
  int amount;
  int baseAmount;
  bool available;
  String errorMessage;
  int priceExclTax;
  int priceInclTax;

  factory ShippingResponseModel.fromJson(Map<String, dynamic> json) => ShippingResponseModel(
    carrierCode: json["carrier_code"],
    methodCode: json["method_code"],
    carrierTitle: json["carrier_title"],
    methodTitle: json["method_title"],
    amount: json["amount"],
    baseAmount: json["base_amount"],
    available: json["available"],
    errorMessage: json["error_message"],
    priceExclTax: json["price_excl_tax"],
    priceInclTax: json["price_incl_tax"],
  );

  Map<String, dynamic> toJson() => {
    "carrier_code": carrierCode,
    "method_code": methodCode,
    "carrier_title": carrierTitle,
    "method_title": methodTitle,
    "amount": amount,
    "base_amount": baseAmount,
    "available": available,
    "error_message": errorMessage,
    "price_excl_tax": priceExclTax,
    "price_incl_tax": priceInclTax,
  };
}
