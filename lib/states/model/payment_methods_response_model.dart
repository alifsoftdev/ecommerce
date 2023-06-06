import 'dart:convert';

class PaymentMethodsResponseModel {
  Cart cart;

  PaymentMethodsResponseModel({
    required this.cart,
  });

  factory PaymentMethodsResponseModel.fromRawJson(String str) => PaymentMethodsResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PaymentMethodsResponseModel.fromJson(Map<String, dynamic> json) => PaymentMethodsResponseModel(
    cart: Cart.fromJson(json["cart"]),
  );

  Map<String, dynamic> toJson() => {
    "cart": cart.toJson(),
  };
}

class Cart {
  List<AvailablePaymentMethod> availablePaymentMethods;

  Cart({
    required this.availablePaymentMethods,
  });

  factory Cart.fromRawJson(String str) => Cart.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
    availablePaymentMethods: List<AvailablePaymentMethod>.from(json["available_payment_methods"].map((x) => AvailablePaymentMethod.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "available_payment_methods": List<dynamic>.from(availablePaymentMethods.map((x) => x.toJson())),
  };
}

class AvailablePaymentMethod {
  String code;
  String title;

  AvailablePaymentMethod({
    required this.code,
    required this.title,
  });

  factory AvailablePaymentMethod.fromRawJson(String str) => AvailablePaymentMethod.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AvailablePaymentMethod.fromJson(Map<String, dynamic> json) => AvailablePaymentMethod(
    code: json["code"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "title": title,
  };
}
