import 'dart:convert';

class TransferCodeResponseModel {
  Sendcodetransferamount sendcodetransferamount;

  TransferCodeResponseModel({
    required this.sendcodetransferamount,
  });

  factory TransferCodeResponseModel.fromRawJson(String str) => TransferCodeResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TransferCodeResponseModel.fromJson(Map<String, dynamic> json) => TransferCodeResponseModel(
    sendcodetransferamount: Sendcodetransferamount.fromJson(json["sendcodetransferamount"]),
  );

  Map<String, dynamic> toJson() => {
    "sendcodetransferamount": sendcodetransferamount.toJson(),
  };
}

class Sendcodetransferamount {
  int transfercode;
  String message;

  Sendcodetransferamount({
    required this.transfercode,
    required this.message,
  });

  factory Sendcodetransferamount.fromRawJson(String str) => Sendcodetransferamount.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Sendcodetransferamount.fromJson(Map<String, dynamic> json) => Sendcodetransferamount(
    transfercode: json["transfercode"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "transfercode": transfercode,
    "message": message,
  };
}
