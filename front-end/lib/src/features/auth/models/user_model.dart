import 'dart:convert';

import 'user_detail_model.dart';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    required this.status,
    required this.message,
    required this.data,
  });

  String status;
  String message;
  UserDetail data;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        status: json["status"],
        message: json["message"],
        data: UserDetail.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}
