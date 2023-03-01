import 'dart:convert';

AddMessage addMessageFromJson(String str) =>
    AddMessage.fromJson(json.decode(str));

String addMessageToJson(AddMessage data) => json.encode(data.toJson());

class AddMessage {
  AddMessage({
    required this.type,
    required this.message,
    required this.status,
    required this.created,
    this.deleted,
  });

  String type;
  String message;
  String status;
  DateTime created;
  dynamic deleted;

  factory AddMessage.fromJson(Map<String, dynamic> json) => AddMessage(
        type: json["type"],
        message: json["message"],
        status: json["status"],
        created: DateTime.parse(json["created"]),
        deleted: json["deleted"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "message": message,
        "status": status,
        "created":
            "${created.year.toString().padLeft(4, '0')}-${created.month.toString().padLeft(2, '0')}-${created.day.toString().padLeft(2, '0')}",
        "deleted": deleted,
      };
}
