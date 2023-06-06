import 'dart:convert';

AddToCartModel addToCartModelFromJson(String str) => AddToCartModel.fromJson(json.decode(str));

String addToCartModelToJson(AddToCartModel data) => json.encode(data.toJson());

class AddToCartModel {
  AddToCartModel({
    required this.cartItem,
  });

  CartItem cartItem;

  factory AddToCartModel.fromJson(Map<String, dynamic> json) => AddToCartModel(
    cartItem: CartItem.fromJson(json["cartItem"]),
  );

  Map<String, dynamic> toJson() => {
    "cartItem": cartItem.toJson(),
  };
}

class CartItem {
  CartItem({
    required this.sku,
    required this.qty,
     this.quoteId,
  });

  String sku;
  int qty;
  String? quoteId;

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
    sku: json["sku"],
    qty: json["qty"],
    quoteId: json["quoteId"],
  );

  Map<String, dynamic> toJson() => {
    "sku": sku,
    "qty": qty,
    "quoteId": quoteId,
  };
}
