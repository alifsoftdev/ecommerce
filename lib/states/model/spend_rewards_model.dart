import 'dart:convert';

SpendRewardsModel spendRewardsModelFromJson(String str) => SpendRewardsModel.fromJson(json.decode(str));

String spendRewardsModelToJson(SpendRewardsModel data) => json.encode(data.toJson());

class SpendRewardsModel {
  SpendRewardsModel({
    required this.items,
    required this.searchCriteria,
    required this.totalCount,
  });

  List<Item> items;
  dynamic searchCriteria;
  int totalCount;

  factory SpendRewardsModel.fromJson(Map<String, dynamic> json) => SpendRewardsModel(
    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
    searchCriteria: json["search_criteria"],
    totalCount: json["total_count"],
  );

  Map<String, dynamic> toJson() => {
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
    "search_criteria": searchCriteria,
    "total_count": totalCount,
  };
}

class Item {
  Item({
    required this.id,
    required this.ruleId,
    required this.name,
    required this.description,
    required this.isActive,
    required this.activeFrom,
    required this.activeTo,
    required this.type,
    required this.condition,
    required this.action,
    required this.sortOrder,
    required this.isStopProcessing,
    required this.frontName,
    required this.tiers,
    required this.websiteIds,
    required this.customerGroupIds,
  });

  int id;
  int ruleId;
  String name;
  dynamic description;
  bool isActive;
  dynamic activeFrom;
  dynamic activeTo;
  String type;
  Tion condition;
  Tion action;
  int sortOrder;
  int isStopProcessing;
  String frontName;
  List<Tier> tiers;
  List<int> websiteIds;
  List<String> customerGroupIds;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    id: json["id"],
    ruleId: json["rule_id"],
    name: json["name"],
    description: json["description"],
    isActive: json["is_active"],
    activeFrom: json["active_from"],
    activeTo: json["active_to"],
    type: json["type"],
    condition: Tion.fromJson(json["condition"]),
    action: Tion.fromJson(json["action"]),
    sortOrder: json["sort_order"],
    isStopProcessing: json["is_stop_processing"],
    frontName: json["front_name"],
    tiers: List<Tier>.from(json["tiers"].map((x) => Tier.fromJson(x))),
    websiteIds: List<int>.from(json["website_ids"].map((x) => x)),
    customerGroupIds: List<String>.from(json["customer_group_ids"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "rule_id": ruleId,
    "name": name,
    "description": description,
    "is_active": isActive,
    "active_from": activeFrom,
    "active_to": activeTo,
    "type": type,
    "condition": condition.toJson(),
    "action": action.toJson(),
    "sort_order": sortOrder,
    "is_stop_processing": isStopProcessing,
    "front_name": frontName,
    "tiers": List<dynamic>.from(tiers.map((x) => x.toJson())),
    "website_ids": List<dynamic>.from(websiteIds.map((x) => x)),
    "customer_group_ids": List<dynamic>.from(customerGroupIds.map((x) => x)),
  };
}

class Tion {
  Tion({
    required this.conditionType,
    required this.aggregatorType,
    required this.tionOperator,
    required this.value,
  });

  String conditionType;
  String aggregatorType;
  dynamic tionOperator;
  String value;

  factory Tion.fromJson(Map<String, dynamic> json) => Tion(
    conditionType: json["condition_type"],
    aggregatorType: json["aggregator_type"],
    tionOperator: json["operator"],
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "condition_type": conditionType,
    "aggregator_type": aggregatorType,
    "operator": tionOperator,
    "value": value,
  };
}

class Tier {
  Tier({
    required this.tierId,
    required this.spendingStyle,
    required this.spendPoints,
    required this.monetaryStep,
    required this.spendMinPoints,
    required this.spendMaxPoints,
  });

  int tierId;
  String spendingStyle;
  int spendPoints;
  int monetaryStep;
  int spendMinPoints;
  int spendMaxPoints;

  factory Tier.fromJson(Map<String, dynamic> json) => Tier(
    tierId: json["tier_id"],
    spendingStyle: json["spending_style"],
    spendPoints: json["spend_points"],
    monetaryStep: json["monetary_step"],
    spendMinPoints: json["spend_min_points"],
    spendMaxPoints: json["spend_max_points"],
  );

  Map<String, dynamic> toJson() => {
    "tier_id": tierId,
    "spending_style": spendingStyle,
    "spend_points": spendPoints,
    "monetary_step": monetaryStep,
    "spend_min_points": spendMinPoints,
    "spend_max_points": spendMaxPoints,
  };
}
