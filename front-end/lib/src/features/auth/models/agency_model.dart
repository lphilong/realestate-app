// To parse this JSON data, do
//
//     final agencyModel = agencyModelFromJson(jsonString);

import 'dart:convert';

AgencyModel? agencyModelFromJson(String str) =>
    AgencyModel.fromJson(json.decode(str));

String agencyModelToJson(AgencyModel? data) => json.encode(data!.toJson());

class AgencyModel {
  AgencyModel({
    this.status,
    this.message,
    required this.data,
  });

  String? status;
  String? message;
  List<Agency> data;

  factory AgencyModel.fromJson(Map<String, dynamic> json) => AgencyModel(
        status: json["status"],
        message: json["message"],
        data: List<Agency>.from(json["data"].map((x) => Agency.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Agency {
  Agency({
    this.id,
    required this.name,
    this.phone,
    this.email,
    this.email2,
    this.website,
    this.address1,
    this.address2,
    this.countryName,
    this.provinceName,
    this.districtName,
    this.wardName,
    this.created,
    this.updated,
  });

  int? id;
  String name;
  String? phone;
  String? email;
  String? email2;
  String? website;
  String? address1;
  String? address2;
  String? countryName;
  String? provinceName;
  String? districtName;
  String? wardName;
  DateTime? created;
  DateTime? updated;

  factory Agency.fromJson(Map<String, dynamic> json) => Agency(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
        email: json["email"],
        email2: json["email2"],
        website: json["website"],
        address1: json["address1"],
        address2: json["address2"],
        countryName: json["countryName"],
        provinceName: json["provinceName"],
        districtName: json["districtName"],
        wardName: json["wardName"],
        created: DateTime.parse(json["created"]),
        updated: DateTime.parse(json["updated"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
        "email": email,
        "email2": email2,
        "website": website,
        "address1": address1,
        "address2": address2,
        "countryName": countryName,
        "provinceName": provinceName,
        "districtName": districtName,
        "wardName": wardName,
        "created":
            "${created!.year.toString().padLeft(4, '0')}-${created!.month.toString().padLeft(2, '0')}-${created!.day.toString().padLeft(2, '0')}",
        "updated":
            "${updated!.year.toString().padLeft(4, '0')}-${updated!.month.toString().padLeft(2, '0')}-${updated!.day.toString().padLeft(2, '0')}",
      };
}
