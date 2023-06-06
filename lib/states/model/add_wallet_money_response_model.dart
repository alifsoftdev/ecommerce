import 'dart:convert';

class AddWalletMoneyResponseModel {
  Addamounttowallet addamounttowallet;

  AddWalletMoneyResponseModel({
    required this.addamounttowallet,
  });

  factory AddWalletMoneyResponseModel.fromRawJson(String str) => AddWalletMoneyResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AddWalletMoneyResponseModel.fromJson(Map<String, dynamic> json) => AddWalletMoneyResponseModel(
    addamounttowallet: Addamounttowallet.fromJson(json["addamounttowallet"]),
  );

  Map<String, dynamic> toJson() => {
    "addamounttowallet": addamounttowallet.toJson(),
  };
}

class Addamounttowallet {
  String message;

  Addamounttowallet({
    required this.message,
  });

  factory Addamounttowallet.fromRawJson(String str) => Addamounttowallet.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Addamounttowallet.fromJson(Map<String, dynamic> json) => Addamounttowallet(
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
  };
}
