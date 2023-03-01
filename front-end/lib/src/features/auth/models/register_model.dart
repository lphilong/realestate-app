import 'dart:convert';

RegisterModel registerModelFromJson(String str) =>
    RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
  RegisterModel({
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.jobTitle,
    required this.lastLoginDate,
    required this.created,
    required this.updated,
  });

  String username;
  String firstName;
  String lastName;
  String email;
  String password;
  String jobTitle;
  DateTime lastLoginDate;
  DateTime created;
  DateTime updated;

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        username: json["username"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        password: json["password"],
        jobTitle: json["job_title"],
        lastLoginDate: DateTime.parse(json["last_login_date"]),
        created: DateTime.parse(json["created"]),
        updated: DateTime.parse(json["updated"]),
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "password": password,
        "job_title": jobTitle,
        "last_login_date":
            "${lastLoginDate.year.toString().padLeft(4, '0')}-${lastLoginDate.month.toString().padLeft(2, '0')}-${lastLoginDate.day.toString().padLeft(2, '0')}",
        "created":
            "${created.year.toString().padLeft(4, '0')}-${created.month.toString().padLeft(2, '0')}-${created.day.toString().padLeft(2, '0')}",
        "updated":
            "${updated.year.toString().padLeft(4, '0')}-${updated.month.toString().padLeft(2, '0')}-${updated.day.toString().padLeft(2, '0')}",
      };
}
