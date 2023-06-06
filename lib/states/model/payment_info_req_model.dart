import 'dart:convert';

PaymentInfoRequestModel paymentInfoRequestModelFromJson(String str) => PaymentInfoRequestModel.fromJson(json.decode(str));

String paymentInfoRequestModelToJson(PaymentInfoRequestModel data) => json.encode(data.toJson());

class PaymentInfoRequestModel {
  PaymentInfoRequestModel({
    required this.addressInformation,
  });

  AddressInformation addressInformation;

  factory PaymentInfoRequestModel.fromJson(Map<String, dynamic> json) => PaymentInfoRequestModel(
    addressInformation: AddressInformation.fromJson(json["addressInformation"]),
  );

  Map<String, dynamic> toJson() => {
    "addressInformation": addressInformation.toJson(),
  };
}

class AddressInformation {
  AddressInformation({
    required this.shippingAddress,
    required this.billingAddress,
    required this.shippingCarrierCode,
    required this.shippingMethodCode,
  });

  IngAddress shippingAddress;
  IngAddress billingAddress;
  String shippingCarrierCode;
  String shippingMethodCode;

  factory AddressInformation.fromJson(Map<String, dynamic> json) => AddressInformation(
    shippingAddress: IngAddress.fromJson(json["shipping_address"]),
    billingAddress: IngAddress.fromJson(json["billing_address"]),
    shippingCarrierCode: json["shipping_carrier_code"],
    shippingMethodCode: json["shipping_method_code"],
  );

  Map<String, dynamic> toJson() => {
    "shipping_address": shippingAddress.toJson(),
    "billing_address": billingAddress.toJson(),
    "shipping_carrier_code": shippingCarrierCode,
    "shipping_method_code": shippingMethodCode,
  };
}

class IngAddress {
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
