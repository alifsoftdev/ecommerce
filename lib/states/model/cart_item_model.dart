import 'dart:convert';

CartItemModel cartItemModelFromJson(String str) => CartItemModel.fromJson(json.decode(str));

String cartItemModelToJson(CartItemModel data) => json.encode(data.toJson());

class CartItemModel {
  CartItemModel({
    required this.itemId,
    required this.sku,
    required this.qty,
    required this.name,
    required this.price,
    required this.productType,
    required this.quoteId,
   // required this.extensionAttributes,
  });

  int itemId;
  String sku;
  int qty;
  String name;
  int price;
  String productType;
  String quoteId;
  //ExtensionAttributes extensionAttributes;

  factory CartItemModel.fromJson(Map<String, dynamic> json) => CartItemModel(
    itemId: json["item_id"],
    sku: json["sku"],
    qty: json["qty"],
    name: json["name"],
    price: json["price"],
    productType: json["product_type"],
    quoteId: json["quote_id"],
   // extensionAttributes: ExtensionAttributes.fromJson(json["extension_attributes"]),
  );

  Map<String, dynamic> toJson() => {
    "item_id": itemId,
    "sku": sku,
    "qty": qty,
    "name": name,
    "price": price,
    "product_type": productType,
    "quote_id": quoteId,
   // "extension_attributes": extensionAttributes.toJson(),
  };
}

class ExtensionAttributes {
  ExtensionAttributes({
    required this.imageUrl,
  });

  String imageUrl;

  factory ExtensionAttributes.fromJson(Map<String, dynamic> json) => ExtensionAttributes(
    imageUrl: json["image_url"],
  );

  Map<String, dynamic> toJson() => {
    "image_url": imageUrl,
  };
}
