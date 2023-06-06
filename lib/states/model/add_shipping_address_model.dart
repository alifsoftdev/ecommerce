import 'dart:convert';

AddShippingAddressModel addShippingAddressModelFromJson(String str) => AddShippingAddressModel.fromJson(json.decode(str));

String addShippingAddressModelToJson(AddShippingAddressModel data) => json.encode(data.toJson());

class AddShippingAddressModel {
  AddShippingAddressModel({
    required this.address,
  });

  AddShippingAddress address;

  factory AddShippingAddressModel.fromJson(Map<String, dynamic> json) => AddShippingAddressModel(
    address: AddShippingAddress.fromJson(json["address"]),
  );

  Map<String, dynamic> toJson() => {
    "address": address.toJson(),
  };
}

class AddShippingAddress {
  AddShippingAddress({
    required this.region,
    required this.regionId,
    required this.regionCode,
    required this.countryId,
    required this.street,
    required this.postcode,
    required this.city,
    required this.firstname,
    required this.lastname,
    required this.customerId,
    required this.email,
    required this.telephone,
    required this.sameAsBilling,
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
  int? customerId;
  String email;
  String telephone;
  int sameAsBilling;

  factory AddShippingAddress.fromJson(Map<String, dynamic> json) => AddShippingAddress(
    region: json["region"],
    regionId: json["region_id"],
    regionCode: json["region_code"],
    countryId: json["country_id"],
    street: List<String>.from(json["street"].map((x) => x)),
    postcode: json["postcode"],
    city: json["city"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    customerId: json["customer_id"],
    email: json["email"],
    telephone: json["telephone"],
    sameAsBilling: json["same_as_billing"],
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
    "customer_id": customerId,
    "email": email,
    "telephone": telephone,
    "same_as_billing": sameAsBilling,
  };
}
