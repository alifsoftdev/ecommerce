import 'dart:convert';

OrderDetailsModel orderDetailsModelFromJson(String str) =>
    OrderDetailsModel.fromJson(json.decode(str));

String orderDetailsModelToJson(OrderDetailsModel data) =>
    json.encode(data.toJson());

class OrderDetailsModel {
  OrderDetailsModel({
    required this.baseCurrencyCode,
    required this.baseDiscountAmount,
    required this.baseGrandTotal,
    required this.baseDiscountTaxCompensationAmount,
    required this.baseShippingAmount,
    required this.baseShippingDiscountAmount,
    required this.baseShippingDiscountTaxCompensationAmnt,
    required this.baseShippingInclTax,
    required this.baseShippingTaxAmount,
    required this.baseSubtotal,
    required this.baseSubtotalInclTax,
    required this.baseTaxAmount,
    required this.baseTotalDue,
    required this.baseToGlobalRate,
    required this.baseToOrderRate,
    required this.billingAddressId,
    required this.createdAt,
    required this.customerEmail,
    required this.customerFirstname,
    required this.customerIsGuest,
    required this.customerLastname,
    required this.customerNoteNotify,
    required this.discountAmount,
    required this.emailSent,
    required this.entityId,
    required this.globalCurrencyCode,
    required this.grandTotal,
    required this.discountTaxCompensationAmount,
    required this.incrementId,
    required this.isVirtual,
    required this.orderCurrencyCode,
    required this.protectCode,
    this.quoteId,
    required this.remoteIp,
    required this.shippingAmount,
    required this.shippingDescription,
    required this.shippingDiscountAmount,
    required this.shippingDiscountTaxCompensationAmount,
    required this.shippingInclTax,
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
    required this.taxAmount,
    required this.totalDue,
    required this.totalItemCount,
    required this.totalQtyOrdered,
    required this.updatedAt,
    required this.weight,
    required this.items,
    required this.billingAddress,
    required this.payment,
    required this.statusHistories,
    required this.extensionAttributes,
  });

  dynamic baseCurrencyCode;
  int baseDiscountAmount;
  int baseGrandTotal;
  int baseDiscountTaxCompensationAmount;
  int baseShippingAmount;
  int baseShippingDiscountAmount;
  int baseShippingDiscountTaxCompensationAmnt;
  int baseShippingInclTax;
  int baseShippingTaxAmount;
  int baseSubtotal;
  int baseSubtotalInclTax;
  int baseTaxAmount;
  int baseTotalDue;
  int baseToGlobalRate;
  int baseToOrderRate;
  int billingAddressId;
  DateTime createdAt;
  String customerEmail;
  String customerFirstname;
  int customerIsGuest;
  String customerLastname;
  int customerNoteNotify;
  int discountAmount;
  int emailSent;
  int entityId;
  String globalCurrencyCode;
  int grandTotal;
  int discountTaxCompensationAmount;
  String incrementId;
  int isVirtual;
  String orderCurrencyCode;
  String protectCode;
  int? quoteId;
  String remoteIp;
  int shippingAmount;
  String shippingDescription;
  int shippingDiscountAmount;
  int shippingDiscountTaxCompensationAmount;
  int shippingInclTax;
  int shippingTaxAmount;
  String state;
  String status;
  String storeCurrencyCode;
  int storeId;
  String storeName;
  int storeToBaseRate;
  int storeToOrderRate;
  int subtotal;
  int subtotalInclTax;
  int taxAmount;
  int totalDue;
  int totalItemCount;
  int totalQtyOrdered;
  DateTime updatedAt;
  dynamic weight;
  List<Item> items;
  Address billingAddress;
  Payment payment;
  List<StatusHistory> statusHistories;
  ExtensionAttributes extensionAttributes;

  factory OrderDetailsModel.fromJson(Map<String, dynamic> json) =>
      OrderDetailsModel(
        baseCurrencyCode: json["base_currency_code"],
        baseDiscountAmount: json["base_discount_amount"],
        baseGrandTotal: json["base_grand_total"],
        baseDiscountTaxCompensationAmount:
            json["base_discount_tax_compensation_amount"],
        baseShippingAmount: json["base_shipping_amount"],
        baseShippingDiscountAmount: json["base_shipping_discount_amount"],
        baseShippingDiscountTaxCompensationAmnt:
            json["base_shipping_discount_tax_compensation_amnt"],
        baseShippingInclTax: json["base_shipping_incl_tax"],
        baseShippingTaxAmount: json["base_shipping_tax_amount"],
        baseSubtotal: json["base_subtotal"],
        baseSubtotalInclTax: json["base_subtotal_incl_tax"],
        baseTaxAmount: json["base_tax_amount"],
        baseTotalDue: json["base_total_due"],
        baseToGlobalRate: json["base_to_global_rate"],
        baseToOrderRate: json["base_to_order_rate"],
        billingAddressId: json["billing_address_id"],
        createdAt: DateTime.parse(json["created_at"]),
        customerEmail: json["customer_email"],
        customerFirstname: json["customer_firstname"],
        customerIsGuest: json["customer_is_guest"],
        customerLastname: json["customer_lastname"],
        customerNoteNotify: json["customer_note_notify"],
        discountAmount: json["discount_amount"],
        emailSent: json["email_sent"],
        entityId: json["entity_id"],
        globalCurrencyCode: json["global_currency_code"],
        grandTotal: json["grand_total"],
        discountTaxCompensationAmount: json["discount_tax_compensation_amount"],
        incrementId: json["increment_id"],
        isVirtual: json["is_virtual"],
        orderCurrencyCode: json["order_currency_code"],
        protectCode: json["protect_code"],
        quoteId: json["quote_id"],
        remoteIp: json["remote_ip"],
        shippingAmount: json["shipping_amount"],
        shippingDescription: json["shipping_description"],
        shippingDiscountAmount: json["shipping_discount_amount"],
        shippingDiscountTaxCompensationAmount:
            json["shipping_discount_tax_compensation_amount"],
        shippingInclTax: json["shipping_incl_tax"],
        shippingTaxAmount: json["shipping_tax_amount"],
        state: json["state"],
        status: json["status"],
        storeCurrencyCode: json["store_currency_code"],
        storeId: json["store_id"],
        storeName: json["store_name"],
        storeToBaseRate: json["store_to_base_rate"],
        storeToOrderRate: json["store_to_order_rate"],
        subtotal: json["subtotal"],
        subtotalInclTax: json["subtotal_incl_tax"],
        taxAmount: json["tax_amount"],
        totalDue: json["total_due"],
        totalItemCount: json["total_item_count"],
        totalQtyOrdered: json["total_qty_ordered"],
        updatedAt: DateTime.parse(json["updated_at"]),
        weight: json["weight"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        billingAddress: Address.fromJson(json["billing_address"]),
        payment: Payment.fromJson(json["payment"]),
        statusHistories: List<StatusHistory>.from(
            json["status_histories"].map((x) => StatusHistory.fromJson(x))),
        extensionAttributes:
            ExtensionAttributes.fromJson(json["extension_attributes"]),
      );

  Map<String, dynamic> toJson() => {
        "base_currency_code": baseCurrencyCode,
        "base_discount_amount": baseDiscountAmount,
        "base_grand_total": baseGrandTotal,
        "base_discount_tax_compensation_amount":
            baseDiscountTaxCompensationAmount,
        "base_shipping_amount": baseShippingAmount,
        "base_shipping_discount_amount": baseShippingDiscountAmount,
        "base_shipping_discount_tax_compensation_amnt":
            baseShippingDiscountTaxCompensationAmnt,
        "base_shipping_incl_tax": baseShippingInclTax,
        "base_shipping_tax_amount": baseShippingTaxAmount,
        "base_subtotal": baseSubtotal,
        "base_subtotal_incl_tax": baseSubtotalInclTax,
        "base_tax_amount": baseTaxAmount,
        "base_total_due": baseTotalDue,
        "base_to_global_rate": baseToGlobalRate,
        "base_to_order_rate": baseToOrderRate,
        "billing_address_id": billingAddressId,
        "created_at": createdAt.toIso8601String(),
        "customer_email": customerEmail,
        "customer_firstname": customerFirstname,
        "customer_is_guest": customerIsGuest,
        "customer_lastname": customerLastname,
        "customer_note_notify": customerNoteNotify,
        "discount_amount": discountAmount,
        "email_sent": emailSent,
        "entity_id": entityId,
        "global_currency_code": globalCurrencyCode,
        "grand_total": grandTotal,
        "discount_tax_compensation_amount": discountTaxCompensationAmount,
        "increment_id": incrementId,
        "is_virtual": isVirtual,
        "order_currency_code": orderCurrencyCode,
        "protect_code": protectCode,
        "quote_id": quoteId,
        "remote_ip": remoteIp,
        "shipping_amount": shippingAmount,
        "shipping_description": shippingDescription,
        "shipping_discount_amount": shippingDiscountAmount,
        "shipping_discount_tax_compensation_amount":
            shippingDiscountTaxCompensationAmount,
        "shipping_incl_tax": shippingInclTax,
        "shipping_tax_amount": shippingTaxAmount,
        "state": state,
        "status": status,
        "store_currency_code": storeCurrencyCode,
        "store_id": storeId,
        "store_name": storeName,
        "store_to_base_rate": storeToBaseRate,
        "store_to_order_rate": storeToOrderRate,
        "subtotal": subtotal,
        "subtotal_incl_tax": subtotalInclTax,
        "tax_amount": taxAmount,
        "total_due": totalDue,
        "total_item_count": totalItemCount,
        "total_qty_ordered": totalQtyOrdered,
        "updated_at": updatedAt.toIso8601String(),
        "weight": weight,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "billing_address": billingAddress.toJson(),
        "payment": payment.toJson(),
        "status_histories":
            List<dynamic>.from(statusHistories.map((x) => x.toJson())),
        "extension_attributes": extensionAttributes.toJson(),
      };
}

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
    required this.street,
    required this.telephone,
  });

  String addressType;
  String city;
  String countryId;
  String email;
  int entityId;
  String firstname;
  String lastname;
  int parentId;
  String postcode;
  List<String> street;
  String telephone;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        addressType: json["address_type"],
        city: json["city"],
        countryId: json["country_id"],
        email: json["email"],
        entityId: json["entity_id"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        parentId: json["parent_id"],
        postcode: json["postcode"],
        street: List<String>.from(json["street"].map((x) => x)),
        telephone: json["telephone"],
      );

  Map<String, dynamic> toJson() => {
        "address_type": addressType,
        "city": city,
        "country_id": countryId,
        "email": email,
        "entity_id": entityId,
        "firstname": firstname,
        "lastname": lastname,
        "parent_id": parentId,
        "postcode": postcode,
        "street": List<dynamic>.from(street.map((x) => x)),
        "telephone": telephone,
      };
}

class ExtensionAttributes {
  ExtensionAttributes({
    required this.shippingAssignments,
    required this.paymentAdditionalInfo,
    required this.appliedTaxes,
    required this.itemAppliedTaxes,
    this.rewardsDiscount,
    this.rewardsSpend,
  });

  List<ShippingAssignment> shippingAssignments;
  List<PaymentAdditionalInfo> paymentAdditionalInfo;
  List<dynamic> appliedTaxes;
  List<dynamic> itemAppliedTaxes;
  int? rewardsDiscount;
  int? rewardsSpend;

  factory ExtensionAttributes.fromJson(Map<String, dynamic> json) =>
      ExtensionAttributes(
        shippingAssignments: List<ShippingAssignment>.from(
            json["shipping_assignments"]
                .map((x) => ShippingAssignment.fromJson(x))),
        paymentAdditionalInfo: List<PaymentAdditionalInfo>.from(
            json["payment_additional_info"]
                .map((x) => PaymentAdditionalInfo.fromJson(x))),
        appliedTaxes: List<dynamic>.from(json["applied_taxes"].map((x) => x)),
        itemAppliedTaxes:
            List<dynamic>.from(json["item_applied_taxes"].map((x) => x)),
        rewardsDiscount: json["rewards_discount"],
        rewardsSpend: json["rewards_spend"],
      );

  Map<String, dynamic> toJson() => {
        "shipping_assignments":
            List<dynamic>.from(shippingAssignments.map((x) => x.toJson())),
        "payment_additional_info":
            List<dynamic>.from(paymentAdditionalInfo.map((x) => x.toJson())),
        "applied_taxes": List<dynamic>.from(appliedTaxes.map((x) => x)),
        "item_applied_taxes":
            List<dynamic>.from(itemAppliedTaxes.map((x) => x)),
        "rewards_discount": rewardsDiscount,
        "rewards_spend": rewardsSpend,
      };
}

class PaymentAdditionalInfo {
  PaymentAdditionalInfo({
    required this.key,
    required this.value,
  });

  String key;
  String value;

  factory PaymentAdditionalInfo.fromJson(Map<String, dynamic> json) =>
      PaymentAdditionalInfo(
        key: json["key"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "value": value,
      };
}

class ShippingAssignment {
  ShippingAssignment({
    required this.shipping,
    required this.items,
  });

  Shipping shipping;
  List<Item> items;

  factory ShippingAssignment.fromJson(Map<String, dynamic> json) =>
      ShippingAssignment(
        shipping: Shipping.fromJson(json["shipping"]),
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "shipping": shipping.toJson(),
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Item {
  Item({
    required this.amountRefunded,
    required this.baseAmountRefunded,
    required this.baseDiscountAmount,
    required this.baseDiscountInvoiced,
    required this.baseDiscountTaxCompensationAmount,
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
    required this.weight,
  });

  int amountRefunded;
  int baseAmountRefunded;
  int baseDiscountAmount;
  int baseDiscountInvoiced;
  int baseDiscountTaxCompensationAmount;
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
  int isQtyDecimal;
  int isVirtual;
  int itemId;
  String name;
  int noDiscount;
  int orderId;
  int originalPrice;
  int price;
  int priceInclTax;
  int productId;
  String productType;
  int qtyCanceled;
  int qtyInvoiced;
  int qtyOrdered;
  int qtyRefunded;
  int qtyShipped;
  int quoteItemId;
  int rowInvoiced;
  int rowTotal;
  int rowTotalInclTax;
  dynamic rowWeight;
  String sku;
  int storeId;
  int taxAmount;
  int taxInvoiced;
  int taxPercent;
  DateTime updatedAt;
  dynamic weight;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        amountRefunded: json["amount_refunded"] ?? 0,
        baseAmountRefunded: json["base_amount_refunded"] ?? 0,
        baseDiscountAmount: json["base_discount_amount"] ?? 0,
        baseDiscountInvoiced: json["base_discount_invoiced"] ?? 0,
        baseDiscountTaxCompensationAmount:
            json["base_discount_tax_compensation_amount"] ?? 0,
        baseOriginalPrice: json["base_original_price"] ?? 0,
        basePrice: json["base_price"] ?? 0,
        basePriceInclTax: json["base_price_incl_tax"] ?? 0,
        baseRowInvoiced: json["base_row_invoiced"] ?? 0,
        baseRowTotal: json["base_row_total"] ?? 0,
        baseRowTotalInclTax: json["base_row_total_incl_tax"] ?? 0,
        baseTaxAmount: json["base_tax_amount"] ?? 0,
        baseTaxInvoiced: json["base_tax_invoiced"] ?? 0,
        createdAt: DateTime.parse(json["created_at"]),
        discountAmount: json["discount_amount"] ?? 0,
        discountInvoiced: json["discount_invoiced"] ?? 0,
        discountPercent: json["discount_percent"] ?? 0,
        freeShipping: json["free_shipping"] ?? 0,
        discountTaxCompensationAmount:
            json["discount_tax_compensation_amount"] ?? 0,
        isQtyDecimal: json["is_qty_decimal"] ?? 0,
        isVirtual: json["is_virtual"] ?? 0,
        itemId: json["item_id"] ?? 0,
        name: json["name"] ?? '',
        noDiscount: json["no_discount"] ?? 0,
        orderId: json["order_id"] ?? 0,
        originalPrice: json["original_price"] ?? 0,
        price: json["price"] ?? 0,
        priceInclTax: json["price_incl_tax"] ?? 0,
        productId: json["product_id"] ?? 0,
        productType: json["product_type"] ?? 0,
        qtyCanceled: json["qty_canceled"] ?? 0,
        qtyInvoiced: json["qty_invoiced"] ?? 0,
        qtyOrdered: json["qty_ordered"] ?? 0,
        qtyRefunded: json["qty_refunded"] ?? 0,
        qtyShipped: json["qty_shipped"] ?? 0,
        quoteItemId: json["quote_item_id"] ?? 0,
        rowInvoiced: json["row_invoiced"] ?? 0,
        rowTotal: json["row_total"] ?? 0,
        rowTotalInclTax: json["row_total_incl_tax"] ?? 0,
        rowWeight: json["row_weight"] ?? 0,
        sku: json["sku"] ?? '',
        storeId: json["store_id"] ?? 0,
        taxAmount: json["tax_amount"] ?? 0,
        taxInvoiced: json["tax_invoiced"] ?? 0,
        taxPercent: json["tax_percent"] ?? 0,
        updatedAt: DateTime.parse(json["updated_at"]),
        weight: json["weight"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "amount_refunded": amountRefunded,
        "base_amount_refunded": baseAmountRefunded,
        "base_discount_amount": baseDiscountAmount,
        "base_discount_invoiced": baseDiscountInvoiced,
        "base_discount_tax_compensation_amount":
            baseDiscountTaxCompensationAmount,
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
        "is_qty_decimal": isQtyDecimal,
        "is_virtual": isVirtual,
        "item_id": itemId,
        "name": name,
        "no_discount": noDiscount,
        "order_id": orderId,
        "original_price": originalPrice,
        "price": price,
        "price_incl_tax": priceInclTax,
        "product_id": productId,
        "product_type": productType,
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
        "sku": sku,
        "store_id": storeId,
        "tax_amount": taxAmount,
        "tax_invoiced": taxInvoiced,
        "tax_percent": taxPercent,
        "updated_at": updatedAt.toIso8601String(),
        "weight": weight,
      };
}

class Shipping {
  Shipping({
    required this.address,
    required this.method,
    required this.total,
  });

  Address address;
  String method;
  Total total;

  factory Shipping.fromJson(Map<String, dynamic> json) => Shipping(
        address: Address.fromJson(json["address"]),
        method: json["method"],
        total: Total.fromJson(json["total"]),
      );

  Map<String, dynamic> toJson() => {
        "address": address.toJson(),
        "method": method,
        "total": total.toJson(),
      };
}

class Total {
  Total({
    required this.baseShippingAmount,
    required this.baseShippingDiscountAmount,
    required this.baseShippingDiscountTaxCompensationAmnt,
    required this.baseShippingInclTax,
    required this.baseShippingTaxAmount,
    required this.shippingAmount,
    required this.shippingDiscountAmount,
    required this.shippingDiscountTaxCompensationAmount,
    required this.shippingInclTax,
    required this.shippingTaxAmount,
  });

  int baseShippingAmount;
  int baseShippingDiscountAmount;
  int baseShippingDiscountTaxCompensationAmnt;
  int baseShippingInclTax;
  int baseShippingTaxAmount;
  int shippingAmount;
  int shippingDiscountAmount;
  int shippingDiscountTaxCompensationAmount;
  int shippingInclTax;
  int shippingTaxAmount;

  factory Total.fromJson(Map<String, dynamic> json) => Total(
        baseShippingAmount: json["base_shipping_amount"],
        baseShippingDiscountAmount: json["base_shipping_discount_amount"],
        baseShippingDiscountTaxCompensationAmnt:
            json["base_shipping_discount_tax_compensation_amnt"],
        baseShippingInclTax: json["base_shipping_incl_tax"],
        baseShippingTaxAmount: json["base_shipping_tax_amount"],
        shippingAmount: json["shipping_amount"],
        shippingDiscountAmount: json["shipping_discount_amount"],
        shippingDiscountTaxCompensationAmount:
            json["shipping_discount_tax_compensation_amount"],
        shippingInclTax: json["shipping_incl_tax"],
        shippingTaxAmount: json["shipping_tax_amount"],
      );

  Map<String, dynamic> toJson() => {
        "base_shipping_amount": baseShippingAmount,
        "base_shipping_discount_amount": baseShippingDiscountAmount,
        "base_shipping_discount_tax_compensation_amnt":
            baseShippingDiscountTaxCompensationAmnt,
        "base_shipping_incl_tax": baseShippingInclTax,
        "base_shipping_tax_amount": baseShippingTaxAmount,
        "shipping_amount": shippingAmount,
        "shipping_discount_amount": shippingDiscountAmount,
        "shipping_discount_tax_compensation_amount":
            shippingDiscountTaxCompensationAmount,
        "shipping_incl_tax": shippingInclTax,
        "shipping_tax_amount": shippingTaxAmount,
      };
}

class Payment {
  Payment({
    required this.accountStatus,
    // required this.additionalInformation,
    required this.amountAuthorized,
    required this.amountOrdered,
    required this.baseAmountAuthorized,
    required this.baseAmountOrdered,
    required this.baseShippingAmount,
    required this.ccExpYear,
    required this.ccLast4,
    required this.ccSsStartMonth,
    required this.ccSsStartYear,
    required this.entityId,
    required this.lastTransId,
    required this.method,
    required this.parentId,
    required this.shippingAmount,
  });

  dynamic accountStatus;
  // List<String> additionalInformation;
  int amountAuthorized;
  int amountOrdered;
  int baseAmountAuthorized;
  int baseAmountOrdered;
  int baseShippingAmount;
  String ccExpYear;
  dynamic ccLast4;
  String ccSsStartMonth;
  String ccSsStartYear;
  int entityId;
  String lastTransId;
  String method;
  int parentId;
  int shippingAmount;

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
        accountStatus: json["account_status"],
        // additionalInformation: List<String>.from(json["additional_information"].map((x) => x)),
        amountAuthorized: json["amount_authorized"] ?? 0,
        amountOrdered: json["amount_ordered"] ?? 0,
        baseAmountAuthorized: json["base_amount_authorized"] ?? 0,
        baseAmountOrdered: json["base_amount_ordered"] ?? 0,
        baseShippingAmount: json["base_shipping_amount"] ?? 0,
        ccExpYear: json["cc_exp_year"] ?? '',
        ccLast4: json["cc_last4"],
        ccSsStartMonth: json["cc_ss_start_month"] ?? '',
        ccSsStartYear: json["cc_ss_start_year"],
        entityId: json["entity_id"],
        lastTransId: json["last_trans_id"] ?? '',
        method: json["method"] ?? '',
        parentId: json["parent_id"] ?? 0,
        shippingAmount: json["shipping_amount"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "account_status": accountStatus,
        // "additional_information": List<dynamic>.from(additionalInformation.map((x) => x)),
        "amount_authorized": amountAuthorized,
        "amount_ordered": amountOrdered,
        "base_amount_authorized": baseAmountAuthorized,
        "base_amount_ordered": baseAmountOrdered,
        "base_shipping_amount": baseShippingAmount,
        "cc_exp_year": ccExpYear,
        "cc_last4": ccLast4,
        "cc_ss_start_month": ccSsStartMonth,
        "cc_ss_start_year": ccSsStartYear,
        "entity_id": entityId,
        "last_trans_id": lastTransId,
        "method": method,
        "parent_id": parentId,
        "shipping_amount": shippingAmount,
      };
}

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
  dynamic isCustomerNotified;
  int isVisibleOnFront;
  int parentId;
  String status;

  factory StatusHistory.fromJson(Map<String, dynamic> json) => StatusHistory(
        comment: json["comment"] ?? '',
        createdAt: DateTime.parse(json["created_at"]),
        entityId: json["entity_id"] ?? 0,
        entityName: json["entity_name"] ?? '',
        isCustomerNotified: json["is_customer_notified"],
        isVisibleOnFront: json["is_visible_on_front"] ?? '',
        parentId: json["parent_id"] ?? 0,
        status: json["status"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "comment": comment,
        "created_at": createdAt.toIso8601String(),
        "entity_id": entityId,
        "entity_name": entityName,
        "is_customer_notified": isCustomerNotified,
        "is_visible_on_front": isVisibleOnFront,
        "parent_id": parentId,
        "status": status,
      };
}
