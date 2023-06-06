import 'dart:convert';

EditPasswordModel editPasswordModelFromJson(String str) =>
    EditPasswordModel.fromJson(json.decode(str));

String editPasswordModelToJson(EditPasswordModel data) =>
    json.encode(data.toJson());

class EditPasswordModel {
  EditPasswordModel({
    required this.currentPassword,
    required this.newPassword,
  });

  String currentPassword;
  String newPassword;

  factory EditPasswordModel.fromJson(Map<String, dynamic> json) =>
      EditPasswordModel(
        currentPassword: json["currentPassword"],
        newPassword: json["newPassword"],
      );

  Map<String, dynamic> toJson() => {
        "currentPassword": currentPassword,
        "newPassword": newPassword,
      };
}
