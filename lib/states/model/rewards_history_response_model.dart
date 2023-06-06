import 'dart:convert';

List<RewardsHistoryResponseModel> rewardsHistoryResponseModelFromJson(String str) => List<RewardsHistoryResponseModel>.from(json.decode(str).map((x) => RewardsHistoryResponseModel.fromJson(x)));

String rewardsHistoryResponseModelToJson(List<RewardsHistoryResponseModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RewardsHistoryResponseModel {
  int id;
  int customerId;
  int amount;
  dynamic amountUsed;
  String comment;
  String code;
  int isExpired;
  int isExpirationEmailSent;
  dynamic expiresAt;
  dynamic createdAt;
  dynamic activatedAt;
  bool isActivated;

  RewardsHistoryResponseModel({
    required this.id,
    required this.customerId,
    required this.amount,
    required this.amountUsed,
    required this.comment,
    required this.code,
    required this.isExpired,
    required this.isExpirationEmailSent,
    required this.expiresAt,
    required this.createdAt,
    required this.activatedAt,
    required this.isActivated,
  });

  factory RewardsHistoryResponseModel.fromJson(Map<String, dynamic> json) => RewardsHistoryResponseModel(
    id: json["id"],
    customerId: json["customer_id"],
    amount: json["amount"],
    amountUsed: json["amount_used"],
    comment: json["comment"],
    code: json["code"],
    isExpired: json["is_expired"],
    isExpirationEmailSent: json["is_expiration_email_sent"],
    expiresAt: json["expires_at"],
    createdAt: json["created_at"],
    activatedAt: json["activated_at"],
    isActivated: json["is_activated"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "customer_id": customerId,
    "amount": amount,
    "amount_used": amountUsed,
    "comment": comment,
    "code": code,
    "is_expired": isExpired,
    "is_expiration_email_sent": isExpirationEmailSent,
    "expires_at": expiresAt.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
    "activated_at": activatedAt,
    "is_activated": isActivated,
  };
}
