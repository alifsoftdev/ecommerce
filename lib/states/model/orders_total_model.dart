import 'dart:convert';

OrdersTotalModel ordersTotalModelFromJson(String str) => OrdersTotalModel.fromJson(json.decode(str));

String ordersTotalModelToJson(OrdersTotalModel data) => json.encode(data.toJson());

class OrdersTotalModel {
  OrdersTotalModel({
    // required this.items,
    // required this.searchCriteria,
    required this.totalCount,
  });

  // List<OrdersTotalModelItem> items;
  // SearchCriteria searchCriteria;
  int totalCount;  //need this one i think so...

  factory OrdersTotalModel.fromJson(Map<String, dynamic> json) => OrdersTotalModel(
    // items: List<OrdersTotalModelItem>.from(json["items"].map((x) => OrdersTotalModelItem.fromJson(x))),
    // searchCriteria: SearchCriteria.fromJson(json["search_criteria"]),
    totalCount: json["total_count"],
  );

  Map<String, dynamic> toJson() => {
    // "items": List<dynamic>.from(items.map((x) => x.toJson())),
    // "search_criteria": searchCriteria.toJson(),
    "total_count": totalCount,
  };
}
/*

class OrdersTotalModelItem {
  OrdersTotalModelItem({
    required this.baseCurrencyCode,
    required this.baseDiscountAmount,
    required this.baseDiscountInvoiced,
    required this.baseGrandTotal,
    required this.baseDiscountTaxCompensationAmount,
    required this.baseDiscountTaxCompensationInvoiced,
    required this.baseShippingAmount,
    required this.baseShippingDiscountAmount,
    required this.baseShippingDiscountTaxCompensationAmnt,
    required this.baseShippingInclTax,
    required this.baseShippingInvoiced,
    required this.baseShippingTaxAmount,
    required this.baseSubtotal,
    required this.baseSubtotalInclTax,
    required this.baseSubtotalInvoiced,
    required this.baseTaxAmount,
    required this.baseTaxInvoiced,
    required this.baseTotalDue,
    required this.baseTotalInvoiced,
    required this.baseTotalInvoicedCost,
    required this.baseTotalPaid,
    required this.baseToGlobalRate,
    required this.baseToOrderRate,
    required this.billingAddressId,
    required this.createdAt,
    required this.customerEmail,
    required this.customerFirstname,
    required this.customerGroupId,
    required this.customerId,
    required this.customerIsGuest,
    required this.customerLastname,
    required this.customerNoteNotify,
    required this.discountAmount,
    required this.discountInvoiced,
    required this.emailSent,
    required this.entityId,
    required this.globalCurrencyCode,
    required this.grandTotal,
    required this.discountTaxCompensationAmount,
    required this.discountTaxCompensationInvoiced,
    required this.incrementId,
    required this.isVirtual,
    required this.orderCurrencyCode,
    required this.protectCode,
    required this.quoteId,
    required this.remoteIp,
    required this.shippingAmount,
    required this.shippingDescription,
    required this.shippingDiscountAmount,
    required this.shippingDiscountTaxCompensationAmount,
    required this.shippingInclTax,
    required this.shippingInvoiced,
    required this.shippingTaxAmount,
    required this.state,
    required this.status,
    required this.storeCurrencyCode,
    required this.storeId,
    required this.storeName,
    required this.storeToBaseRate,
    required this.storeToOrderRate,
    required this.subtotal,
    required this.subtotalInclTax,
    required this.subtotalInvoiced,
    required this.taxAmount,
    required this.taxInvoiced,
    required this.totalDue,
    required this.totalInvoiced,
    required this.totalItemCount,
    required this.totalPaid,
    required this.totalQtyOrdered,
    required this.updatedAt,
    required this.weight,
    required this.items,
    required this.billingAddress,
    required this.payment,
    required this.statusHistories,
    required this.extensionAttributes,
    required this.adjustmentNegative,
    required this.adjustmentPositive,
    required this.baseAdjustmentNegative,
    required this.baseAdjustmentPositive,
    required this.baseDiscountRefunded,
    required this.baseDiscountTaxCompensationRefunded,
    required this.baseShippingRefunded,
    required this.baseShippingTaxRefunded,
    required this.baseSubtotalRefunded,
    required this.baseTaxRefunded,
    required this.baseTotalOfflineRefunded,
    required this.baseTotalRefunded,
    required this.customerGender,
    required this.discountRefunded,
    required this.discountTaxCompensationRefunded,
    required this.shippingRefunded,
    required this.shippingTaxRefunded,
    required this.subtotalRefunded,
    required this.taxRefunded,
    required this.totalOfflineRefunded,
    required this.totalRefunded,
  });

  CurrencyCode baseCurrencyCode;
  int baseDiscountAmount;
  int baseDiscountInvoiced;
  int baseGrandTotal;
  int baseDiscountTaxCompensationAmount;
  int baseDiscountTaxCompensationInvoiced;
  int baseShippingAmount;
  int baseShippingDiscountAmount;
  int baseShippingDiscountTaxCompensationAmnt;
  int baseShippingInclTax;
  int baseShippingInvoiced;
  int baseShippingTaxAmount;
  int baseSubtotal;
  int baseSubtotalInclTax;
  int baseSubtotalInvoiced;
  int baseTaxAmount;
  int baseTaxInvoiced;
  int baseTotalDue;
  int baseTotalInvoiced;
  int baseTotalInvoicedCost;
  int baseTotalPaid;
  int baseToGlobalRate;
  int baseToOrderRate;
  int billingAddressId;
  DateTime createdAt;
  CustomerEmail customerEmail;
  Firstname customerFirstname;
  int customerGroupId;
  int customerId;
  int customerIsGuest;
  Lastname customerLastname;
  int customerNoteNotify;
  int discountAmount;
  int discountInvoiced;
  int emailSent;
  int entityId;
  CurrencyCode globalCurrencyCode;
  int grandTotal;
  int discountTaxCompensationAmount;
  int discountTaxCompensationInvoiced;
  String incrementId;
  int isVirtual;
  CurrencyCode orderCurrencyCode;
  String protectCode;
  int quoteId;
  RemoteIp remoteIp;
  int shippingAmount;
  ShippingDescription shippingDescription;
  int shippingDiscountAmount;
  int shippingDiscountTaxCompensationAmount;
  int shippingInclTax;
  int shippingInvoiced;
  int shippingTaxAmount;
  Stat state;
  Stat status;
  CurrencyCode storeCurrencyCode;
  int storeId;
  StoreName storeName;
  int storeToBaseRate;
  int storeToOrderRate;
  int subtotal;
  int subtotalInclTax;
  int subtotalInvoiced;
  int taxAmount;
  int taxInvoiced;
  int totalDue;
  int totalInvoiced;
  int totalItemCount;
  int totalPaid;
  int totalQtyOrdered;
  DateTime updatedAt;
  double weight;
  List<ShippingAssignmentItem> items;
  Address billingAddress;
  Payment payment;
  List<StatusHistory> statusHistories;
  ExtensionAttributes extensionAttributes;
  int adjustmentNegative;
  int adjustmentPositive;
  int baseAdjustmentNegative;
  int baseAdjustmentPositive;
  int baseDiscountRefunded;
  int baseDiscountTaxCompensationRefunded;
  int baseShippingRefunded;
  int baseShippingTaxRefunded;
  int baseSubtotalRefunded;
  int baseTaxRefunded;
  int baseTotalOfflineRefunded;
  int baseTotalRefunded;
  int customerGender;
  int discountRefunded;
  int discountTaxCompensationRefunded;
  int shippingRefunded;
  int shippingTaxRefunded;
  int subtotalRefunded;
  int taxRefunded;
  int totalOfflineRefunded;
  int totalRefunded;

  factory OrdersTotalModelItem.fromJson(Map<String, dynamic> json) => OrdersTotalModelItem(
    baseCurrencyCode: currencyCodeValues.map[json["base_currency_code"]],
    baseDiscountAmount: json["base_discount_amount"],
    baseDiscountInvoiced: json["base_discount_invoiced"] == null ? null : json["base_discount_invoiced"],
    baseGrandTotal: json["base_grand_total"],
    baseDiscountTaxCompensationAmount: json["base_discount_tax_compensation_amount"],
    baseDiscountTaxCompensationInvoiced: json["base_discount_tax_compensation_invoiced"] == null ? null : json["base_discount_tax_compensation_invoiced"],
    baseShippingAmount: json["base_shipping_amount"],
    baseShippingDiscountAmount: json["base_shipping_discount_amount"],
    baseShippingDiscountTaxCompensationAmnt: json["base_shipping_discount_tax_compensation_amnt"],
    baseShippingInclTax: json["base_shipping_incl_tax"],
    baseShippingInvoiced: json["base_shipping_invoiced"] == null ? null : json["base_shipping_invoiced"],
    baseShippingTaxAmount: json["base_shipping_tax_amount"],
    baseSubtotal: json["base_subtotal"],
    baseSubtotalInclTax: json["base_subtotal_incl_tax"],
    baseSubtotalInvoiced: json["base_subtotal_invoiced"] == null ? null : json["base_subtotal_invoiced"],
    baseTaxAmount: json["base_tax_amount"],
    baseTaxInvoiced: json["base_tax_invoiced"] == null ? null : json["base_tax_invoiced"],
    baseTotalDue: json["base_total_due"],
    baseTotalInvoiced: json["base_total_invoiced"] == null ? null : json["base_total_invoiced"],
    baseTotalInvoicedCost: json["base_total_invoiced_cost"] == null ? null : json["base_total_invoiced_cost"],
    baseTotalPaid: json["base_total_paid"] == null ? null : json["base_total_paid"],
    baseToGlobalRate: json["base_to_global_rate"],
    baseToOrderRate: json["base_to_order_rate"],
    billingAddressId: json["billing_address_id"],
    createdAt: DateTime.parse(json["created_at"]),
    customerEmail: customerEmailValues.map[json["customer_email"]],
    customerFirstname: firstnameValues.map[json["customer_firstname"]],
    customerGroupId: json["customer_group_id"] == null ? null : json["customer_group_id"],
    customerId: json["customer_id"] == null ? null : json["customer_id"],
    customerIsGuest: json["customer_is_guest"],
    customerLastname: lastnameValues.map[json["customer_lastname"]],
    customerNoteNotify: json["customer_note_notify"],
    discountAmount: json["discount_amount"],
    discountInvoiced: json["discount_invoiced"] == null ? null : json["discount_invoiced"],
    emailSent: json["email_sent"],
    entityId: json["entity_id"],
    globalCurrencyCode: currencyCodeValues.map[json["global_currency_code"]],
    grandTotal: json["grand_total"],
    discountTaxCompensationAmount: json["discount_tax_compensation_amount"],
    discountTaxCompensationInvoiced: json["discount_tax_compensation_invoiced"] == null ? null : json["discount_tax_compensation_invoiced"],
    incrementId: json["increment_id"],
    isVirtual: json["is_virtual"],
    orderCurrencyCode: currencyCodeValues.map[json["order_currency_code"]],
    protectCode: json["protect_code"],
    quoteId: json["quote_id"],
    remoteIp: remoteIpValues.map[json["remote_ip"]],
    shippingAmount: json["shipping_amount"],
    shippingDescription: shippingDescriptionValues.map[json["shipping_description"]],
    shippingDiscountAmount: json["shipping_discount_amount"],
    shippingDiscountTaxCompensationAmount: json["shipping_discount_tax_compensation_amount"],
    shippingInclTax: json["shipping_incl_tax"],
    shippingInvoiced: json["shipping_invoiced"] == null ? null : json["shipping_invoiced"],
    shippingTaxAmount: json["shipping_tax_amount"],
    state: statValues.map[json["state"]],
    status: statValues.map[json["status"]],
    storeCurrencyCode: currencyCodeValues.map[json["store_currency_code"]],
    storeId: json["store_id"],
    storeName: storeNameValues.map[json["store_name"]],
    storeToBaseRate: json["store_to_base_rate"],
    storeToOrderRate: json["store_to_order_rate"],
    subtotal: json["subtotal"],
    subtotalInclTax: json["subtotal_incl_tax"],
    subtotalInvoiced: json["subtotal_invoiced"] == null ? null : json["subtotal_invoiced"],
    taxAmount: json["tax_amount"],
    taxInvoiced: json["tax_invoiced"] == null ? null : json["tax_invoiced"],
    totalDue: json["total_due"],
    totalInvoiced: json["total_invoiced"] == null ? null : json["total_invoiced"],
    totalItemCount: json["total_item_count"],
    totalPaid: json["total_paid"] == null ? null : json["total_paid"],
    totalQtyOrdered: json["total_qty_ordered"],
    updatedAt: DateTime.parse(json["updated_at"]),
    weight: json["weight"].toDouble(),
    items: List<ShippingAssignmentItem>.from(json["items"].map((x) => ShippingAssignmentItem.fromJson(x))),
    billingAddress: Address.fromJson(json["billing_address"]),
    payment: Payment.fromJson(json["payment"]),
    statusHistories: List<StatusHistory>.from(json["status_histories"].map((x) => StatusHistory.fromJson(x))),
    extensionAttributes: ExtensionAttributes.fromJson(json["extension_attributes"]),
    adjustmentNegative: json["adjustment_negative"] == null ? null : json["adjustment_negative"],
    adjustmentPositive: json["adjustment_positive"] == null ? null : json["adjustment_positive"],
    baseAdjustmentNegative: json["base_adjustment_negative"] == null ? null : json["base_adjustment_negative"],
    baseAdjustmentPositive: json["base_adjustment_positive"] == null ? null : json["base_adjustment_positive"],
    baseDiscountRefunded: json["base_discount_refunded"] == null ? null : json["base_discount_refunded"],
    baseDiscountTaxCompensationRefunded: json["base_discount_tax_compensation_refunded"] == null ? null : json["base_discount_tax_compensation_refunded"],
    baseShippingRefunded: json["base_shipping_refunded"] == null ? null : json["base_shipping_refunded"],
    baseShippingTaxRefunded: json["base_shipping_tax_refunded"] == null ? null : json["base_shipping_tax_refunded"],
    baseSubtotalRefunded: json["base_subtotal_refunded"] == null ? null : json["base_subtotal_refunded"],
    baseTaxRefunded: json["base_tax_refunded"] == null ? null : json["base_tax_refunded"],
    baseTotalOfflineRefunded: json["base_total_offline_refunded"] == null ? null : json["base_total_offline_refunded"],
    baseTotalRefunded: json["base_total_refunded"] == null ? null : json["base_total_refunded"],
    customerGender: json["customer_gender"] == null ? null : json["customer_gender"],
    discountRefunded: json["discount_refunded"] == null ? null : json["discount_refunded"],
    discountTaxCompensationRefunded: json["discount_tax_compensation_refunded"] == null ? null : json["discount_tax_compensation_refunded"],
    shippingRefunded: json["shipping_refunded"] == null ? null : json["shipping_refunded"],
    shippingTaxRefunded: json["shipping_tax_refunded"] == null ? null : json["shipping_tax_refunded"],
    subtotalRefunded: json["subtotal_refunded"] == null ? null : json["subtotal_refunded"],
    taxRefunded: json["tax_refunded"] == null ? null : json["tax_refunded"],
    totalOfflineRefunded: json["total_offline_refunded"] == null ? null : json["total_offline_refunded"],
    totalRefunded: json["total_refunded"] == null ? null : json["total_refunded"],
  );

  Map<String, dynamic> toJson() => {
    "base_currency_code": currencyCodeValues.reverse[baseCurrencyCode],
    "base_discount_amount": baseDiscountAmount,
    "base_discount_invoiced": baseDiscountInvoiced == null ? null : baseDiscountInvoiced,
    "base_grand_total": baseGrandTotal,
    "base_discount_tax_compensation_amount": baseDiscountTaxCompensationAmount,
    "base_discount_tax_compensation_invoiced": baseDiscountTaxCompensationInvoiced == null ? null : baseDiscountTaxCompensationInvoiced,
    "base_shipping_amount": baseShippingAmount,
    "base_shipping_discount_amount": baseShippingDiscountAmount,
    "base_shipping_discount_tax_compensation_amnt": baseShippingDiscountTaxCompensationAmnt,
    "base_shipping_incl_tax": baseShippingInclTax,
    "base_shipping_invoiced": baseShippingInvoiced == null ? null : baseShippingInvoiced,
    "base_shipping_tax_amount": baseShippingTaxAmount,
    "base_subtotal": baseSubtotal,
    "base_subtotal_incl_tax": baseSubtotalInclTax,
    "base_subtotal_invoiced": baseSubtotalInvoiced == null ? null : baseSubtotalInvoiced,
    "base_tax_amount": baseTaxAmount,
    "base_tax_invoiced": baseTaxInvoiced == null ? null : baseTaxInvoiced,
    "base_total_due": baseTotalDue,
    "base_total_invoiced": baseTotalInvoiced == null ? null : baseTotalInvoiced,
    "base_total_invoiced_cost": baseTotalInvoicedCost == null ? null : baseTotalInvoicedCost,
    "base_total_paid": baseTotalPaid == null ? null : baseTotalPaid,
    "base_to_global_rate": baseToGlobalRate,
    "base_to_order_rate": baseToOrderRate,
    "billing_address_id": billingAddressId,
    "created_at": createdAt.toIso8601String(),
    "customer_email": customerEmailValues.reverse[customerEmail],
    "customer_firstname": firstnameValues.reverse[customerFirstname],
    "customer_group_id": customerGroupId == null ? null : customerGroupId,
    "customer_id": customerId == null ? null : customerId,
    "customer_is_guest": customerIsGuest,
    "customer_lastname": lastnameValues.reverse[customerLastname],
    "customer_note_notify": customerNoteNotify,
    "discount_amount": discountAmount,
    "discount_invoiced": discountInvoiced == null ? null : discountInvoiced,
    "email_sent": emailSent,
    "entity_id": entityId,
    "global_currency_code": currencyCodeValues.reverse[globalCurrencyCode],
    "grand_total": grandTotal,
    "discount_tax_compensation_amount": discountTaxCompensationAmount,
    "discount_tax_compensation_invoiced": discountTaxCompensationInvoiced == null ? null : discountTaxCompensationInvoiced,
    "increment_id": incrementId,
    "is_virtual": isVirtual,
    "order_currency_code": currencyCodeValues.reverse[orderCurrencyCode],
    "protect_code": protectCode,
    "quote_id": quoteId,
    "remote_ip": remoteIpValues.reverse[remoteIp],
    "shipping_amount": shippingAmount,
    "shipping_description": shippingDescriptionValues.reverse[shippingDescription],
    "shipping_discount_amount": shippingDiscountAmount,
    "shipping_discount_tax_compensation_amount": shippingDiscountTaxCompensationAmount,
    "shipping_incl_tax": shippingInclTax,
    "shipping_invoiced": shippingInvoiced == null ? null : shippingInvoiced,
    "shipping_tax_amount": shippingTaxAmount,
    "state": statValues.reverse[state],
    "status": statValues.reverse[status],
    "store_currency_code": currencyCodeValues.reverse[storeCurrencyCode],
    "store_id": storeId,
    "store_name": storeNameValues.reverse[storeName],
    "store_to_base_rate": storeToBaseRate,
    "store_to_order_rate": storeToOrderRate,
    "subtotal": subtotal,
    "subtotal_incl_tax": subtotalInclTax,
    "subtotal_invoiced": subtotalInvoiced == null ? null : subtotalInvoiced,
    "tax_amount": taxAmount,
    "tax_invoiced": taxInvoiced == null ? null : taxInvoiced,
    "total_due": totalDue,
    "total_invoiced": totalInvoiced == null ? null : totalInvoiced,
    "total_item_count": totalItemCount,
    "total_paid": totalPaid == null ? null : totalPaid,
    "total_qty_ordered": totalQtyOrdered,
    "updated_at": updatedAt.toIso8601String(),
    "weight": weight,
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
    "billing_address": billingAddress.toJson(),
    "payment": payment.toJson(),
    "status_histories": List<dynamic>.from(statusHistories.map((x) => x.toJson())),
    "extension_attributes": extensionAttributes.toJson(),
    "adjustment_negative": adjustmentNegative == null ? null : adjustmentNegative,
    "adjustment_positive": adjustmentPositive == null ? null : adjustmentPositive,
    "base_adjustment_negative": baseAdjustmentNegative == null ? null : baseAdjustmentNegative,
    "base_adjustment_positive": baseAdjustmentPositive == null ? null : baseAdjustmentPositive,
    "base_discount_refunded": baseDiscountRefunded == null ? null : baseDiscountRefunded,
    "base_discount_tax_compensation_refunded": baseDiscountTaxCompensationRefunded == null ? null : baseDiscountTaxCompensationRefunded,
    "base_shipping_refunded": baseShippingRefunded == null ? null : baseShippingRefunded,
    "base_shipping_tax_refunded": baseShippingTaxRefunded == null ? null : baseShippingTaxRefunded,
    "base_subtotal_refunded": baseSubtotalRefunded == null ? null : baseSubtotalRefunded,
    "base_tax_refunded": baseTaxRefunded == null ? null : baseTaxRefunded,
    "base_total_offline_refunded": baseTotalOfflineRefunded == null ? null : baseTotalOfflineRefunded,
    "base_total_refunded": baseTotalRefunded == null ? null : baseTotalRefunded,
    "customer_gender": customerGender == null ? null : customerGender,
    "discount_refunded": discountRefunded == null ? null : discountRefunded,
    "discount_tax_compensation_refunded": discountTaxCompensationRefunded == null ? null : discountTaxCompensationRefunded,
    "shipping_refunded": shippingRefunded == null ? null : shippingRefunded,
    "shipping_tax_refunded": shippingTaxRefunded == null ? null : shippingTaxRefunded,
    "subtotal_refunded": subtotalRefunded == null ? null : subtotalRefunded,
    "tax_refunded": taxRefunded == null ? null : taxRefunded,
    "total_offline_refunded": totalOfflineRefunded == null ? null : totalOfflineRefunded,
    "total_refunded": totalRefunded == null ? null : totalRefunded,
  };
}

enum CurrencyCode { AED }

final currencyCodeValues = EnumValues({
  "AED": CurrencyCode.AED
});

class Address {
  Address({
    required this.addressType,
    required this.city,
    required this.countryId,
    required this.email,
    required this.entityId,
    required this.firstname,
    required this.lastname,
    required this.parentId,
    required this.postcode,
    required this.region,
    required this.regionCode,
    required this.street,
    required this.telephone,
    required this.customerAddressId,
    required this.regionId,
    required this.company,
  });

  AddressType addressType;
  City city;
  CountryId countryId;
  CustomerEmail email;
  int entityId;
  Firstname firstname;
  Lastname lastname;
  int parentId;
  String postcode;
  City region;
  City regionCode;
  List<Street> street;
  String telephone;
  int customerAddressId;
  int regionId;
  String company;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    addressType: addressTypeValues.map[json["address_type"]],
    city: cityValues.map[json["city"]],
    countryId: countryIdValues.map[json["country_id"]],
    email: customerEmailValues.map[json["email"]],
    entityId: json["entity_id"],
    firstname: firstnameValues.map[json["firstname"]],
    lastname: lastnameValues.map[json["lastname"]],
    parentId: json["parent_id"],
    postcode: json["postcode"],
    region: cityValues.map[json["region"]],
    regionCode: cityValues.map[json["region_code"]],
    street: List<Street>.from(json["street"].map((x) => streetValues.map[x])),
    telephone: json["telephone"],
    customerAddressId: json["customer_address_id"] == null ? null : json["customer_address_id"],
    regionId: json["region_id"] == null ? null : json["region_id"],
    company: json["company"] == null ? null : json["company"],
  );

  Map<String, dynamic> toJson() => {
    "address_type": addressTypeValues.reverse[addressType],
    "city": cityValues.reverse[city],
    "country_id": countryIdValues.reverse[countryId],
    "email": customerEmailValues.reverse[email],
    "entity_id": entityId,
    "firstname": firstnameValues.reverse[firstname],
    "lastname": lastnameValues.reverse[lastname],
    "parent_id": parentId,
    "postcode": postcode,
    "region": cityValues.reverse[region],
    "region_code": cityValues.reverse[regionCode],
    "street": List<dynamic>.from(street.map((x) => streetValues.reverse[x])),
    "telephone": telephone,
    "customer_address_id": customerAddressId == null ? null : customerAddressId,
    "region_id": regionId == null ? null : regionId,
    "company": company == null ? null : company,
  };
}

enum AddressType { BILLING, SHIPPING }

final addressTypeValues = EnumValues({
  "billing": AddressType.BILLING,
  "shipping": AddressType.SHIPPING
});

enum City { DUBAI, PURCHASE, VHVO, CITY, NEW_YORK, TEST, NY }

final cityValues = EnumValues({
  "city": City.CITY,
  "Dubai": City.DUBAI,
  "New York": City.NEW_YORK,
  "NY": City.NY,
  "Purchase": City.PURCHASE,
  "Test": City.TEST,
  "vhvo": City.VHVO
});

enum CountryId { AE, US }

final countryIdValues = EnumValues({
  "AE": CountryId.AE,
  "US": CountryId.US
});

enum CustomerEmail { ALI_RUSSEL21_GMAIL_COM }

final customerEmailValues = EnumValues({
  "ali.russel21gmail.com": CustomerEmail.ALI_RUSSEL21_GMAIL_COM
});

enum Firstname { ALI, JANE, FIRSTNAME_ALI, SCJK, TEST }

final firstnameValues = EnumValues({
  "ali": Firstname.ALI,
  "Ali": Firstname.FIRSTNAME_ALI,
  "Jane": Firstname.JANE,
  "scjk": Firstname.SCJK,
  "test": Firstname.TEST
});

enum Lastname { RASEL, DOE, RUSSEL, HFJGOCJVKB, TEST }

final lastnameValues = EnumValues({
  "Doe": Lastname.DOE,
  "hfjgocjvkb": Lastname.HFJGOCJVKB,
  "rasel": Lastname.RASEL,
  "Russel": Lastname.RUSSEL,
  "test": Lastname.TEST
});

enum Street { TEST_ADDRESS, THE_123_OAK_AVE, CHITTAGONG, CHVHK, ADDRESS }

final streetValues = EnumValues({
  "address": Street.ADDRESS,
  "Chittagong": Street.CHITTAGONG,
  "chvhk": Street.CHVHK,
  "test address": Street.TEST_ADDRESS,
  "123 Oak Ave": Street.THE_123_OAK_AVE
});

class ExtensionAttributes {
  ExtensionAttributes({
    required this.shippingAssignments,
    required this.paymentAdditionalInfo,
    required this.appliedTaxes,
    required this.itemAppliedTaxes,
    required this.rewardsDiscount,
    required this.rewardsSpend,
    required this.rewardsEarn,
  });

  List<ShippingAssignment> shippingAssignments;
  List<PaymentAdditionalInfo> paymentAdditionalInfo;
  List<dynamic> appliedTaxes;
  List<dynamic> itemAppliedTaxes;
  int rewardsDiscount;
  int rewardsSpend;
  int rewardsEarn;

  factory ExtensionAttributes.fromJson(Map<String, dynamic> json) => ExtensionAttributes(
    shippingAssignments: List<ShippingAssignment>.from(json["shipping_assignments"].map((x) => ShippingAssignment.fromJson(x))),
    paymentAdditionalInfo: List<PaymentAdditionalInfo>.from(json["payment_additional_info"].map((x) => PaymentAdditionalInfo.fromJson(x))),
    appliedTaxes: List<dynamic>.from(json["applied_taxes"].map((x) => x)),
    itemAppliedTaxes: List<dynamic>.from(json["item_applied_taxes"].map((x) => x)),
    rewardsDiscount: json["rewards_discount"] == null ? null : json["rewards_discount"],
    rewardsSpend: json["rewards_spend"] == null ? null : json["rewards_spend"],
    rewardsEarn: json["rewards_earn"] == null ? null : json["rewards_earn"],
  );

  Map<String, dynamic> toJson() => {
    "shipping_assignments": List<dynamic>.from(shippingAssignments.map((x) => x.toJson())),
    "payment_additional_info": List<dynamic>.from(paymentAdditionalInfo.map((x) => x.toJson())),
    "applied_taxes": List<dynamic>.from(appliedTaxes.map((x) => x)),
    "item_applied_taxes": List<dynamic>.from(itemAppliedTaxes.map((x) => x)),
    "rewards_discount": rewardsDiscount == null ? null : rewardsDiscount,
    "rewards_spend": rewardsSpend == null ? null : rewardsSpend,
    "rewards_earn": rewardsEarn == null ? null : rewardsEarn,
  };
}

class PaymentAdditionalInfo {
  PaymentAdditionalInfo({
    required this.key,
    required this.value,
  });

  Key key;
  String value;

  factory PaymentAdditionalInfo.fromJson(Map<String, dynamic> json) => PaymentAdditionalInfo(
    key: keyValues.map[json["key"]],
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "key": keyValues.reverse[key],
    "value": value,
  };
}

enum Key { RAW_DETAILS_INFO, INSTRUCTIONS, METHOD_TITLE, CLIENT_SIDE_CONFIRMATION, TOKEN, CUSTOMER_STRIPE_ID }

final keyValues = EnumValues({
  "client_side_confirmation": Key.CLIENT_SIDE_CONFIRMATION,
  "customer_stripe_id": Key.CUSTOMER_STRIPE_ID,
  "instructions": Key.INSTRUCTIONS,
  "method_title": Key.METHOD_TITLE,
  "raw_details_info": Key.RAW_DETAILS_INFO,
  "token": Key.TOKEN
});

class ShippingAssignment {
  ShippingAssignment({
    required this.shipping,
    required this.items,
  });

  Shipping shipping;
  List<ShippingAssignmentItem> items;

  factory ShippingAssignment.fromJson(Map<String, dynamic> json) => ShippingAssignment(
    shipping: Shipping.fromJson(json["shipping"]),
    items: List<ShippingAssignmentItem>.from(json["items"].map((x) => ShippingAssignmentItem.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "shipping": shipping.toJson(),
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
  };
}

class ShippingAssignmentItem {
  ShippingAssignmentItem({
    required this.amountRefunded,
    required this.baseAmountRefunded,
    required this.baseDiscountAmount,
    required this.baseDiscountInvoiced,
    required this.baseDiscountTaxCompensationAmount,
    required this.baseDiscountTaxCompensationInvoiced,
    required this.baseOriginalPrice,
    required this.basePrice,
    required this.basePriceInclTax,
    required this.baseRowInvoiced,
    required this.baseRowTotal,
    required this.baseRowTotalInclTax,
    required this.baseTaxAmount,
    required this.baseTaxInvoiced,
    required this.createdAt,
    required this.discountAmount,
    required this.discountInvoiced,
    required this.discountPercent,
    required this.freeShipping,
    required this.discountTaxCompensationAmount,
    required this.discountTaxCompensationInvoiced,
    required this.isQtyDecimal,
    required this.isVirtual,
    required this.itemId,
    required this.name,
    required this.noDiscount,
    required this.orderId,
    required this.originalPrice,
    required this.price,
    required this.priceInclTax,
    required this.productId,
    required this.productType,
    required this.qtyCanceled,
    required this.qtyInvoiced,
    required this.qtyOrdered,
    required this.qtyRefunded,
    required this.qtyShipped,
    required this.quoteItemId,
    required this.rowInvoiced,
    required this.rowTotal,
    required this.rowTotalInclTax,
    required this.rowWeight,
    required this.sku,
    required this.storeId,
    required this.taxAmount,
    required this.taxInvoiced,
    required this.taxPercent,
    required this.updatedAt,
    required this.weeeTaxApplied,
    required this.weight,
    required this.baseDiscountRefunded,
    required this.baseDiscountTaxCompensationRefunded,
    required this.baseTaxRefunded,
    required this.discountRefunded,
    required this.discountTaxCompensationRefunded,
    required this.taxRefunded,
  });

  int amountRefunded;
  int baseAmountRefunded;
  int baseDiscountAmount;
  int baseDiscountInvoiced;
  int baseDiscountTaxCompensationAmount;
  int baseDiscountTaxCompensationInvoiced;
  int baseOriginalPrice;
  int basePrice;
  int basePriceInclTax;
  int baseRowInvoiced;
  int baseRowTotal;
  int baseRowTotalInclTax;
  int baseTaxAmount;
  int baseTaxInvoiced;
  DateTime createdAt;
  int discountAmount;
  int discountInvoiced;
  int discountPercent;
  int freeShipping;
  int discountTaxCompensationAmount;
  int discountTaxCompensationInvoiced;
  int isQtyDecimal;
  int isVirtual;
  int itemId;
  Name name;
  int noDiscount;
  int orderId;
  int originalPrice;
  int price;
  int priceInclTax;
  int productId;
  ProductType productType;
  int qtyCanceled;
  int qtyInvoiced;
  int qtyOrdered;
  int qtyRefunded;
  int qtyShipped;
  int quoteItemId;
  int rowInvoiced;
  int rowTotal;
  int rowTotalInclTax;
  double rowWeight;
  Sku sku;
  int storeId;
  int taxAmount;
  int taxInvoiced;
  int taxPercent;
  DateTime updatedAt;
  WeeeTaxApplied weeeTaxApplied;
  double weight;
  int baseDiscountRefunded;
  int baseDiscountTaxCompensationRefunded;
  int baseTaxRefunded;
  int discountRefunded;
  int discountTaxCompensationRefunded;
  int taxRefunded;

  factory ShippingAssignmentItem.fromJson(Map<String, dynamic> json) => ShippingAssignmentItem(
    amountRefunded: json["amount_refunded"],
    baseAmountRefunded: json["base_amount_refunded"],
    baseDiscountAmount: json["base_discount_amount"],
    baseDiscountInvoiced: json["base_discount_invoiced"],
    baseDiscountTaxCompensationAmount: json["base_discount_tax_compensation_amount"],
    baseDiscountTaxCompensationInvoiced: json["base_discount_tax_compensation_invoiced"] == null ? null : json["base_discount_tax_compensation_invoiced"],
    baseOriginalPrice: json["base_original_price"],
    basePrice: json["base_price"],
    basePriceInclTax: json["base_price_incl_tax"],
    baseRowInvoiced: json["base_row_invoiced"],
    baseRowTotal: json["base_row_total"],
    baseRowTotalInclTax: json["base_row_total_incl_tax"],
    baseTaxAmount: json["base_tax_amount"],
    baseTaxInvoiced: json["base_tax_invoiced"],
    createdAt: DateTime.parse(json["created_at"]),
    discountAmount: json["discount_amount"],
    discountInvoiced: json["discount_invoiced"],
    discountPercent: json["discount_percent"],
    freeShipping: json["free_shipping"],
    discountTaxCompensationAmount: json["discount_tax_compensation_amount"],
    discountTaxCompensationInvoiced: json["discount_tax_compensation_invoiced"] == null ? null : json["discount_tax_compensation_invoiced"],
    isQtyDecimal: json["is_qty_decimal"],
    isVirtual: json["is_virtual"],
    itemId: json["item_id"],
    name: nameValues.map[json["name"]],
    noDiscount: json["no_discount"],
    orderId: json["order_id"],
    originalPrice: json["original_price"],
    price: json["price"],
    priceInclTax: json["price_incl_tax"],
    productId: json["product_id"],
    productType: productTypeValues.map[json["product_type"]],
    qtyCanceled: json["qty_canceled"],
    qtyInvoiced: json["qty_invoiced"],
    qtyOrdered: json["qty_ordered"],
    qtyRefunded: json["qty_refunded"],
    qtyShipped: json["qty_shipped"],
    quoteItemId: json["quote_item_id"],
    rowInvoiced: json["row_invoiced"],
    rowTotal: json["row_total"],
    rowTotalInclTax: json["row_total_incl_tax"],
    rowWeight: json["row_weight"].toDouble(),
    sku: skuValues.map[json["sku"]],
    storeId: json["store_id"],
    taxAmount: json["tax_amount"],
    taxInvoiced: json["tax_invoiced"],
    taxPercent: json["tax_percent"],
    updatedAt: DateTime.parse(json["updated_at"]),
    weeeTaxApplied: json["weee_tax_applied"] == null ? null : weeeTaxAppliedValues.map[json["weee_tax_applied"]],
    weight: json["weight"].toDouble(),
    baseDiscountRefunded: json["base_discount_refunded"] == null ? null : json["base_discount_refunded"],
    baseDiscountTaxCompensationRefunded: json["base_discount_tax_compensation_refunded"] == null ? null : json["base_discount_tax_compensation_refunded"],
    baseTaxRefunded: json["base_tax_refunded"] == null ? null : json["base_tax_refunded"],
    discountRefunded: json["discount_refunded"] == null ? null : json["discount_refunded"],
    discountTaxCompensationRefunded: json["discount_tax_compensation_refunded"] == null ? null : json["discount_tax_compensation_refunded"],
    taxRefunded: json["tax_refunded"] == null ? null : json["tax_refunded"],
  );

  Map<String, dynamic> toJson() => {
    "amount_refunded": amountRefunded,
    "base_amount_refunded": baseAmountRefunded,
    "base_discount_amount": baseDiscountAmount,
    "base_discount_invoiced": baseDiscountInvoiced,
    "base_discount_tax_compensation_amount": baseDiscountTaxCompensationAmount,
    "base_discount_tax_compensation_invoiced": baseDiscountTaxCompensationInvoiced == null ? null : baseDiscountTaxCompensationInvoiced,
    "base_original_price": baseOriginalPrice,
    "base_price": basePrice,
    "base_price_incl_tax": basePriceInclTax,
    "base_row_invoiced": baseRowInvoiced,
    "base_row_total": baseRowTotal,
    "base_row_total_incl_tax": baseRowTotalInclTax,
    "base_tax_amount": baseTaxAmount,
    "base_tax_invoiced": baseTaxInvoiced,
    "created_at": createdAt.toIso8601String(),
    "discount_amount": discountAmount,
    "discount_invoiced": discountInvoiced,
    "discount_percent": discountPercent,
    "free_shipping": freeShipping,
    "discount_tax_compensation_amount": discountTaxCompensationAmount,
    "discount_tax_compensation_invoiced": discountTaxCompensationInvoiced == null ? null : discountTaxCompensationInvoiced,
    "is_qty_decimal": isQtyDecimal,
    "is_virtual": isVirtual,
    "item_id": itemId,
    "name": nameValues.reverse[name],
    "no_discount": noDiscount,
    "order_id": orderId,
    "original_price": originalPrice,
    "price": price,
    "price_incl_tax": priceInclTax,
    "product_id": productId,
    "product_type": productTypeValues.reverse[productType],
    "qty_canceled": qtyCanceled,
    "qty_invoiced": qtyInvoiced,
    "qty_ordered": qtyOrdered,
    "qty_refunded": qtyRefunded,
    "qty_shipped": qtyShipped,
    "quote_item_id": quoteItemId,
    "row_invoiced": rowInvoiced,
    "row_total": rowTotal,
    "row_total_incl_tax": rowTotalInclTax,
    "row_weight": rowWeight,
    "sku": skuValues.reverse[sku],
    "store_id": storeId,
    "tax_amount": taxAmount,
    "tax_invoiced": taxInvoiced,
    "tax_percent": taxPercent,
    "updated_at": updatedAt.toIso8601String(),
    "weee_tax_applied": weeeTaxApplied == null ? null : weeeTaxAppliedValues.reverse[weeeTaxApplied],
    "weight": weight,
    "base_discount_refunded": baseDiscountRefunded == null ? null : baseDiscountRefunded,
    "base_discount_tax_compensation_refunded": baseDiscountTaxCompensationRefunded == null ? null : baseDiscountTaxCompensationRefunded,
    "base_tax_refunded": baseTaxRefunded == null ? null : baseTaxRefunded,
    "discount_refunded": discountRefunded == null ? null : discountRefunded,
    "discount_tax_compensation_refunded": discountTaxCompensationRefunded == null ? null : discountTaxCompensationRefunded,
    "tax_refunded": taxRefunded == null ? null : taxRefunded,
  };
}

enum Name { SAMSUNG_55_INCH_4_K_ULTRA_HD_SMART_LED_TV, SELLER_SHOP_PRODUCT, CANON_MX492_WIRELESS_ALL_IN_ONE_SMALL_PRINTER, XTREMEPOWER_US_STAINLESS_STEEL_TUMBLE_CLOTHS_DRYER, ARCHEER_25_W_BLUETOOTH_SPEAKER_A320, TEST_SOFA_2, SELLER_SHOP_PRODUCT2, SAMPLE_PRODUCT_1 }

final nameValues = EnumValues({
  "ARCHEER 25W Bluetooth Speaker (A320)": Name.ARCHEER_25_W_BLUETOOTH_SPEAKER_A320,
  "Canon MX492 Wireless All-IN-One Small Printer": Name.CANON_MX492_WIRELESS_ALL_IN_ONE_SMALL_PRINTER,
  "Sample Product 1": Name.SAMPLE_PRODUCT_1,
  "Samsung 55-Inch 4K Ultra HD Smart LED TV": Name.SAMSUNG_55_INCH_4_K_ULTRA_HD_SMART_LED_TV,
  "Seller Shop Product": Name.SELLER_SHOP_PRODUCT,
  "Seller Shop Product2": Name.SELLER_SHOP_PRODUCT2,
  "Test Sofa 2": Name.TEST_SOFA_2,
  "XtremepowerUS Stainless Steel Tumble Cloths Dryer": Name.XTREMEPOWER_US_STAINLESS_STEEL_TUMBLE_CLOTHS_DRYER
});

enum ProductType { SIMPLE }

final productTypeValues = EnumValues({
  "simple": ProductType.SIMPLE
});

enum Sku { MB003, TEST_SELLER_PRODUCT_1, MB002, MB014, MB012, TEST1010, TEST_SELLER_PRODUCT_2, SAMPLE_101 }

final skuValues = EnumValues({
  "MB002": Sku.MB002,
  "MB003": Sku.MB003,
  "MB012": Sku.MB012,
  "MB014": Sku.MB014,
  "sample-101": Sku.SAMPLE_101,
  "test1010": Sku.TEST1010,
  "test-seller-product-1": Sku.TEST_SELLER_PRODUCT_1,
  "test-seller-product-2": Sku.TEST_SELLER_PRODUCT_2
});

enum WeeeTaxApplied { EMPTY }

final weeeTaxAppliedValues = EnumValues({
  "[]": WeeeTaxApplied.EMPTY
});

class Shipping {
  Shipping({
    required this.address,
    required this.method,
    required this.total,
  });

  Address address;
  ShippingMethod method;
  Map<String, int> total;

  factory Shipping.fromJson(Map<String, dynamic> json) => Shipping(
    address: Address.fromJson(json["address"]),
    method: shippingMethodValues.map[json["method"]],
    total: Map.from(json["total"]).map((k, v) => MapEntry<String, int>(k, v)),
  );

  Map<String, dynamic> toJson() => {
    "address": address.toJson(),
    "method": shippingMethodValues.reverse[method],
    "total": Map.from(total).map((k, v) => MapEntry<String, dynamic>(k, v)),
  };
}

enum ShippingMethod { FLATRATE_FLATRATE }

final shippingMethodValues = EnumValues({
  "flatrate_flatrate": ShippingMethod.FLATRATE_FLATRATE
});

class Payment {
  Payment({
    required this.accountStatus,
    required this.additionalInformation,
    required this.amountOrdered,
    required this.amountPaid,
    required this.baseAmountOrdered,
    required this.baseAmountPaid,
    required this.baseShippingAmount,
    required this.baseShippingCaptured,
    required this.ccExpYear,
    required this.ccLast4,
    required this.ccSsStartMonth,
    required this.ccSsStartYear,
    required this.entityId,
    required this.lastTransId,
    required this.method,
    required this.parentId,
    required this.shippingAmount,
    required this.shippingCaptured,
    required this.amountAuthorized,
    required this.baseAmountAuthorized,
    required this.amountRefunded,
    required this.baseAmountRefunded,
    required this.baseShippingRefunded,
    required this.shippingRefunded,
  });

  dynamic accountStatus;
  List<String> additionalInformation;
  int amountOrdered;
  int amountPaid;
  int baseAmountOrdered;
  int baseAmountPaid;
  int baseShippingAmount;
  int baseShippingCaptured;
  String ccExpYear;
  dynamic ccLast4;
  String ccSsStartMonth;
  String ccSsStartYear;
  int entityId;
  String lastTransId;
  PaymentMethod method;
  int parentId;
  int shippingAmount;
  int shippingCaptured;
  int amountAuthorized;
  int baseAmountAuthorized;
  int amountRefunded;
  int baseAmountRefunded;
  int baseShippingRefunded;
  int shippingRefunded;

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
    accountStatus: json["account_status"],
    additionalInformation: List<String>.from(json["additional_information"].map((x) => x == null ? null : x)),
    amountOrdered: json["amount_ordered"],
    amountPaid: json["amount_paid"] == null ? null : json["amount_paid"],
    baseAmountOrdered: json["base_amount_ordered"],
    baseAmountPaid: json["base_amount_paid"] == null ? null : json["base_amount_paid"],
    baseShippingAmount: json["base_shipping_amount"],
    baseShippingCaptured: json["base_shipping_captured"] == null ? null : json["base_shipping_captured"],
    ccExpYear: json["cc_exp_year"] == null ? null : json["cc_exp_year"],
    ccLast4: json["cc_last4"],
    ccSsStartMonth: json["cc_ss_start_month"] == null ? null : json["cc_ss_start_month"],
    ccSsStartYear: json["cc_ss_start_year"] == null ? null : json["cc_ss_start_year"],
    entityId: json["entity_id"],
    lastTransId: json["last_trans_id"] == null ? null : json["last_trans_id"],
    method: paymentMethodValues.map[json["method"]],
    parentId: json["parent_id"],
    shippingAmount: json["shipping_amount"],
    shippingCaptured: json["shipping_captured"] == null ? null : json["shipping_captured"],
    amountAuthorized: json["amount_authorized"] == null ? null : json["amount_authorized"],
    baseAmountAuthorized: json["base_amount_authorized"] == null ? null : json["base_amount_authorized"],
    amountRefunded: json["amount_refunded"] == null ? null : json["amount_refunded"],
    baseAmountRefunded: json["base_amount_refunded"] == null ? null : json["base_amount_refunded"],
    baseShippingRefunded: json["base_shipping_refunded"] == null ? null : json["base_shipping_refunded"],
    shippingRefunded: json["shipping_refunded"] == null ? null : json["shipping_refunded"],
  );

  Map<String, dynamic> toJson() => {
    "account_status": accountStatus,
    "additional_information": List<dynamic>.from(additionalInformation.map((x) => x == null ? null : x)),
    "amount_ordered": amountOrdered,
    "amount_paid": amountPaid == null ? null : amountPaid,
    "base_amount_ordered": baseAmountOrdered,
    "base_amount_paid": baseAmountPaid == null ? null : baseAmountPaid,
    "base_shipping_amount": baseShippingAmount,
    "base_shipping_captured": baseShippingCaptured == null ? null : baseShippingCaptured,
    "cc_exp_year": ccExpYear == null ? null : ccExpYear,
    "cc_last4": ccLast4,
    "cc_ss_start_month": ccSsStartMonth == null ? null : ccSsStartMonth,
    "cc_ss_start_year": ccSsStartYear == null ? null : ccSsStartYear,
    "entity_id": entityId,
    "last_trans_id": lastTransId == null ? null : lastTransId,
    "method": paymentMethodValues.reverse[method],
    "parent_id": parentId,
    "shipping_amount": shippingAmount,
    "shipping_captured": shippingCaptured == null ? null : shippingCaptured,
    "amount_authorized": amountAuthorized == null ? null : amountAuthorized,
    "base_amount_authorized": baseAmountAuthorized == null ? null : baseAmountAuthorized,
    "amount_refunded": amountRefunded == null ? null : amountRefunded,
    "base_amount_refunded": baseAmountRefunded == null ? null : baseAmountRefunded,
    "base_shipping_refunded": baseShippingRefunded == null ? null : baseShippingRefunded,
    "shipping_refunded": shippingRefunded == null ? null : shippingRefunded,
  };
}

enum PaymentMethod { CASHONDELIVERY, STRIPE_PAYMENTS, WALLETSYSTEM }

final paymentMethodValues = EnumValues({
  "cashondelivery": PaymentMethod.CASHONDELIVERY,
  "stripe_payments": PaymentMethod.STRIPE_PAYMENTS,
  "walletsystem": PaymentMethod.WALLETSYSTEM
});

enum RemoteIp { THE_10317416, THE_10317414, THE_103172139212, THE_103109239220, THE_548650139 }

final remoteIpValues = EnumValues({
  "103.109.239.220": RemoteIp.THE_103109239220,
  "103.172.139.212": RemoteIp.THE_103172139212,
  "103.174.1.4": RemoteIp.THE_10317414,
  "103.174.1.6": RemoteIp.THE_10317416,
  "54.86.50.139": RemoteIp.THE_548650139
});

enum ShippingDescription { FLAT_RATE_FIXED }

final shippingDescriptionValues = EnumValues({
  "Flat Rate - Fixed": ShippingDescription.FLAT_RATE_FIXED
});

enum Stat { PROCESSING, NEW, CLOSED, COMPLETE, PENDING }

final statValues = EnumValues({
  "closed": Stat.CLOSED,
  "complete": Stat.COMPLETE,
  "new": Stat.NEW,
  "pending": Stat.PENDING,
  "processing": Stat.PROCESSING
});

class StatusHistory {
  StatusHistory({
    required this.comment,
    required this.createdAt,
    required this.entityId,
    required this.entityName,
    required this.isCustomerNotified,
    required this.isVisibleOnFront,
    required this.parentId,
    required this.status,
  });

  String comment;
  DateTime createdAt;
  int entityId;
  String entityName;
  int isCustomerNotified;
  int isVisibleOnFront;
  int parentId;
  Stat status;

  factory StatusHistory.fromJson(Map<String, dynamic> json) => StatusHistory(
    comment: json["comment"] == null ? null : json["comment"],
    createdAt: DateTime.parse(json["created_at"]),
    entityId: json["entity_id"],
    entityName: json["entity_name"],
    isCustomerNotified: json["is_customer_notified"] == null ? null : json["is_customer_notified"],
    isVisibleOnFront: json["is_visible_on_front"],
    parentId: json["parent_id"],
    status: statValues.map[json["status"]],
  );

  Map<String, dynamic> toJson() => {
    "comment": comment == null ? null : comment,
    "created_at": createdAt.toIso8601String(),
    "entity_id": entityId,
    "entity_name": entityName,
    "is_customer_notified": isCustomerNotified == null ? null : isCustomerNotified,
    "is_visible_on_front": isVisibleOnFront,
    "parent_id": parentId,
    "status": statValues.reverse[status],
  };
}

enum StoreName { MAIN_WEBSITE_UAE_EN }

final storeNameValues = EnumValues({
  "Main Website\nUAE\nEN": StoreName.MAIN_WEBSITE_UAE_EN
});

class SearchCriteria {
  SearchCriteria({
    required this.filterGroups,
  });

  List<FilterGroup> filterGroups;

  factory SearchCriteria.fromJson(Map<String, dynamic> json) => SearchCriteria(
    filterGroups: List<FilterGroup>.from(json["filter_groups"].map((x) => FilterGroup.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "filter_groups": List<dynamic>.from(filterGroups.map((x) => x.toJson())),
  };
}

class FilterGroup {
  FilterGroup({
    required this.filters,
  });

  List<Filter> filters;

  factory FilterGroup.fromJson(Map<String, dynamic> json) => FilterGroup(
    filters: List<Filter>.from(json["filters"].map((x) => Filter.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "filters": List<dynamic>.from(filters.map((x) => x.toJson())),
  };
}

class Filter {
  Filter({
    required this.field,
    required this.value,
    required this.conditionType,
  });

  String field;
  CustomerEmail value;
  String conditionType;

  factory Filter.fromJson(Map<String, dynamic> json) => Filter(
    field: json["field"],
    value: customerEmailValues.map[json["value"]],
    conditionType: json["condition_type"],
  );

  Map<String, dynamic> toJson() => {
    "field": field,
    "value": customerEmailValues.reverse[value],
    "condition_type": conditionType,
  };
}


*/
