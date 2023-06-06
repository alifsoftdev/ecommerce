import 'dart:convert';

WishlistModel wishlistModelFromJson(String str) => WishlistModel.fromJson(json.decode(str));

String wishlistModelToJson(WishlistModel data) => json.encode(data.toJson());

class WishlistModel {
  WishlistModel({
    required this.itemsCount,
    required this.items,
  });

  int itemsCount;
  List<Item> items;

  factory WishlistModel.fromJson(Map<String, dynamic> json) => WishlistModel(
    itemsCount: json["items_count"],
    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "items_count": itemsCount,
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
  };
}

class Item {
  Item({
    required this.id,
    required this.product,
    required this.isWishlisted,
  });

  int id;
  Product product;
  bool isWishlisted = true;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    id: json["id"],
    product: Product.fromJson(json["product"]), isWishlisted: true,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product": product.toJson(),
  };
}

class Product {
  Product({
    required this.id,
    required this.sku,
    required this.name,
    required this.attributeSetId,
    required this.price,
    required this.status,
    required this.visibility,
    required this.typeId,
    required this.createdAt,
    required this.updatedAt,
    required this.productLinks,
    required this.tierPrices,
    required this.customAttributes,
  });

  int id;
  String sku;
  String name;
  int attributeSetId;
  int price;
  int status;
  int visibility;
  String typeId;
  DateTime createdAt;
  DateTime updatedAt;
  List<dynamic> productLinks;
  List<dynamic> tierPrices;
  List<CustomAttribute> customAttributes;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    sku: json["sku"],
    name: json["name"],
    attributeSetId: json["attribute_set_id"],
    price: json["price"],
    status: json["status"],
    visibility: json["visibility"],
    typeId: json["type_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    productLinks: List<dynamic>.from(json["product_links"].map((x) => x)),
    tierPrices: List<dynamic>.from(json["tier_prices"].map((x) => x)),
    customAttributes: List<CustomAttribute>.from(json["custom_attributes"].map((x) => CustomAttribute.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "sku": sku,
    "name": name,
    "attribute_set_id": attributeSetId,
    "price": price,
    "status": status,
    "visibility": visibility,
    "type_id": typeId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "product_links": List<dynamic>.from(productLinks.map((x) => x)),
    "tier_prices": List<dynamic>.from(tierPrices.map((x) => x)),
    "custom_attributes": List<dynamic>.from(customAttributes.map((x) => x.toJson())),
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
