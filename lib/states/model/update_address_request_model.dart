import 'dart:convert';

UpdateAddressRequestModel updateAddressRequestModelFromJson(String str) => UpdateAddressRequestModel.fromJson(json.decode(str));

String updateAddressRequestModelToJson(UpdateAddressRequestModel data) => json.encode(data.toJson());

class UpdateAddressRequestModel {
  final Customer customer;

  UpdateAddressRequestModel({
    required this.customer,
  });

  factory UpdateAddressRequestModel.fromJson(Map<String, dynamic> json) => UpdateAddressRequestModel(
    customer: Customer.fromJson(json["customer"]),
  );

  Map<String, dynamic> toJson() => {
    "customer": customer.toJson(),
  };
}

class Customer {
  final String email;
  final String firstname;
  final String lastname;
  final List<Address> addresses;

  Customer({
    required this.email,
    required this.firstname,
    required this.lastname,
    required this.addresses,
  });

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
    email: json["email"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    addresses: List<Address>.from(json["addresses"].map((x) => Address.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "firstname": firstname,
    "lastname": lastname,
    "addresses": List<dynamic>.from(addresses.map((x) => x.toJson())),
  };
}

class Address {
  final int id;
  final int customerId;
  final Region region;
  final int regionId;
  final String countryId;
  final List<String> street;
  final String telephone;
  final String postcode;
  final String city;
  final String firstname;
  final String lastname;
  final bool defaultShipping;
  final bool defaultBilling;

  Address({
    required this.id,
    required this.customerId,
    required this.region,
    required this.regionId,
    required this.countryId,
    required this.street,
    required this.telephone,
    required this.postcode,
    required this.city,
    required this.firstname,
    required this.lastname,
    required this.defaultShipping,
    required this.defaultBilling,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    id: json["id"],
    customerId: json["customer_id"],
    region: Region.fromJson(json["region"]),
    regionId: json["region_id"],
    countryId: json["country_id"],
    street: List<String>.from(json["street"].map((x) => x)),
    telephone: json["telephone"],
    postcode: json["postcode"],
    city: json["city"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    defaultShipping: json["default_shipping"],
    defaultBilling: json["default_billing"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "customer_id": customerId,
    "region": region.toJson(),
    "region_id": regionId,
    "country_id": countryId,
    "street": List<dynamic>.from(street.map((x) => x)),
    "telephone": telephone,
    "postcode": postcode,
    "city": city,
    "firstname": firstname,
    "lastname": lastname,
    "default_shipping": defaultShipping,
    "default_billing": defaultBilling,
  };
}

class Region {
  final String regionCode;
  final String region;
  final int regionId;

  Region({
    required this.regionCode,
    required this.region,
    required this.regionId,
  });

  factory Region.fromJson(Map<String, dynamic> json) => Region(
    regionCode: json["region_code"],
    region: json["region"],
    regionId: json["region_id"],
  );

  Map<String, dynamic> toJson() => {
    "region_code": regionCode,
    "region": region,
    "region_id": regionId,
  };
}
