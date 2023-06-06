import 'dart:convert';

MyCartModel myCartModelFromJson(String str) =>
    MyCartModel.fromJson(json.decode(str));

String myCartModelToJson(MyCartModel data) => json.encode(data.toJson());

class MyCartModel {
  MyCartModel({
    required this.grandTotal,
    required this.baseGrandTotal,
    required this.subtotal,
    required this.baseSubtotal,
    required this.discountAmount,
    required this.baseDiscountAmount,
    required this.subtotalWithDiscount,
    required this.baseSubtotalWithDiscount,
    required this.shippingAmount,
    required this.baseShippingAmount,
    required this.shippingDiscountAmount,
    required this.baseShippingDiscountAmount,
    required this.taxAmount,
    required this.baseTaxAmount,
    required this.weeeTaxAppliedAmount,
    required this.shippingTaxAmount,
    required this.baseShippingTaxAmount,
    required this.subtotalInclTax,
    required this.shippingInclTax,
    required this.baseShippingInclTax,
    required this.baseCurrencyCode,
    required this.quoteCurrencyCode,
    required this.itemsQty,
    required this.items,
    required this.totalSegments,
  });

  int grandTotal;
  int baseGrandTotal;
  int subtotal;
  int baseSubtotal;
  int discountAmount;
  int baseDiscountAmount;
  int subtotalWithDiscount;
  int baseSubtotalWithDiscount;
  int shippingAmount;
  dynamic baseShippingAmount;
  dynamic shippingDiscountAmount;
  dynamic baseShippingDiscountAmount;
  int taxAmount;
  int baseTaxAmount;
  dynamic weeeTaxAppliedAmount;
  int shippingTaxAmount;
  int baseShippingTaxAmount;
  int subtotalInclTax;
  int shippingInclTax;
  int baseShippingInclTax;
  String baseCurrencyCode;
  String quoteCurrencyCode;
  int itemsQty;
  List<Item> items;
  List<TotalSegment> totalSegments;

  factory MyCartModel.fromJson(Map<String, dynamic> json) => MyCartModel(
        grandTotal: json["grand_total"],
        baseGrandTotal: json["base_grand_total"],
        subtotal: json["subtotal"],
        baseSubtotal: json["base_subtotal"],
        discountAmount: json["discount_amount"],
        baseDiscountAmount: json["base_discount_amount"],
        subtotalWithDiscount: json["subtotal_with_discount"],
        baseSubtotalWithDiscount: json["base_subtotal_with_discount"],
        shippingAmount: json["shipping_amount"],
        baseShippingAmount: json["base_shipping_amount"],
        shippingDiscountAmount: json["shipping_discount_amount"],
        baseShippingDiscountAmount: json["base_shipping_discount_amount"],
        taxAmount: json["tax_amount"],
        baseTaxAmount: json["base_tax_amount"],
        weeeTaxAppliedAmount: json["weee_tax_applied_amount"],
        shippingTaxAmount: json["shipping_tax_amount"],
        baseShippingTaxAmount: json["base_shipping_tax_amount"],
        subtotalInclTax: json["subtotal_incl_tax"],
        shippingInclTax: json["shipping_incl_tax"],
        baseShippingInclTax: json["base_shipping_incl_tax"],
        baseCurrencyCode: json["base_currency_code"],
        quoteCurrencyCode: json["quote_currency_code"],
        itemsQty: json["items_qty"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        totalSegments: List<TotalSegment>.from(
            json["total_segments"].map((x) => TotalSegment.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "grand_total": grandTotal,
        "base_grand_total": baseGrandTotal,
        "subtotal": subtotal,
        "base_subtotal": baseSubtotal,
        "discount_amount": discountAmount,
        "base_discount_amount": baseDiscountAmount,
        "subtotal_with_discount": subtotalWithDiscount,
        "base_subtotal_with_discount": baseSubtotalWithDiscount,
        "shipping_amount": shippingAmount,
        "base_shipping_amount": baseShippingAmount,
        "shipping_discount_amount": shippingDiscountAmount,
        "base_shipping_discount_amount": baseShippingDiscountAmount,
        "tax_amount": taxAmount,
        "base_tax_amount": baseTaxAmount,
        "weee_tax_applied_amount": weeeTaxAppliedAmount,
        "shipping_tax_amount": shippingTaxAmount,
        "base_shipping_tax_amount": baseShippingTaxAmount,
        "subtotal_incl_tax": subtotalInclTax,
        "shipping_incl_tax": shippingInclTax,
        "base_shipping_incl_tax": baseShippingInclTax,
        "base_currency_code": baseCurrencyCode,
        "quote_currency_code": quoteCurrencyCode,
        "items_qty": itemsQty,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "total_segments":
            List<dynamic>.from(totalSegments.map((x) => x.toJson())),
      };
}

class Item {
  Item({
    required this.itemId,
    required this.price,
    required this.basePrice,
    required this.qty,
    required this.rowTotal,
    required this.baseRowTotal,
    required this.rowTotalWithDiscount,
    required this.taxAmount,
    required this.baseTaxAmount,
    required this.taxPercent,
    required this.discountAmount,
    required this.baseDiscountAmount,
    required this.discountPercent,
    required this.priceInclTax,
    required this.basePriceInclTax,
    required this.rowTotalInclTax,
    required this.baseRowTotalInclTax,
    required this.options,
    required this.weeeTaxAppliedAmount,
    required this.weeeTaxApplied,
    required this.name,
  });

  int itemId;
  int price;
  int basePrice;
  int qty;
  int rowTotal;
  int baseRowTotal;
  int rowTotalWithDiscount;
  int taxAmount;
  int baseTaxAmount;
  int taxPercent;
  int discountAmount;
  int baseDiscountAmount;
  int discountPercent;
  dynamic priceInclTax;
  int basePriceInclTax;
  int rowTotalInclTax;
  int baseRowTotalInclTax;
  String options;
  dynamic weeeTaxAppliedAmount;
  dynamic weeeTaxApplied;
  String name;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        itemId: json["item_id"] ?? 0,
        price: json["price"] ?? 0,
        basePrice: json["base_price"] ?? 0,
        qty: json["qty"] ?? 0,
        rowTotal: json["row_total"] ?? 0,
        baseRowTotal: json["base_row_total"] ?? 0,
        rowTotalWithDiscount: json["row_total_with_discount"],
        taxAmount: json["tax_amount"],
        baseTaxAmount: json["base_tax_amount"],
        taxPercent: json["tax_percent"],
        discountAmount: json["discount_amount"],
        baseDiscountAmount: json["base_discount_amount"],
        discountPercent: json["discount_percent"],
        priceInclTax: json["price_incl_tax"],
        basePriceInclTax: json["base_price_incl_tax"],
        rowTotalInclTax: json["row_total_incl_tax"],
        baseRowTotalInclTax: json["base_row_total_incl_tax"],
        options: json["options"],
        weeeTaxAppliedAmount: json["weee_tax_applied_amount"],
        weeeTaxApplied: json["weee_tax_applied"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "item_id": itemId,
        "price": price,
        "base_price": basePrice,
        "qty": qty,
        "row_total": rowTotal,
        "base_row_total": baseRowTotal,
        "row_total_with_discount": rowTotalWithDiscount,
        "tax_amount": taxAmount,
        "base_tax_amount": baseTaxAmount,
        "tax_percent": taxPercent,
        "discount_amount": discountAmount,
        "base_discount_amount": baseDiscountAmount,
        "discount_percent": discountPercent,
        "price_incl_tax": priceInclTax,
        "base_price_incl_tax": basePriceInclTax,
        "row_total_incl_tax": rowTotalInclTax,
        "base_row_total_incl_tax": baseRowTotalInclTax,
        "options": options,
        "weee_tax_applied_amount": weeeTaxAppliedAmount,
        "weee_tax_applied": weeeTaxApplied,
        "name": name,
      };
}

class TotalSegment {
  TotalSegment({
    required this.code,
    required this.title,
    required this.value,
    //  required this.extensionAttributes,
    required this.area,
  });

  String code;
  String title;
  int value;
  // ExtensionAttributes extensionAttributes;
  String area;

  factory TotalSegment.fromJson(Map<String, dynamic> json) => TotalSegment(
        code: json["code"] ?? '',
        title: json["title"] ?? '',
        value: json["value"] ?? 0,
        // extensionAttributes: json["extension_attributes"]??{},
        area: json["area"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "title": title,
        "value": value,
        // "extension_attributes": extensionAttributes ,
        "area": area,
      };
}

class ExtensionAttributes {
  ExtensionAttributes({
    required this.taxGrandtotalDetails,
  });

  List<dynamic> taxGrandtotalDetails;

  factory ExtensionAttributes.fromJson(Map<String, dynamic> json) =>
      ExtensionAttributes(
        taxGrandtotalDetails:
            List<dynamic>.from(json["tax_grandtotal_details"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "tax_grandtotal_details":
            List<dynamic>.from(taxGrandtotalDetails.map((x) => x)) ?? [],
      };
}
