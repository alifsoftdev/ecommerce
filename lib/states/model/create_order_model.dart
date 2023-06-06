import 'dart:convert';

CreateOrderModel createOrderModelFromJson(String str) => CreateOrderModel.fromJson(json.decode(str));

String createOrderModelToJson(CreateOrderModel data) => json.encode(data.toJson());

class CreateOrderModel {
  CreateOrderModel({
    required this.paymentMethod,
    // this.billingAddress,
  });

  PaymentInfoMethod paymentMethod;
  //BillingAddress? billingAddress;

  factory CreateOrderModel.fromJson(Map<String, dynamic> json) => CreateOrderModel(
    paymentMethod: PaymentInfoMethod.fromJson(json["paymentMethod"]),
  //  billingAddress: BillingAddress.fromJson(json["billing_address"]),
  );

  Map<String, dynamic> toJson() => {
    "paymentMethod": paymentMethod.toJson(),
   // "billing_address": billingAddress!.toJson(),
  };
}

class BillingAddress {
  BillingAddress({
    required this.region,
    required this.regionId,
    required this.regionCode,
    required this.countryId,
    required this.street,
    required this.postcode,
    required this.city,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.telephone,
  });

  String region;
  int regionId;
  String regionCode;
  String countryId;
  List<String> street;
  String postcode;
  String city;
  String firstname;
  String lastname;
  String email;
  String telephone;

  factory BillingAddress.fromJson(Map<String, dynamic> json) => BillingAddress(
    region: json["region"],
    regionId: json["region_id"],
    regionCode: json["region_code"],
    countryId: json["country_id"],
    street: List<String>.from(json["street"].map((x) => x)),
    postcode: json["postcode"],
    city: json["city"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    email: json["email"],
    telephone: json["telephone"],
  );

  Map<String, dynamic> toJson() => {
    "region": region,
    "region_id": regionId,
    "region_code": regionCode,
    "country_id": countryId,
    "street": List<dynamic>.from(street.map((x) => x)),
    "postcode": postcode,
    "city": city,
    "firstname": firstname,
    "lastname": lastname,
    "email": email,
    "telephone": telephone,
  };
}

class PaymentInfoMethod {
  PaymentInfoMethod({
    required this.method,
  });

  String method;

  factory PaymentInfoMethod.fromJson(Map<String, dynamic> json) => PaymentInfoMethod(
    method: json["method"],
  );

  Map<String, dynamic> toJson() => {
    "method": method,
  };
}
