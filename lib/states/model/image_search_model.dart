import 'dart:convert';

class ImageSearchModel {
  Productsearchbyimage productsearchbyimage;

  ImageSearchModel({
    required this.productsearchbyimage,
  });

  factory ImageSearchModel.fromRawJson(String str) => ImageSearchModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ImageSearchModel.fromJson(Map<String, dynamic> json) => ImageSearchModel(
    productsearchbyimage: Productsearchbyimage.fromJson(json["productsearchbyimage"]),
  );

  Map<String, dynamic> toJson() => {
    "productsearchbyimage": productsearchbyimage.toJson(),
  };
}

class Productsearchbyimage {
  String fileUrl;
  String imageName;
  List<PhotoSearchItem> items;

  Productsearchbyimage({
    required this.fileUrl,
    required this.imageName,
    required this.items,
  });

  factory Productsearchbyimage.fromRawJson(String str) => Productsearchbyimage.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Productsearchbyimage.fromJson(Map<String, dynamic> json) => Productsearchbyimage(
    fileUrl: json["file_url"],
    imageName: json["imageName"],
    items: List<PhotoSearchItem>.from(json["items"].map((x) => PhotoSearchItem.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "file_url": fileUrl,
    "imageName": imageName,
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
  };
}

class PhotoSearchItem {
  String entityId;
  String name;
  String sku;
  String typeId;
  String status;
  Image image;
  PriceRange priceRange;

  PhotoSearchItem({
    required this.entityId,
    required this.name,
    required this.sku,
    required this.typeId,
    required this.status,
    required this.image,
    required this.priceRange,
  });

  factory PhotoSearchItem.fromRawJson(String str) => PhotoSearchItem.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PhotoSearchItem.fromJson(Map<String, dynamic> json) => PhotoSearchItem(
    entityId: json["entity_id"]??'',
    name: json["name"]??'',
    sku: json["sku"]??'',
    typeId: json["type_id"]??'',
    status: json["status"]??'',
    image: Image.fromJson(json["image"]),
    priceRange: PriceRange.fromJson(json["price_range"]),
  );

  Map<String, dynamic> toJson() => {
    "entity_id": entityId,
    "name": name,
    "sku": sku,
    "type_id": typeId,
    "status": status,
    "image": image.toJson(),
    "price_range": priceRange.toJson(),
  };
}

class Image {
  String url;
  String label;

  Image({
    required this.url,
    required this.label,
  });

  factory Image.fromRawJson(String str) => Image.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    url: json["url"]??'',
    label: json["label"]??'',
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "label": label,
  };
}

class PriceRange {
  MinimumPrice minimumPrice;

  PriceRange({
    required this.minimumPrice,
  });

  factory PriceRange.fromRawJson(String str) => PriceRange.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PriceRange.fromJson(Map<String, dynamic> json) => PriceRange(
    minimumPrice: MinimumPrice.fromJson(json["minimum_price"]),
  );

  Map<String, dynamic> toJson() => {
    "minimum_price": minimumPrice.toJson(),
  };
}

class MinimumPrice {
  Price regularPrice;
  Price finalPrice;

  MinimumPrice({
    required this.regularPrice,
    required this.finalPrice,
  });

  factory MinimumPrice.fromRawJson(String str) => MinimumPrice.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MinimumPrice.fromJson(Map<String, dynamic> json) => MinimumPrice(
    regularPrice: Price.fromJson(json["regular_price"]),
    finalPrice: Price.fromJson(json["final_price"]),
  );

  Map<String, dynamic> toJson() => {
    "regular_price": regularPrice.toJson(),
    "final_price": finalPrice.toJson(),
  };
}

class Price {
  int value;
  Currency currency;

  Price({
    required this.value,
    required this.currency,
  });

  factory Price.fromRawJson(String str) => Price.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Price.fromJson(Map<String, dynamic> json) => Price(
    value: json["value"],
    currency: currencyValues.map[json["currency"]]!,
  );

  Map<String, dynamic> toJson() => {
    "value": value,
    "currency": currencyValues.reverse[currency],
  };
}

enum Currency { AED }

final currencyValues = EnumValues({
  "AED": Currency.AED
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
