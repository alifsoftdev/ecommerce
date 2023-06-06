import 'dart:convert';

CategoryResponseModel categoryResponseModelFromJson(String str) => CategoryResponseModel.fromJson(json.decode(str));

String categoryResponseModelToJson(CategoryResponseModel data) => json.encode(data.toJson());

class CategoryResponseModel {
  int id;
  String identifier;
  String title;
  String content;
  DateTime creationTime;
  DateTime updateTime;
  bool active;

  CategoryResponseModel({
    required this.id,
    required this.identifier,
    required this.title,
    required this.content,
    required this.creationTime,
    required this.updateTime,
    required this.active,
  });

  factory CategoryResponseModel.fromJson(Map<String, dynamic> json) => CategoryResponseModel(
    id: json["id"],
    identifier: json["identifier"],
    title: json["title"],
    content: json["content"],
    creationTime: DateTime.parse(json["creation_time"]),
    updateTime: DateTime.parse(json["update_time"]),
    active: json["active"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "identifier": identifier,
    "title": title,
    "content": content,
    "creation_time": creationTime.toIso8601String(),
    "update_time": updateTime.toIso8601String(),
    "active": active,
  };
}
