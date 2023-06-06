import 'dart:convert';

class DeletePayeeResponseModel {
  DeletePayee deletePayee;

  DeletePayeeResponseModel({
    required this.deletePayee,
  });

  factory DeletePayeeResponseModel.fromRawJson(String str) => DeletePayeeResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DeletePayeeResponseModel.fromJson(Map<String, dynamic> json) => DeletePayeeResponseModel(
    deletePayee: DeletePayee.fromJson(json["deletePayee"]),
  );

  Map<String, dynamic> toJson() => {
    "deletePayee": deletePayee.toJson(),
  };
}

class DeletePayee {
  String message;

  DeletePayee({
    required this.message,
  });

  factory DeletePayee.fromRawJson(String str) => DeletePayee.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DeletePayee.fromJson(Map<String, dynamic> json) => DeletePayee(
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
  };
}
