import 'dart:convert';

ProvinceModel provinceModelFromJson(String str) =>
    ProvinceModel.fromJson(json.decode(str));

String provinceModelToJson(ProvinceModel data) => json.encode(data.toJson());

class ProvinceModel {
  ProvinceModel({
    this.status,
    this.message,
    required this.data,
  });

  String? status;
  String? message;
  List<Province> data;

  factory ProvinceModel.fromJson(Map<String, dynamic> json) => ProvinceModel(
        status: json["status"],
        message: json["message"],
        data:
            List<Province>.from(json["data"].map((x) => Province.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Province {
  Province({
    required this.countryName,
    required this.name,
    required this.id,
  });

  String countryName;
  String name;
  int id;

  factory Province.fromJson(Map<String, dynamic> json) => Province(
        countryName: json["country_name"],
        name: json["name"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "country_name": countryName,
        "name": name,
        "id": id,
      };
}
