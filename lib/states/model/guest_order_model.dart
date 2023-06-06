// To parse this JSON data, do
//
//     final guestOrderModel = guestOrderModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

GuestOrderModel guestOrderModelFromJson(String str) => GuestOrderModel.fromJson(json.decode(str));

String guestOrderModelToJson(GuestOrderModel data) => json.encode(data.toJson());

class GuestOrderModel {
  PaymentMethod paymentMethod;
  String? email;
  IngAddress shippingAddress;
  IngAddress billingAddress;

  GuestOrderModel({
    required this.paymentMethod,
     this.email,
    required this.shippingAddress,
    required this.billingAddress,
  });

  factory GuestOrderModel.fromJson(Map<String, dynamic> json) => GuestOrderModel(
    paymentMethod: PaymentMethod.fromJson(json["paymentMethod"]),
    email: json["email"],
    shippingAddress: IngAddress.fromJson(json["shipping_address"]),
    billingAddress: IngAddress.fromJson(json["billing_address"]),
  );

  Map<String, dynamic> toJson() => {
    "paymentMethod": paymentMethod.toJson(),
    "email": email,
    "shipping_address": shippingAddress.toJson(),
    "billing_address": billingAddress.toJson(),
  };
}

class IngAddress {
  String region;
  int regionId;
  String regionCode;
  String countryId;
  List<String> street;
  String postcode;
  String city;
  String firstname;
  String lastname;
  String? email;
  String telephone;

  IngAddress({
    required this.region,
    required this.regionId,
    required this.regionCode,
    required this.countryId,
    required this.street,
    required this.postcode,
    required this.city,
    required this.firstname,
    required this.lastname,
     this.email,
    required this.telephone,
  });

  factory IngAddress.fromJson(Map<String, dynamic> json) => IngAddress(
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

class PaymentMethod {
  String method;

  PaymentMethod({
    required this.method,
  });

  factory PaymentMethod.fromJson(Map<String, dynamic> json) => PaymentMethod(
    method: json["method"],
  );

  Map<String, dynamic> toJson() => {
    "method": method,
  };
}
