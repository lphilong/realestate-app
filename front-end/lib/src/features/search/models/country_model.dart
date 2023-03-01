import 'dart:convert';

CountryModel countryModelFromJson(String str) =>
    CountryModel.fromJson(json.decode(str));

String countryModelToJson(CountryModel data) => json.encode(data.toJson());

class CountryModel {
  CountryModel({
    this.status,
    this.message,
    required this.data,
  });

  String? status;
  String? message;
  List<Country> data;

  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
        status: json["status"],
        message: json["message"],
        data: List<Country>.from(json["data"].map((x) => Country.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Country {
  Country({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
