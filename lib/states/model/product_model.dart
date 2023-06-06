import 'dart:convert';

ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  ProductModel({
    required this.items,
    required this.searchCriteria,
    required this.totalCount,
  });

  List<Item> items;
  SearchCriteria searchCriteria;
  int totalCount;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
    searchCriteria: SearchCriteria.fromJson(json["search_criteria"]),
    totalCount: json["total_count"],
  );

  Map<String, dynamic> toJson() => {
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
    "search_criteria": searchCriteria.toJson(),
    "total_count": totalCount,
  };
}

class Item {
  Item({
    required this.id,
    required this.sku,
    required this.name,
    required this.attributeSetId,
    required this.price,
    required this.status,
    required this.visibility,
    required this.typeId,
    required this.createdAt,
    required this.updatedAt,
    // required this.weight,
    required this.extensionAttributes,
    required this.productLinks,
    required this.options,
    required this.mediaGalleryEntries,
    required this.tierPrices,
    required this.customAttributes,
    required this.isWishlisted,
  });

  int id;
  String sku;
  String name;
  int attributeSetId;
  int price;
  int status;
  int visibility;
  String typeId;
  String createdAt;
  String updatedAt;
  // int weight;
  ExtensionAttributes extensionAttributes;
  List<ProductLink> productLinks;
  List<dynamic> options;
  List<MediaGalleryEntry> mediaGalleryEntries;
  List<dynamic> tierPrices;
  List<CustomAttribute> customAttributes;
  bool isWishlisted = false;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    id: json["id"],
    sku: json["sku"],
    name: json["name"],
    attributeSetId: json["attribute_set_id"],
    price: json["price"]??0,
    status: json["status"],
    visibility: json["visibility"],
    typeId: json["type_id"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    // weight: json["weight"]??0,
    extensionAttributes: ExtensionAttributes.fromJson(json["extension_attributes"]),
    productLinks: List<ProductLink>.from(json["product_links"].map((x) => ProductLink.fromJson(x))),
    options: List<dynamic>.from(json["options"].map((x) => x)),
    mediaGalleryEntries: List<MediaGalleryEntry>.from(json["media_gallery_entries"].map((x) => MediaGalleryEntry.fromJson(x))),
    tierPrices: List<dynamic>.from(json["tier_prices"].map((x) => x)),
    customAttributes: List<CustomAttribute>.from(json["custom_attributes"].map((x) => CustomAttribute.fromJson(x))), isWishlisted: false,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "sku": sku,
    "name": name,
    "attribute_set_id": attributeSetId,
    "price": price,
    "status": status,
    "visibility": visibility,
    "type_id": typeId,
    "created_at": createdAt,
    "updated_at": updatedAt,
    // "weight": weight,
    "extension_attributes": extensionAttributes.toJson(),
    "product_links": List<dynamic>.from(productLinks.map((x) => x.toJson())),
    "options": List<dynamic>.from(options.map((x) => x)),
    "media_gallery_entries": List<dynamic>.from(mediaGalleryEntries.map((x) => x.toJson())),
    "tier_prices": List<dynamic>.from(tierPrices.map((x) => x)),
    "custom_attributes": List<dynamic>.from(customAttributes.map((x) => x.toJson())),
  };
}

class CustomAttribute {
  CustomAttribute({
    required this.attributeCode,
    required this.value,
  });

  String attributeCode;
  dynamic value;

  factory CustomAttribute.fromJson(Map<String, dynamic> json) => CustomAttribute(
    attributeCode: json["attribute_code"],
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "attribute_code": attributeCode,
    "value": value,
  };
}

class ExtensionAttributes {
  ExtensionAttributes({
    required this.websiteIds,
    required this.categoryLinks,
  });

  List<int> websiteIds;
  List<CategoryLink> categoryLinks;

  factory ExtensionAttributes.fromJson(Map<String, dynamic> json) => ExtensionAttributes(
    websiteIds: List<int>.from(json["website_ids"].map((x) => x)),
    categoryLinks: List<CategoryLink>.from(json["category_links"].map((x) => CategoryLink.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "website_ids": List<dynamic>.from(websiteIds.map((x) => x)),
    "category_links": List<dynamic>.from(categoryLinks.map((x) => x.toJson())),
  };
}

class CategoryLink {
  CategoryLink({
    required this.position,
    required this.categoryId,
  });

  int position;
  String categoryId;

  factory CategoryLink.fromJson(Map<String, dynamic> json) => CategoryLink(
    position: json["position"],
    categoryId: json["category_id"],
  );

  Map<String, dynamic> toJson() => {
    "position": position,
    "category_id": categoryId,
  };
}

class MediaGalleryEntry {
  MediaGalleryEntry({
    required this.id,
    required this.mediaType,
    required this.label,
    required this.position,
    required this.disabled,
    required this.types,
    required this.file,
  });

  int id;
  String mediaType;
  dynamic label;
  int position;
  bool disabled;
  List<String> types;
  String file;

  factory MediaGalleryEntry.fromJson(Map<String, dynamic> json) => MediaGalleryEntry(
    id: json["id"],
    mediaType: json["media_type"],
    label: json["label"],
    position: json["position"],
    disabled: json["disabled"],
    types: List<String>.from(json["types"].map((x) => x)),
    file: json["file"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "media_type": mediaType,
    "label": label,
    "position": position,
    "disabled": disabled,
    "types": List<dynamic>.from(types.map((x) => x)),
    "file": file,
  };
}


class ProductLink {
  ProductLink({
    required this.sku,
    required this.linkType,
    required this.linkedProductSku,
    required this.linkedProductType,
    required this.position,
  });

  String sku;
  String linkType;
  String linkedProductSku;
  String linkedProductType;
  int position;

  factory ProductLink.fromJson(Map<String, dynamic> json) => ProductLink(
    sku: json["sku"],
    linkType: json["link_type"],
    linkedProductSku: json["linked_product_sku"],
    linkedProductType: json["linked_product_type"],
    position: json["position"],
  );

  Map<String, dynamic> toJson() => {
    "sku": sku,
    "link_type": linkType,
    "linked_product_sku": linkedProductSku,
    "linked_product_type": linkedProductType,
    "position": position,
  };
}


class SearchCriteria {
  SearchCriteria({
    required this.filterGroups,
    required this.pageSize,
  });

  List<dynamic> filterGroups;
  int? pageSize;

  factory SearchCriteria.fromJson(Map<String, dynamic> json) => SearchCriteria(
    filterGroups: List<dynamic>.from(json["filter_groups"].map((x) => x)),
    pageSize: json["page_size"],
  );

  Map<String, dynamic> toJson() => {
    "filter_groups": List<dynamic>.from(filterGroups.map((x) => x)),
    "page_size": pageSize,
  };
}

