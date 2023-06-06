import 'dart:convert';

SearchModel searchModelFromJson(String str) => SearchModel.fromJson(json.decode(str));

String searchModelToJson(SearchModel data) => json.encode(data.toJson());

class SearchModel {
  final List<SearchItem> items;
  // final SearchCriteria searchCriteria;
  final int totalCount;

  SearchModel({
    required this.items,
    // required this.searchCriteria,
    required this.totalCount,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
    items: List<SearchItem>.from(json["items"].map((x) => SearchItem.fromJson(x)))??[],
    // searchCriteria: SearchCriteria.fromJson(json["search_criteria"]),
    totalCount: json["total_count"]??0,
  );

  Map<String, dynamic> toJson() => {
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
    // "search_criteria": searchCriteria.toJson(),
    "total_count": totalCount,
  };
}

class SearchItem {
  final int id;
  final String sku;
  final String name;
  final int attributeSetId;
  final int price;
  final int status;
  final int visibility;
  final String typeId;
  final String createdAt;
  final String updatedAt;
  final int weight;
  // final ExtensionAttributes extensionAttributes;
  // final List<ProductLink> productLinks;
  // final List<dynamic> options;
  final List<MediaGalleryEntry> mediaGalleryEntries;
  // final List<dynamic> tierPrices;
  // final List<CustomAttribute> customAttributes;

  SearchItem({
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
    required this.weight,
    // required this.extensionAttributes,
    // required this.productLinks,
    // required this.options,
    required this.mediaGalleryEntries,
    // required this.tierPrices,
    // required this.customAttributes,
  });

  factory SearchItem.fromJson(Map<String, dynamic> json) => SearchItem(
    id: json["id"]??0,
    sku: json["sku"]??'',
    name: json["name"]??'',
    attributeSetId: json["attribute_set_id"]??'',
    price: json["price"]??'',
    status: json["status"]??0,
    visibility: json["visibility"]??0,
    typeId: json["type_id"]??0,
    createdAt: json["created_at"]??'',
    updatedAt: json["updated_at"]??'',
    weight: json["weight"]??0,
    // extensionAttributes: ExtensionAttributes.fromJson(json["extension_attributes"]),
    // productLinks: List<ProductLink>.from(json["product_links"].map((x) => ProductLink.fromJson(x))),
    // options: List<dynamic>.from(json["options"].map((x) => x)),
    mediaGalleryEntries: List<MediaGalleryEntry>.from(json["media_gallery_entries"].map((x) => MediaGalleryEntry.fromJson(x)))??[],
    // tierPrices: List<dynamic>.from(json["tier_prices"].map((x) => x)),
    // customAttributes: List<CustomAttribute>.from(json["custom_attributes"].map((x) => CustomAttribute.fromJson(x))),
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
    "weight": weight,
    // "extension_attributes": extensionAttributes.toJson(),
    // "product_links": List<dynamic>.from(productLinks.map((x) => x.toJson())),
    // "options": List<dynamic>.from(options.map((x) => x)),
    // "media_gallery_entries": List<dynamic>.from(mediaGalleryEntries.map((x) => x.toJson())),
    // "tier_prices": List<dynamic>.from(tierPrices.map((x) => x)),
    // "custom_attributes": List<dynamic>.from(customAttributes.map((x) => x.toJson())),
  };
}

class CustomAttribute {
  final String attributeCode;
  final dynamic value;

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

class ExtensionAttributes {
  final List<int> websiteIds;
  final List<CategoryLink>? categoryLinks;
  final List<ConfigurableProductOption>? configurableProductOptions;
  final List<int>? configurableProductLinks;

  ExtensionAttributes({
    required this.websiteIds,
    this.categoryLinks,
    this.configurableProductOptions,
    this.configurableProductLinks,
  });

  factory ExtensionAttributes.fromJson(Map<String, dynamic> json) => ExtensionAttributes(
    websiteIds: List<int>.from(json["website_ids"].map((x) => x)),
    categoryLinks: json["category_links"] == null ? [] : List<CategoryLink>.from(json["category_links"]!.map((x) => CategoryLink.fromJson(x))),
    configurableProductOptions: json["configurable_product_options"] == null ? [] : List<ConfigurableProductOption>.from(json["configurable_product_options"]!.map((x) => ConfigurableProductOption.fromJson(x))),
    configurableProductLinks: json["configurable_product_links"] == null ? [] : List<int>.from(json["configurable_product_links"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "website_ids": List<dynamic>.from(websiteIds.map((x) => x)),
    "category_links": categoryLinks == null ? [] : List<dynamic>.from(categoryLinks!.map((x) => x.toJson())),
    "configurable_product_options": configurableProductOptions == null ? [] : List<dynamic>.from(configurableProductOptions!.map((x) => x.toJson())),
    "configurable_product_links": configurableProductLinks == null ? [] : List<dynamic>.from(configurableProductLinks!.map((x) => x)),
  };
}

class CategoryLink {
  final int position;
  final String categoryId;

  CategoryLink({
    required this.position,
    required this.categoryId,
  });

  factory CategoryLink.fromJson(Map<String, dynamic> json) => CategoryLink(
    position: json["position"],
    categoryId: json["category_id"],
  );

  Map<String, dynamic> toJson() => {
    "position": position,
    "category_id": categoryId,
  };
}

class ConfigurableProductOption {
  final int id;
  final String attributeId;
  final String label;
  final int position;
  final List<ValueElement> values;
  final int productId;

  ConfigurableProductOption({
    required this.id,
    required this.attributeId,
    required this.label,
    required this.position,
    required this.values,
    required this.productId,
  });

  factory ConfigurableProductOption.fromJson(Map<String, dynamic> json) => ConfigurableProductOption(
    id: json["id"],
    attributeId: json["attribute_id"],
    label: json["label"],
    position: json["position"],
    values: List<ValueElement>.from(json["values"].map((x) => ValueElement.fromJson(x))),
    productId: json["product_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "attribute_id": attributeId,
    "label": label,
    "position": position,
    "values": List<dynamic>.from(values.map((x) => x.toJson())),
    "product_id": productId,
  };
}

class ValueElement {
  final int valueIndex;

  ValueElement({
    required this.valueIndex,
  });

  factory ValueElement.fromJson(Map<String, dynamic> json) => ValueElement(
    valueIndex: json["value_index"],
  );

  Map<String, dynamic> toJson() => {
    "value_index": valueIndex,
  };
}

class MediaGalleryEntry {
  final int id;
  // final String mediaType;
  // final dynamic label;
  // final int position;
  // final bool disabled;
  // final List<String> types;
  final String file;

  MediaGalleryEntry({
    required this.id,
    // required this.mediaType,
    // this.label,
    // required this.position,
    // required this.disabled,
    // required this.types,
    required this.file,
  });

  factory MediaGalleryEntry.fromJson(Map<String, dynamic> json) => MediaGalleryEntry(
    id: json["id"]??0,
    // mediaType: json["media_type"],
    // label: json["label"],
    // position: json["position"],
    // disabled: json["disabled"],
    // types: List<String>.from(json["types"].map((x) => types.map[x]!)),
    file: json["file"]??'',
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    // "media_type": mediaType,
    // "label": label,
    // "position": position,
    // "disabled": disabled,
    // "types": List<dynamic>.from(types.map((x) => typeValues.reverse[x])),
    "file": file,
  };
}

class ProductLink {
  final String sku;
  final String linkType;
  final String linkedProductSku;
  final String linkedProductType;
  final int position;

  ProductLink({
    required this.sku,
    required this.linkType,
    required this.linkedProductSku,
    required this.linkedProductType,
    required this.position,
  });

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
  final List<FilterGroup> filterGroups;

  SearchCriteria({
    required this.filterGroups,
  });

  factory SearchCriteria.fromJson(Map<String, dynamic> json) => SearchCriteria(
    filterGroups: List<FilterGroup>.from(json["filter_groups"].map((x) => FilterGroup.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "filter_groups": List<dynamic>.from(filterGroups.map((x) => x.toJson())),
  };
}

class FilterGroup {
  final List<Filter> filters;

  FilterGroup({
    required this.filters,
  });

  factory FilterGroup.fromJson(Map<String, dynamic> json) => FilterGroup(
    filters: List<Filter>.from(json["filters"].map((x) => Filter.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "filters": List<dynamic>.from(filters.map((x) => x.toJson())),
  };
}

class Filter {
  final String field;
  final String value;
  final String conditionType;

  Filter({
    required this.field,
    required this.value,
    required this.conditionType,
  });

  factory Filter.fromJson(Map<String, dynamic> json) => Filter(
    field: json["field"],
    value: json["value"],
    conditionType: json["condition_type"],
  );

  Map<String, dynamic> toJson() => {
    "field": field,
    "value": value,
    "condition_type": conditionType,
  };
}

