class UserDetail {
  UserDetail({
    this.id,
    this.agencyName,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    this.jobTitle,
    this.lastLoginDate,
    this.created,
    this.updated,
    required this.picUser,
  });

  int? id;
  String? agencyName;
  String username;
  String firstName;
  String lastName;
  String email;
  String? jobTitle;
  DateTime? lastLoginDate;
  DateTime? created;
  DateTime? updated;
  String picUser;

  factory UserDetail.fromJson(Map<String, dynamic> json) => UserDetail(
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
            "${lastLoginDate?.year.toString().padLeft(4, '0')}-${lastLoginDate?.month.toString().padLeft(2, '0')}-${lastLoginDate?.day.toString().padLeft(2, '0')}",
        "created":
            "${created?.year.toString().padLeft(4, '0')}-${created?.month.toString().padLeft(2, '0')}-${created?.day.toString().padLeft(2, '0')}",
        "updated":
            "${updated?.year.toString().padLeft(4, '0')}-${updated?.month.toString().padLeft(2, '0')}-${updated?.day.toString().padLeft(2, '0')}",
        "picUser": picUser,
      };
}
