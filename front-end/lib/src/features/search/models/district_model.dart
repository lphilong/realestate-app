import 'dart:convert';

DistrictModel districtModelFromJson(String str) =>
    DistrictModel.fromJson(json.decode(str));

String districtModelToJson(DistrictModel data) => json.encode(data.toJson());

class DistrictModel {
  DistrictModel({
    this.status,
    this.message,
    required this.data,
  });

  String? status;
  String? message;
  List<District> data;

  factory DistrictModel.fromJson(Map<String, dynamic> json) => DistrictModel(
        status: json["status"],
        message: json["message"],
        data:
            List<District>.from(json["data"].map((x) => District.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class District {
  District({
    required this.provinceName,
    required this.name,
    required this.id,
  });

  String provinceName;
  String name;
  int id;

  factory District.fromJson(Map<String, dynamic> json) => District(
        provinceName: json["province_name"],
        name: json["name"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "province_name": provinceName,
        "name": name,
        "id": id,
      };
}
