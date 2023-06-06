import 'dart:convert';

SampleProductStatusModel sampleProductStatusModelFromJson(String str) => SampleProductStatusModel.fromJson(json.decode(str));

String sampleProductStatusModelToJson(SampleProductStatusModel data) => json.encode(data.toJson());

class SampleProductStatusModel {
  SampleProductStatusModel({
    required this.product,
  });

  Product product;

  factory SampleProductStatusModel.fromJson(Map<String, dynamic> json) => SampleProductStatusModel(
    product: Product.fromJson(json["product"]),
  );

  Map<String, dynamic> toJson() => {
    "product": product.toJson(),
  };
}

class Product {
  Product({
    required this.id,
  });

  int id;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
  };
}

SampleProductStatusResponseModel sampleProductStatusResponseModelFromJson(String str) => SampleProductStatusResponseModel.fromJson(json.decode(str));

String sampleProductStatusResponseModelToJson(SampleProductStatusResponseModel data) => json.encode(data.toJson());

class SampleProductStatusResponseModel {
  SampleProductStatusResponseModel({
    required this.success,
    required this.responseData,
    required this.message,
  });

  bool success;
  String responseData;
  String message;

  factory SampleProductStatusResponseModel.fromJson(Map<String, dynamic> json) => SampleProductStatusResponseModel(
    success: json["success"],
    responseData: json["response_data"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "response_data": responseData,
    "message": message,
  };
}


StatusResponseDataModel statusResponseDataModelFromJson(String str) => StatusResponseDataModel.fromJson(json.decode(str));

String statusResponseDataModelToJson(StatusResponseDataModel data) => json.encode(data.toJson());

class StatusResponseDataModel {
  StatusResponseDataModel({
    required this.status,
    required this.productName,
    required this.productType,
    required this.sku,
    required this.price,
    required this.qty,
  });

  String status;
  String productName;
  String productType;
  String sku;
  String price;
  int qty;

  factory StatusResponseDataModel.fromJson(Map<String, dynamic> json) => StatusResponseDataModel(
    status: json["Status"],
    productName: json["ProductName"],
    productType: json["ProductType"],
    sku: json["Sku"],
    price: json["Price"],
    qty: json["Qty"],
  );

  Map<String, dynamic> toJson() => {
    "Status": status,
    "ProductName": productName,
    "ProductType": productType,
    "Sku": sku,
    "Price": price,
    "Qty": qty,
  };
}