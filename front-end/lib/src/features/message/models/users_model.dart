import 'dart:convert';

UsersModel usersModelFromJson(String str) =>
    UsersModel.fromJson(json.decode(str));

String usersModelToJson(UsersModel data) => json.encode(data.toJson());

class UsersModel {
  UsersModel({
    required this.status,
    required this.message,
    required this.data,
  });

  String status;
  String message;
  List<Users> data;

  factory UsersModel.fromJson(Map<String, dynamic> json) => UsersModel(
        status: json["status"],
        message: json["message"],
        data: List<Users>.from(json["data"].map((x) => Users.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Users {
  Users({
    required this.id,
    required this.agencyName,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.jobTitle,
    required this.lastLoginDate,
    required this.created,
    required this.updated,
    required this.picUser,
  });

  int id;
  String agencyName;
  String username;
  String firstName;
  String lastName;
  String email;
  String jobTitle;
  DateTime lastLoginDate;
  DateTime created;
  DateTime updated;
  String picUser;

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        id: json["id"],
        agencyName: json["agencyName"],
        username: json["username"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        jobTitle: json["jobTitle"],
        lastLoginDate: DateTime.parse(json["lastLoginDate"]),
        created: DateTime.parse(json["created"]),
        updated: DateTime.parse(json["updated"]),
        picUser: json["picUser"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "agencyName": agencyName,
        "username": username,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "jobTitle": jobTitle,
        "lastLoginDate":
            "${lastLoginDate.year.toString().padLeft(4, '0')}-${lastLoginDate.month.toString().padLeft(2, '0')}-${lastLoginDate.day.toString().padLeft(2, '0')}",
        "created":
            "${created.year.toString().padLeft(4, '0')}-${created.month.toString().padLeft(2, '0')}-${created.day.toString().padLeft(2, '0')}",
        "updated":
            "${updated.year.toString().padLeft(4, '0')}-${updated.month.toString().padLeft(2, '0')}-${updated.day.toString().padLeft(2, '0')}",
        "picUser": picUser,
      };
}
