import 'dart:convert';

List<CategoryListModel> categoryListModelFromJson(String str) => List<CategoryListModel>.from(json.decode(str).map((x) => CategoryListModel.fromJson(x)));

String categoryListModelToJson(List<CategoryListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoryListModel {
  CategoryListModel({
    required this.id,
    required this.parentId,
    required this.name,
    required this.isActive,
    required this.position,
    required this.level,
    required this.children,
    required this.createdAt,
    required this.updatedAt,
    required this.path,
    required this.includeInMenu,
    required this.customAttributes,
  });

  int id;
  int parentId;
  String name;
  bool isActive;
  int position;
  int level;
  String children;
  DateTime createdAt;
  DateTime updatedAt;
  String path;
  bool includeInMenu;
  List<CustomAttribute> customAttributes;

  factory CategoryListModel.fromJson(Map<String, dynamic> json) => CategoryListModel(
    id: json["id"],
    parentId: json["parent_id"],
    name: json["name"],
    isActive: json["is_active"],
    position: json["position"],
    level: json["level"],
    children: json["children"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    path: json["path"],
    includeInMenu: json["include_in_menu"],
    customAttributes: List<CustomAttribute>.from(json["custom_attributes"].map((x) => CustomAttribute.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "parent_id": parentId,
    "name": name,
    "is_active": isActive,
    "position": position,
    "level": level,
    "children": children,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "path": path,
    "include_in_menu": includeInMenu,
    "custom_attributes": List<dynamic>.from(customAttributes.map((x) => x.toJson())),
  };
}

class CustomAttribute {
  CustomAttribute({
    required this.attributeCode,
    required this.value,
  });

  String attributeCode;
  String value;

  factory CustomAttribute.fromJson(Map<String, dynamic> json) => CustomAttribute(
    attributeCode: json["attribute_code"],
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "attribute_code": attributeCode,
    "value": value,
  };
}
