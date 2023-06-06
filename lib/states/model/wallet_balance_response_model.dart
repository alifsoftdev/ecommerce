import 'dart:convert';

class WalletBalanceResponseModel {
  List<Adminallcustomerwallent> adminallcustomerwallent;

  WalletBalanceResponseModel({
    required this.adminallcustomerwallent,
  });

  factory WalletBalanceResponseModel.fromRawJson(String str) => WalletBalanceResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory WalletBalanceResponseModel.fromJson(Map<String, dynamic> json) => WalletBalanceResponseModel(
    adminallcustomerwallent: List<Adminallcustomerwallent>.from(json["adminallcustomerwallent"].map((x) => Adminallcustomerwallent.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "adminallcustomerwallent": List<dynamic>.from(adminallcustomerwallent.map((x) => x.toJson())),
  };
}

class Adminallcustomerwallent {
  String customerName;
  String totalAmount;
  String remainingAmount;
  String usedAmount;
  DateTime modifyAt;

  Adminallcustomerwallent({
    required this.customerName,
    required this.totalAmount,
    required this.remainingAmount,
    required this.usedAmount,
    required this.modifyAt,
  });

  factory Adminallcustomerwallent.fromRawJson(String str) => Adminallcustomerwallent.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Adminallcustomerwallent.fromJson(Map<String, dynamic> json) => Adminallcustomerwallent(
    customerName: json["CustomerName"],
    totalAmount: json["TotalAmount"],
    remainingAmount: json["RemainingAmount"],
    usedAmount: json["UsedAmount"],
    modifyAt: DateTime.parse(json["ModifyAt"]),
  );

  Map<String, dynamic> toJson() => {
    "CustomerName": customerName,
    "TotalAmount": totalAmount,
    "RemainingAmount": remainingAmount,
    "UsedAmount": usedAmount,
    "ModifyAt": modifyAt.toIso8601String(),
  };
}
