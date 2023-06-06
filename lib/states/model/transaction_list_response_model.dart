import 'dart:convert';

class TransactionListResponseModel {
  List<Lasttransaction> lasttransactions;

  TransactionListResponseModel({
    required this.lasttransactions,
  });

  factory TransactionListResponseModel.fromRawJson(String str) => TransactionListResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TransactionListResponseModel.fromJson(Map<String, dynamic> json) => TransactionListResponseModel(
    lasttransactions: List<Lasttransaction>.from(json["lasttransactions"].map((x) => Lasttransaction.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "lasttransactions": List<dynamic>.from(lasttransactions.map((x) => x.toJson())),
  };
}

class Lasttransaction {
  String reference;
  String referenceNote;
  String transactionNote;
  String debit;
  String credit;
  String status;

  Lasttransaction({
    required this.reference,
    required this.referenceNote,
    required this.transactionNote,
    required this.debit,
    required this.credit,
    required this.status,
  });

  factory Lasttransaction.fromRawJson(String str) => Lasttransaction.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Lasttransaction.fromJson(Map<String, dynamic> json) => Lasttransaction(
    reference: json["reference"],
    referenceNote: json["reference_note"],
    transactionNote: json["transaction_note"],
    debit: json["debit"],
    credit: json["credit"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "reference": reference,
    "reference_note": referenceNote,
    "transaction_note": transactionNote,
    "debit": debit,
    "credit": credit,
    "status": status,
  };
}
