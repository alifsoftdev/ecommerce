import 'dart:convert';

class WalletOptionResponseModel {
  Walletpaymentcheckoutpage walletpaymentcheckoutpage;

  WalletOptionResponseModel({
    required this.walletpaymentcheckoutpage,
  });

  factory WalletOptionResponseModel.fromRawJson(String str) => WalletOptionResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory WalletOptionResponseModel.fromJson(Map<String, dynamic> json) => WalletOptionResponseModel(
    walletpaymentcheckoutpage: Walletpaymentcheckoutpage.fromJson(json["walletpaymentcheckoutpage"]),
  );

  Map<String, dynamic> toJson() => {
    "walletpaymentcheckoutpage": walletpaymentcheckoutpage.toJson(),
  };
}

class Walletpaymentcheckoutpage {
  String paymentToBeMade;
  String amountInYourWallet;
  String remainingAmount;
  String leftAmountTobePaid;

  Walletpaymentcheckoutpage({
    required this.paymentToBeMade,
    required this.amountInYourWallet,
    required this.remainingAmount,
    required this.leftAmountTobePaid,
  });

  factory Walletpaymentcheckoutpage.fromRawJson(String str) => Walletpaymentcheckoutpage.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Walletpaymentcheckoutpage.fromJson(Map<String, dynamic> json) => Walletpaymentcheckoutpage(
    paymentToBeMade: json["PaymentToBeMade"],
    amountInYourWallet: json["AmountInYourWallet"],
    remainingAmount: json["RemainingAmount"],
    leftAmountTobePaid: json["LeftAmountTobePaid"],
  );

  Map<String, dynamic> toJson() => {
    "PaymentToBeMade": paymentToBeMade,
    "AmountInYourWallet": amountInYourWallet,
    "RemainingAmount": remainingAmount,
    "LeftAmountTobePaid": leftAmountTobePaid,
  };
}
