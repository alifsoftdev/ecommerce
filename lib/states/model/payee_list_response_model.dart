import 'dart:convert';

class PayeeListResponseModel {
  List<Addedpayeeslist> addedpayeeslist;

  PayeeListResponseModel({
    required this.addedpayeeslist,
  });

  factory PayeeListResponseModel.fromRawJson(String str) => PayeeListResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PayeeListResponseModel.fromJson(Map<String, dynamic> json) => PayeeListResponseModel(
    addedpayeeslist: List<Addedpayeeslist>.from(json["addedpayeeslist"].map((x) => Addedpayeeslist.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "addedpayeeslist": List<dynamic>.from(addedpayeeslist.map((x) => x.toJson())),
  };
}

class Addedpayeeslist {
  int payeeId;
  String nickName;
  String emailAddress;
  String status;

  Addedpayeeslist({
    required this.payeeId,
    required this.nickName,
    required this.emailAddress,
    required this.status,
  });

  factory Addedpayeeslist.fromRawJson(String str) => Addedpayeeslist.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Addedpayeeslist.fromJson(Map<String, dynamic> json) => Addedpayeeslist(
    payeeId: json["PayeeId"],
    nickName: json["Nick_name"],
    emailAddress: json["Email_address"],
    status: json["Status"],
  );

  Map<String, dynamic> toJson() => {
    "PayeeId": payeeId,
    "Nick_name": nickName,
    "Email_address": emailAddress,
    "Status": status,
  };
}
