import 'dart:convert';

class CartIdResponseModel {
  CustomerCart customerCart;

  CartIdResponseModel({
    required this.customerCart,
  });

  factory CartIdResponseModel.fromRawJson(String str) => CartIdResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CartIdResponseModel.fromJson(Map<String, dynamic> json) => CartIdResponseModel(
    customerCart: CustomerCart.fromJson(json["customerCart"]),
  );

  Map<String, dynamic> toJson() => {
    "customerCart": customerCart.toJson(),
  };
}

class CustomerCart {
  String id;
  String email;
  List<Item> items;

  CustomerCart({
    required this.id,
    required this.email,
    required this.items,
  });

  factory CustomerCart.fromRawJson(String str) => CustomerCart.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CustomerCart.fromJson(Map<String, dynamic> json) => CustomerCart(
    id: json["id"],
    email: json["email"],
    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
  };
}

class Item {
  String id;
  int quantity;
  Product product;

  Item({
    required this.id,
    required this.quantity,
    required this.product,
  });

  factory Item.fromRawJson(String str) => Item.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    id: json["id"],
    quantity: json["quantity"],
    product: Product.fromJson(json["product"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "quantity": quantity,
    "product": product.toJson(),
  };
}

class Product {
  int id;
  String sku;
  String name;

  Product({
    required this.id,
    required this.sku,
    required this.name,
  });

  factory Product.fromRawJson(String str) => Product.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    sku: json["sku"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "sku": sku,
    "name": name,
  };
}
