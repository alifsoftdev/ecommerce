import 'dart:convert';

PrivacyModel privacyModelFromJson(String str) => PrivacyModel.fromJson(json.decode(str));

String privacyModelToJson(PrivacyModel data) => json.encode(data.toJson());

class PrivacyModel {
  PrivacyModel({
    required this.id,
    required this.identifier,
    required this.title,
    required this.pageLayout,
    required this.metaTitle,
    required this.metaKeywords,
    required this.metaDescription,
    required this.contentHeading,
    required this.content,
    required this.creationTime,
    required this.updateTime,
    required this.sortOrder,
    required this.customTheme,
    required this.customRootTemplate,
    required this.active,
  });

  int id;
  String identifier;
  String title;
  String pageLayout;
  String metaTitle;
  String metaKeywords;
  String metaDescription;
  String contentHeading;
  String content;
  DateTime creationTime;
  DateTime updateTime;
  String sortOrder;
  String customTheme;
  String customRootTemplate;
  bool active;

  factory PrivacyModel.fromJson(Map<String, dynamic> json) => PrivacyModel(
    id: json["id"],
    identifier: json["identifier"],
    title: json["title"],
    pageLayout: json["page_layout"],
    metaTitle: json["meta_title"],
    metaKeywords: json["meta_keywords"],
    metaDescription: json["meta_description"],
    contentHeading: json["content_heading"],
    content: json["content"],
    creationTime: DateTime.parse(json["creation_time"]),
    updateTime: DateTime.parse(json["update_time"]),
    sortOrder: json["sort_order"],
    customTheme: json["custom_theme"],
    customRootTemplate: json["custom_root_template"],
    active: json["active"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "identifier": identifier,
    "title": title,
    "page_layout": pageLayout,
    "meta_title": metaTitle,
    "meta_keywords": metaKeywords,
    "meta_description": metaDescription,
    "content_heading": contentHeading,
    "content": content,
    "creation_time": creationTime.toIso8601String(),
    "update_time": updateTime.toIso8601String(),
    "sort_order": sortOrder,
    "custom_theme": customTheme,
    "custom_root_template": customRootTemplate,
    "active": active,
  };
}
