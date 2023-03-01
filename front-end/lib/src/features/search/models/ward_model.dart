import 'dart:convert';

WardModel wardModelFromJson(String str) => WardModel.fromJson(json.decode(str));

String wardModelToJson(WardModel data) => json.encode(data.toJson());

class WardModel {
  WardModel({
    this.status,
    this.message,
    required this.data,
  });

  String? status;
  String? message;
  List<Ward> data;

  factory WardModel.fromJson(Map<String, dynamic> json) => WardModel(
        status: json["status"],
        message: json["message"],
        data: List<Ward>.from(json["data"].map((x) => Ward.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Ward {
  Ward({
    required this.districtName,
    required this.name,
    required this.id,
  });

  String districtName;
  String name;
  int id;

  factory Ward.fromJson(Map<String, dynamic> json) => Ward(
        districtName: json["district_name"],
        name: json["name"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "district_name": districtName,
        "name": name,
        "id": id,
      };
}
