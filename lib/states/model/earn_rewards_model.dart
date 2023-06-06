import 'dart:convert';

EarnRewardsModel earnRewardsModelFromJson(String str) =>
    EarnRewardsModel.fromJson(json.decode(str));

String earnRewardsModelToJson(EarnRewardsModel data) =>
    json.encode(data.toJson());

class EarnRewardsModel {
  EarnRewardsModel({
    required this.items,
    required this.searchCriteria,
    required this.totalCount,
  });

  List<Item> items;
  dynamic searchCriteria;
  int totalCount;

  factory EarnRewardsModel.fromJson(Map<String, dynamic> json) =>
      EarnRewardsModel(
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
    this.activeFrom,
    this.activeTo,
    required this.type,
    required this.condition,
    required this.action,
    required this.behaviorTrigger,
    required this.sortOrder,
    required this.isStopProcessing,
    required this.param1,
    required this.historyMessage,
    required this.emailMessage,
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
  DateTime? activeFrom;
  DateTime? activeTo;
  String type;
  ItemCondition condition;
  Action action;
  String behaviorTrigger;
  int sortOrder;
  int isStopProcessing;
  String param1;
  String? historyMessage;
  dynamic emailMessage;
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
        activeFrom: json['active_from'] != null
            ? DateTime.parse(json['active_from'])
            : null,
        activeTo: json['active_to'] != null
            ? DateTime.parse(json['active_to'])
            : null,
        type: json["type"],
        condition: ItemCondition.fromJson(json["condition"]),
        action: Action.fromJson(json["action"]),
        behaviorTrigger: json["behavior_trigger"],
        sortOrder: json["sort_order"],
        isStopProcessing: json["is_stop_processing"],
        param1: json["param1"],
        historyMessage: json["history_message"],
        emailMessage: json["email_message"],
        frontName: json["front_name"],
        tiers: List<Tier>.from(json["tiers"].map((x) => Tier.fromJson(x))),
        websiteIds: List<int>.from(json["website_ids"].map((x) => x)),
        customerGroupIds:
            List<String>.from(json["customer_group_ids"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "rule_id": ruleId,
        "name": name,
        "description": description,
        "is_active": isActive,
        "active_from":
            "${activeFrom!.year.toString().padLeft(4, '0')}-${activeFrom!.month.toString().padLeft(2, '0')}-${activeFrom!.day.toString().padLeft(2, '0')}",
        "active_to":
            "${activeTo!.year.toString().padLeft(4, '0')}-${activeTo!.month.toString().padLeft(2, '0')}-${activeTo!.day.toString().padLeft(2, '0')}",
        "type": type,
        "condition": condition.toJson(),
        "action": action.toJson(),
        "behavior_trigger": behaviorTrigger,
        "sort_order": sortOrder,
        "is_stop_processing": isStopProcessing,
        "param1": param1,
        "history_message": historyMessage,
        "email_message": emailMessage,
        "front_name": frontName,
        "tiers": List<dynamic>.from(tiers.map((x) => x.toJson())),
        "website_ids": List<dynamic>.from(websiteIds.map((x) => x)),
        "customer_group_ids":
            List<dynamic>.from(customerGroupIds.map((x) => x)),
      };
}

class Action {
  Action({
    required this.conditionType,
    required this.aggregatorType,
    required this.actionOperator,
    required this.value,
  });

  String conditionType;
  String aggregatorType;
  dynamic actionOperator;
  dynamic value;

  factory Action.fromJson(Map<String, dynamic> json) => Action(
        conditionType: json["condition_type"],
        aggregatorType: json["aggregator_type"],
        actionOperator: json["operator"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "condition_type": conditionType,
        "aggregator_type": aggregatorType,
        "operator": actionOperator,
        "value": value,
      };
}

class ItemCondition {
  ItemCondition({
    required this.conditionType,
    required this.conditions,
    required this.aggregatorType,
    required this.conditionOperator,
    required this.value,
  });

  String conditionType;
  List<ConditionElement> conditions;
  String aggregatorType;
  dynamic conditionOperator;
  String value;

  factory ItemCondition.fromJson(Map<String, dynamic> json) => ItemCondition(
        conditionType: json["condition_type"],
        conditions: json["conditions"] != null
            ? List<ConditionElement>.from(
                json["conditions"].map((x) => ConditionElement.fromJson(x)))
            : <ConditionElement>[],
        aggregatorType: json["aggregator_type"],
        conditionOperator: json["operator"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "condition_type": conditionType,
        "conditions": List<dynamic>.from(conditions.map((x) => x.toJson())),
        "aggregator_type": aggregatorType,
        "operator": conditionOperator,
        "value": value,
      };
}

class ConditionElement {
  ConditionElement({
    required this.conditionType,
    required this.conditionOperator,
    required this.attributeName,
    required this.value,
  });

  String conditionType;
  String conditionOperator;
  String attributeName;
  String value;

  factory ConditionElement.fromJson(Map<String, dynamic> json) =>
      ConditionElement(
        conditionType: json["condition_type"],
        conditionOperator: json["operator"],
        attributeName: json["attribute_name"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "condition_type": conditionType,
        "operator": conditionOperator,
        "attribute_name": attributeName,
        "value": value,
      };
}

class Tier {
  Tier({
    required this.tierId,
    required this.earningStyle,
    required this.earnPoints,
    required this.monetaryStep,
    required this.pointsLimit,
    required this.qtyStep,
    required this.transferToGroup,
  });

  int tierId;
  String earningStyle;
  int earnPoints;
  int monetaryStep;
  int pointsLimit;
  int qtyStep;
  int? transferToGroup;

  factory Tier.fromJson(Map<String, dynamic> json) => Tier(
        tierId: json["tier_id"],
        earningStyle: json["earning_style"],
        earnPoints: json["earn_points"],
        monetaryStep: json["monetary_step"],
        pointsLimit: json["points_limit"],
        qtyStep: json["qty_step"],
        transferToGroup: json["transfer_to_group"],
      );

  Map<String, dynamic> toJson() => {
        "tier_id": tierId,
        "earning_style": earningStyle,
        "earn_points": earnPoints,
        "monetary_step": monetaryStep,
        "points_limit": pointsLimit,
        "qty_step": qtyStep,
        "transfer_to_group": transferToGroup,
      };
}
