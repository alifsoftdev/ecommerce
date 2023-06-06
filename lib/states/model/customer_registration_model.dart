import 'dart:convert';

CustomerRegistrationModel customerRegistrationModelFromJson(String str) => CustomerRegistrationModel.fromJson(json.decode(str));

String customerRegistrationModelToJson(CustomerRegistrationModel data) => json.encode(data.toJson());

class CustomerRegistrationModel {
  CustomerRegistrationModel({
    required this.customer,
    required this.password,
  });

  Customer customer;
  String password;

  factory CustomerRegistrationModel.fromJson(Map<String, dynamic> json) => CustomerRegistrationModel(
    customer: Customer.fromJson(json["customer"]),
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "customer": customer.toJson(),
    "password": password,
  };
}

class Customer {
  Customer({
    required this.email,
    required this.firstname,
    required this.lastname,
    required this.websiteId,
    required this.addresses,
  });

  String email;
  String firstname;
  String lastname;
  int websiteId;
  List<Address> addresses;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
    email: json["email"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    websiteId: json["website_id"],
    addresses: List<Address>.from(json["addresses"].map((x) => Address.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "firstname": firstname,
    "lastname": lastname,
    "website_id": websiteId,
    "addresses": List<dynamic>.from(addresses.map((x) => x.toJson())),
  };
}

class Address {
  Address({
    required this.firstname,
    required this.lastname,
    required this.postcode,
    required this.city,
    required this.street,
    required this.telephone,
    required this.countryId,
  });

  String firstname;
  String lastname;
  String postcode;
  String city;
  List<String> street;
  String telephone;
  String countryId;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    firstname: json["firstname"],
    lastname: json["lastname"],
    postcode: json["postcode"],
    city: json["city"],
    street: List<String>.from(json["street"].map((x) => x)),
    telephone: json["telephone"],
    countryId: json["country_id"],
  );

  Map<String, dynamic> toJson() => {
    "firstname": firstname,
    "lastname": lastname,
    "postcode": postcode,
    "city": city,
    "street": List<dynamic>.from(street.map((x) => x)),
    "telephone": telephone,
    "country_id": countryId,
  };
}
