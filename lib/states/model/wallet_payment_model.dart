import 'dart:convert';

class WalletPaymentModel {
  SetPaymentMethodOnCart setPaymentMethodOnCart;

  WalletPaymentModel({
    required this.setPaymentMethodOnCart,
  });

  factory WalletPaymentModel.fromRawJson(String str) => WalletPaymentModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory WalletPaymentModel.fromJson(Map<String, dynamic> json) => WalletPaymentModel(
    setPaymentMethodOnCart: SetPaymentMethodOnCart.fromJson(json["setPaymentMethodOnCart"]),
  );

  Map<String, dynamic> toJson() => {
    "setPaymentMethodOnCart": setPaymentMethodOnCart.toJson(),
  };
}

class SetPaymentMethodOnCart {
  Cart cart;

  SetPaymentMethodOnCart({
    required this.cart,
  });

  factory SetPaymentMethodOnCart.fromRawJson(String str) => SetPaymentMethodOnCart.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SetPaymentMethodOnCart.fromJson(Map<String, dynamic> json) => SetPaymentMethodOnCart(
    cart: Cart.fromJson(json["cart"]),
  );

  Map<String, dynamic> toJson() => {
    "cart": cart.toJson(),
  };
}

class Cart {
  SelectedPaymentMethod selectedPaymentMethod;

  Cart({
    required this.selectedPaymentMethod,
  });

  factory Cart.fromRawJson(String str) => Cart.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
    selectedPaymentMethod: SelectedPaymentMethod.fromJson(json["selected_payment_method"]),
  );

  Map<String, dynamic> toJson() => {
    "selected_payment_method": selectedPaymentMethod.toJson(),
  };
}

class SelectedPaymentMethod {
  String code;

  SelectedPaymentMethod({
    required this.code,
  });

  factory SelectedPaymentMethod.fromRawJson(String str) => SelectedPaymentMethod.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SelectedPaymentMethod.fromJson(Map<String, dynamic> json) => SelectedPaymentMethod(
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
  };
}
