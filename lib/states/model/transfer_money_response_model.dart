import 'dart:convert';

class TransferMoneyResponseModel {
  Sendtransferamount sendtransferamount;

  TransferMoneyResponseModel({
    required this.sendtransferamount,
  });

  factory TransferMoneyResponseModel.fromRawJson(String str) => TransferMoneyResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TransferMoneyResponseModel.fromJson(Map<String, dynamic> json) => TransferMoneyResponseModel(
    sendtransferamount: Sendtransferamount.fromJson(json["sendtransferamount"]),
  );

  Map<String, dynamic> toJson() => {
    "sendtransferamount": sendtransferamount.toJson(),
  };
}

class Sendtransferamount {
  String message;

  Sendtransferamount({
    required this.message,
  });

  factory Sendtransferamount.fromRawJson(String str) => Sendtransferamount.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Sendtransferamount.fromJson(Map<String, dynamic> json) => Sendtransferamount(
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
  };
}
