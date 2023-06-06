import 'dart:convert';

class WalletOrderResponseModel {
  PlaceOrder placeOrder;

  WalletOrderResponseModel({
    required this.placeOrder,
  });

  factory WalletOrderResponseModel.fromRawJson(String str) => WalletOrderResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory WalletOrderResponseModel.fromJson(Map<String, dynamic> json) => WalletOrderResponseModel(
    placeOrder: PlaceOrder.fromJson(json["placeOrder"]),
  );

  Map<String, dynamic> toJson() => {
    "placeOrder": placeOrder.toJson(),
  };
}

class PlaceOrder {
  Order order;

  PlaceOrder({
    required this.order,
  });

  factory PlaceOrder.fromRawJson(String str) => PlaceOrder.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PlaceOrder.fromJson(Map<String, dynamic> json) => PlaceOrder(
    order: Order.fromJson(json["order"]),
  );

  Map<String, dynamic> toJson() => {
    "order": order.toJson(),
  };
}

class Order {
  String orderNumber;

  Order({
    required this.orderNumber,
  });

  factory Order.fromRawJson(String str) => Order.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    orderNumber: json["order_number"],
  );

  Map<String, dynamic> toJson() => {
    "order_number": orderNumber,
  };
}
