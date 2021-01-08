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
  });

  final String flag;
  final String name;
  final String capital;

  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
        flag: json["flag"] == null ? null : json["flag"],
        name: json["name"] == null ? null : json["name"],
        capital: json["capital"] == null ? null : json["capital"],
      );

  Map<String, dynamic> toJson() => {
        "flag": flag == null ? null : flag,
        "name": name == null ? null : name,
        "capital": capital == null ? null : capital,
      };

  CountryEntity toEntity() => CountryEntity(
        flag: flag,
        name: name,
        capital: capital,
      );
}
