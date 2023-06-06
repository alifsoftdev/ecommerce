
import 'dart:convert';

import 'package:kallukoshai/states/model/profile_model.dart';

/*
CustomerModel CustomerModelFromJson(String str) => CustomerModel.fromJson(json.decode(str));

*/
String CustomerModelToJson(CustomerModel data) => json.encode(data.toJson());

class CustomerModel {
  CustomerModel({
    required this.profileModel,
  });

  ProfileModel profileModel;

  /* factory CustomerModel.fromJson(Map<String, dynamic> json) => CustomerModel(
    customer: Customer.fromJson(json["customer"]),
  );

  */
  Map<String, dynamic> toJson() => {
        "customer": profileModel.toJson(),
      };
}
