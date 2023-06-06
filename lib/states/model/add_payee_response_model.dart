import 'dart:convert';

class AddPayeeModel {
  AddPayeeModel({
    required this.addpayee,
  });

  Addpayee addpayee;

  factory AddPayeeModel.fromRawJson(String str) => AddPayeeModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AddPayeeModel.fromJson(Map<String, dynamic> json) => AddPayeeModel(
    addpayee: Addpayee.fromJson(json["addpayee"]),
  );

  Map<String, dynamic> toJson() => {
    "addpayee": addpayee.toJson(),
  };
}

class Addpayee {
  Addpayee({
    required this.message,
  });

  String message;

  factory Addpayee.fromRawJson(String str) => Addpayee.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Addpayee.fromJson(Map<String, dynamic> json) => Addpayee(
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
  };
}