import 'dart:convert';

UpdateAddressModel updateAddressModelFromJson(String str) => UpdateAddressModel.fromJson(json.decode(str));

String updateAddressModelToJson(UpdateAddressModel data) => json.encode(data.toJson());

class UpdateAddressModel {
  final int id;
  final int groupId;
  final String defaultBilling;
  final String defaultShipping;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String createdIn;
  final String email;
  final String firstname;
  final String lastname;
  final int gender;
  final int storeId;
  final int websiteId;
  final List<Address> addresses;
  final int disableAutoGroupChange;
  final ExtensionAttributes extensionAttributes;
  final List<CustomAttribute> customAttributes;

  UpdateAddressModel({
    required this.id,
    required this.groupId,
    required this.defaultBilling,
    required this.defaultShipping,
    required this.createdAt,
    required this.updatedAt,
    required this.createdIn,
    required this.email,
    required this.firstname,
    required this.lastname,
    required this.gender,
    required this.storeId,
    required this.websiteId,
    required this.addresses,
    required this.disableAutoGroupChange,
    required this.extensionAttributes,
    required this.customAttributes,
  });

  factory UpdateAddressModel.fromJson(Map<String, dynamic> json) => UpdateAddressModel(
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
    disableAutoGroupChange: json["disable_auto_group_change"],
    extensionAttributes: ExtensionAttributes.fromJson(json["extension_attributes"]),
    customAttributes: List<CustomAttribute>.from(json["custom_attributes"].map((x) => CustomAttribute.fromJson(x))),
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
    "custom_attributes": List<dynamic>.from(customAttributes.map((x) => x.toJson())),
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

class CustomAttribute {
  final String attributeCode;
  final String value;

  CustomAttribute({
    required this.attributeCode,
    required this.value,
  });

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
  final bool isSubscribed;

  ExtensionAttributes({
    required this.isSubscribed,
  });

  factory ExtensionAttributes.fromJson(Map<String, dynamic> json) => ExtensionAttributes(
    isSubscribed: json["is_subscribed"],
  );

  Map<String, dynamic> toJson() => {
    "is_subscribed": isSubscribed,
  };
}
