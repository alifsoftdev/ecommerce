import 'dart:convert';

CustomerResponseModel customerResponseModelFromJson(String str) => CustomerResponseModel.fromJson(json.decode(str));

String customerResponseModelToJson(CustomerResponseModel data) => json.encode(data.toJson());

class CustomerResponseModel {
  CustomerResponseModel({
    required this.id,
    required this.groupId,
    required this.createdAt,
    required this.updatedAt,
    required this.createdIn,
    required this.email,
    required this.firstname,
    required this.lastname,
    required this.storeId,
    required this.websiteId,
    required this.addresses,
    required this.disableAutoGroupChange,
    required this.extensionAttributes,
    required this.customAttributes,
  });

  int id;
  int groupId;
  DateTime createdAt;
  DateTime updatedAt;
  String createdIn;
  String email;
  String firstname;
  String lastname;
  int storeId;
  int websiteId;
  List<Address> addresses;
  int disableAutoGroupChange;
  ExtensionAttributes extensionAttributes;
  List<CustomAttribute> customAttributes;

  factory CustomerResponseModel.fromJson(Map<String, dynamic> json) => CustomerResponseModel(
    id: json["id"],
    groupId: json["group_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    createdIn: json["created_in"],
    email: json["email"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    storeId: json["store_id"],
    websiteId: json["website_id"],
    addresses: List<Address>.from(json["addresses"].map((x) => Address.fromJson(x))),
    disableAutoGroupChange: json["disable_auto_group_change"],
    extensionAttributes: ExtensionAttributes.fromJson(json["extension_attributes"]),
    customAttributes: List<CustomAttribute>.from(json["custom_attributes"].map((x) => CustomAttribute.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "group_id": groupId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "created_in": createdIn,
    "email": email,
    "firstname": firstname,
    "lastname": lastname,
    "store_id": storeId,
    "website_id": websiteId,
    "addresses": List<dynamic>.from(addresses.map((x) => x.toJson())),
    "disable_auto_group_change": disableAutoGroupChange,
    "extension_attributes": extensionAttributes.toJson(),
    "custom_attributes": List<dynamic>.from(customAttributes.map((x) => x.toJson())),
  };
}

class Address {
  Address({
    required this.id,
    required this.customerId,
    required this.region,
    required this.countryId,
    required this.street,
    required this.telephone,
    required this.postcode,
    required this.city,
    required this.firstname,
    required this.lastname,
  });

  int id;
  int customerId;
  Region region;
  String countryId;
  List<String> street;
  String telephone;
  String postcode;
  String city;
  String firstname;
  String lastname;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    id: json["id"],
    customerId: json["customer_id"],
    region: Region.fromJson(json["region"]),
    countryId: json["country_id"],
    street: List<String>.from(json["street"].map((x) => x)),
    telephone: json["telephone"],
    postcode: json["postcode"],
    city: json["city"],
    firstname: json["firstname"],
    lastname: json["lastname"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "customer_id": customerId,
    "region": region.toJson(),
    "country_id": countryId,
    "street": List<dynamic>.from(street.map((x) => x)),
    "telephone": telephone,
    "postcode": postcode,
    "city": city,
    "firstname": firstname,
    "lastname": lastname,
  };
}

class Region {
  Region({
    required this.regionCode,
    required this.region,
    required this.regionId,
  });

  dynamic regionCode;
  dynamic region;
  int regionId;

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

class CustomAttribute {
  CustomAttribute({
    required this.attributeCode,
    required this.value,
  });

  String attributeCode;
  String value;

  factory CustomAttribute.fromJson(Map<String, dynamic> json) => CustomAttribute(
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

  factory ExtensionAttributes.fromJson(Map<String, dynamic> json) => ExtensionAttributes(
    isSubscribed: json["is_subscribed"],
  );

  Map<String, dynamic> toJson() => {
    "is_subscribed": isSubscribed,
  };
}
