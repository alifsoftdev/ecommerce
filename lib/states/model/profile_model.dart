import 'dart:convert';

ProfileModel registrationModelFromJson(String str) =>
    ProfileModel.fromJson(json.decode(str));

String registrationModelToJson(ProfileModel data) => json.encode(data.toJson());

AddAddressModel addAddressModelFromJson(String str) => AddAddressModel.fromJson(json.decode(str));

String addAddressModelToJson(AddAddressModel data) => json.encode(data.toJson());

class ProfileModel {
  ProfileModel({
    required this.id,
    required this.groupId,
     this.defaultBilling,
     this.defaultShipping,
    required this.createdAt,
    required this.updatedAt,
    required this.createdIn,
    required this.email,
    required this.firstname,
    required this.lastname,
     this.gender,
    required this.storeId,
    required this.websiteId,
    required this.addresses,
    required this.disableAutoGroupChange,
    required this.extensionAttributes,
    required this.customAttributes,
  });

  int id;
  int groupId;
  String? defaultBilling;
  String? defaultShipping;
  DateTime createdAt;
  DateTime updatedAt;
  String createdIn;
  String email;
  String firstname;
  String lastname;
  int? gender;
  int storeId;
  int websiteId;
  List<Address> addresses;
  int disableAutoGroupChange;
  ExtensionAttributes extensionAttributes;
  List<CustomAttribute> customAttributes;

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        id: json["id"]??0,
        groupId: json["group_id"]??0,
        defaultBilling: json["default_billing"]??'',
        defaultShipping: json["default_shipping"]??'',
        createdAt: DateTime.parse(json ["created_at"])??DateTime.now(),
        updatedAt: DateTime.parse(json["updated_at"])??DateTime.now(),
        createdIn: json["created_in"]??'',
        email: json["email"]??'',
        firstname: json["firstname"]??'',
        lastname: json["lastname"]??'',
        gender: json["gender"]??0,
        storeId: json["store_id"]??0,
        websiteId: json["website_id"]??0,
        addresses: List<Address>.from(
            json["addresses"].map((x) => Address.fromJson(x))),
        disableAutoGroupChange: json["disable_auto_group_change"],
        extensionAttributes:
            ExtensionAttributes.fromJson(json["extension_attributes"]),
        customAttributes: List<CustomAttribute>.from(
            json["custom_attributes"].map((x) => CustomAttribute.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "group_id": groupId,
        "default_billing": defaultBilling,
        "default_shipping": defaultShipping,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "created_in": createdIn,
        "email": email,
        "firstname": firstname,
        "lastname": lastname,
        "gender": gender,
        "store_id": storeId,
        "website_id": websiteId,
        "addresses": List<dynamic>.from(addresses.map((x) => x.toJson())),
        "disable_auto_group_change": disableAutoGroupChange,
        "extension_attributes": extensionAttributes.toJson(),
        "custom_attributes":
            List<dynamic>.from(customAttributes.map((x) => x.toJson())),
      };
  Map<String, dynamic> toJsonString() => {
    "id": id,
    "group_id": groupId,
    "default_billing": defaultBilling,
    "default_shipping": defaultShipping,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "created_in": createdIn,
    "email": email,
    "firstname": firstname,
    "lastname": lastname,
    "gender": gender,
    "store_id": storeId,
    "website_id": websiteId,
    "addresses": List<dynamic>.from(addresses.map((x) => x.toJson())),
    "disable_auto_group_change": disableAutoGroupChange,
    "extension_attributes": extensionAttributes.toJson(),
    "custom_attributes":
    List<dynamic>.from(customAttributes.map((x) => x.toJson())),
  };
}

class Address {
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
    this.email
  });

  int? id;
  int? customerId;
  Region region;
  int regionId;
  String countryId;
  List<String> street;
  String telephone;
  String postcode;
  String city;
  String firstname;
  String lastname;
  bool defaultShipping;
  bool defaultBilling;
  String? email;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json["id"]??0,
        customerId: json["customer_id"]??0,
        region: Region.fromJson(json["region"]),
        regionId: json["region_id"]??0,
        countryId: json["country_id"]??'',
        street: List<String>.from(json["street"].map((x) => x))??[],
        telephone: json["telephone"]??'',
        postcode: json["postcode"]??'',
        city: json["city"]??'',
        firstname: json["firstname"]??'',
        lastname: json["lastname"]??'',
        defaultShipping: json["default_shipping"]??false,
        defaultBilling: json["default_billing"]??false,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "customer_id": customerId,
        "region": region,
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
  Region({
    required this.regionCode,
    required this.region,
    required this.regionId,
  });

  String regionCode;
  String region;
  int regionId;

  factory Region.fromJson(Map<String, dynamic> json) => Region(
        regionCode: json["region_code"]??'',
        region: json["region"]??'',
        regionId: json["region_id"]??0,
      );

  Map<String, dynamic> toJson() => {
        "region_code": regionCode,
        "region": region,
        "region_id": regionId,
      };
}

class CustomAttribute {
  CustomAttribute({
    required this.attributeCode,
    required this.value,
  });

  String attributeCode;
  String value;

  factory CustomAttribute.fromJson(Map<String, dynamic> json) =>
      CustomAttribute(
        attributeCode: json["attribute_code"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "attribute_code": attributeCode,
        "value": value,
      };
}

class ExtensionAttributes {
  ExtensionAttributes({
    required this.isSubscribed,
  });

  bool isSubscribed;

  factory ExtensionAttributes.fromJson(Map<String, dynamic> json) =>
      ExtensionAttributes(
        isSubscribed: json["is_subscribed"],
      );

  Map<String, dynamic> toJson() => {
        "is_subscribed": isSubscribed,
      };
}

class AddAddressModel {
  AddAddressModel({
    required this.customer,
  });

  Customer customer;

  factory AddAddressModel.fromJson(Map<String, dynamic> json) => AddAddressModel(
    customer: Customer.fromJson(json["customer"]),
  );

  Map<String, dynamic> toJson() => {
    "customer": customer.toJson(),
  };
}

class Customer {
  Customer({
    required this.id,
    required this.groupId,
     this.defaultBilling,
     this.defaultShipping,
    required this.createdAt,
    required this.updatedAt,
    required this.createdIn,
    required this.email,
    required this.firstname,
    required this.lastname,
     this.gender,
    required this.storeId,
    required this.websiteId,
    required this.addresses,
  });

  int id;
  int groupId;
  String? defaultBilling;
  String? defaultShipping;
  DateTime createdAt;
  DateTime updatedAt;
  String createdIn;
  String email;
  String firstname;
  String lastname;
  int? gender;
  int storeId;
  int websiteId;
  List<Address> addresses;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
    id: json["id"],
    groupId: json["group_id"],
    defaultBilling: json["default_billing"],
    defaultShipping: json["default_shipping"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    createdIn: json["created_in"],
    email: json["email"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    gender: json["gender"],
    storeId: json["store_id"],
    websiteId: json["website_id"],
    addresses: List<Address>.from(json["addresses"].map((x) => Address.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "group_id": groupId,
    "default_billing": defaultBilling,
    "default_shipping": defaultShipping,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "created_in": createdIn,
    "email": email,
    "firstname": firstname,
    "lastname": lastname,
    "gender": gender,
    "store_id": storeId,
    "website_id": websiteId,
    "addresses": List<dynamic>.from(addresses.map((x) => x.toJson())),
  };
}