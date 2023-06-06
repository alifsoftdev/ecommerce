import 'dart:convert';

CategoryDetailsResponseModel categoryDetailsResponseModelFromJson(String str) => CategoryDetailsResponseModel.fromJson(json.decode(str));

String categoryDetailsResponseModelToJson(CategoryDetailsResponseModel data) => json.encode(data.toJson());

class CategoryDetailsResponseModel {
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

  CategoryDetailsResponseModel({
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

  factory CategoryDetailsResponseModel.fromJson(Map<String, dynamic> json) => CategoryDetailsResponseModel(
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
  String attributeCode;
  String value;

  CustomAttribute({
    required this.attributeCode,
    required this.value,
  });

  factory CustomAttribute.fromJson(Map<String, dynamic> json) => CustomAttribute(
    attributeCode: json["attribute_code"],
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "attribute_code": attributeCode,
    "value": value,
  };
}
