// To parse this JSON data, do
//
//     final countryModel = countryModelFromJson(jsonString);

import 'dart:convert';

import 'package:country_quiz/app/domain/entities/country_entity.dart';

CountryModel countryModelFromJson(String str) =>
    CountryModel.fromJson(json.decode(str));

String countryModelToJson(CountryModel data) => json.encode(data.toJson());

class CountryModel {
  CountryModel({
    this.flag,
    this.name,
    this.capital,
    this.code,
  });

  final String flag;
  final String name;
  final String capital;
  final String code;

  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
        flag: json["flag"] == null ? null : json["flag"],
        name: json["name"] == null ? null : json["name"],
        capital: json["capital"] == null ? null : json["capital"],
        code: json["alpha2Code"] == null
            ? null
            : (json["alpha2Code"] as String).toLowerCase(),
      );

  Map<String, dynamic> toJson() => {
        "flag": flag == "" ? null : flag,
        "name": name == "" ? null : name,
        "capital": capital == "" ? null : capital,
        "alpha2Code": code == "" ? null : code,
      };

  CountryEntity toEntity() => CountryEntity(
        flag: flag,
        name: name,
        capital: capital,
        code: code,
      );
}
