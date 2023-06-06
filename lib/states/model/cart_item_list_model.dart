import 'dart:convert';

List<CartItemsListModel> cartItemsModelFromJson(String str) => List<CartItemsListModel>.from(json.decode(str).map((x) => CartItemsListModel.fromJson(x)));

String cartItemModelToJson(List<CartItemsListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CartItemsListModel {
  CartItemsListModel({
    required this.itemId,
    required this.sku,
    required this.qty,
    required this.name,
    required this.price,
    required this.productType,
     this.quoteId,
    required this.extensionAttributes,
  });

  int itemId;
  String sku;
  int qty;
  String name;
  int price;
  String productType;
  String? quoteId;
  ExtensionAttributes extensionAttributes;

  factory CartItemsListModel.fromJson(Map<String, dynamic> json) => CartItemsListModel(
    itemId: json["item_id"],
    sku: json["sku"],
    qty: json["qty"],
    name: json["name"],
    price: json["price"],
    productType: json["product_type"],
    quoteId: json["quote_id"],
    extensionAttributes: ExtensionAttributes.fromJson(json["extension_attributes"]),
  );

  Map<String, dynamic> toJson() => {
    "item_id": itemId,
    "sku": sku,
    "qty": qty,
    "name": name,
    "price": price,
    "product_type": productType,
    "quote_id": quoteId,
    "extension_attributes": extensionAttributes.toJson(),
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
