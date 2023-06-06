// To parse this JSON data, do
//
//     final registrationModel = registrationModelFromJson(jsonString);

import 'dart:convert';

List<CountryModel> countryModelFromJson(String str) => List<CountryModel>.from(
    json.decode(str).map((x) => CountryModel.fromJson(x)));

String countryModelToJson(List<CountryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CountryModel {
  CountryModel({
    required this.id,
    required this.twoLetterAbbreviation,
    required this.threeLetterAbbreviation,
    required this.fullNameLocale,
    required this.fullNameEnglish,
  });

  String id;
  String twoLetterAbbreviation;
  String threeLetterAbbreviation;
  String fullNameLocale;
  String fullNameEnglish;

  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
        id: json["id"]??'',
        twoLetterAbbreviation: json["two_letter_abbreviation"],
        threeLetterAbbreviation: json["three_letter_abbreviation"],
        fullNameLocale: json["full_name_locale"],
        fullNameEnglish: json["full_name_english"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "two_letter_abbreviation": twoLetterAbbreviation,
        "three_letter_abbreviation": threeLetterAbbreviation,
        "full_name_locale": fullNameLocale,
        "full_name_english": fullNameEnglish,
      };
}
