import 'dart:convert';

DataMessage dataMessageFromJson(String str) =>
    DataMessage.fromJson(json.decode(str));

String dataMessageToJson(DataMessage data) => json.encode(data.toJson());

class DataMessage {
  DataMessage({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  List<Message>? data;

  factory DataMessage.fromJson(Map<String, dynamic> json) => DataMessage(
        status: json["status"],
        message: json["message"],
        data: json["data"] == ""
            ? []
            : List<Message>.from(json["data"]!.map((x) => Message.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Message {
  Message({
    this.id,
    this.userName,
    this.lastMessage,
    required this.picUser,
    this.status,
    this.conversationId,
    this.created,
  });

  int? id;
  String? userName;
  String? lastMessage;
  String picUser;
  String? status;
  int? conversationId;
  DateTime? created;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        id: json["id"],
        userName: json["userName"],
        lastMessage: json["lastMessage"],
        picUser: json["picUser"],
        status: json["status"],
        conversationId: json["conversation_id"],
        created:
            json["created"] == null ? null : DateTime.parse(json["created"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userName": userName,
        "lastMessage": lastMessage,
        "picUser": picUser,
        "status": status,
        "conversation_id": conversationId,
        "created":
            "${created!.year.toString().padLeft(4, '0')}-${created!.month.toString().padLeft(2, '0')}-${created!.day.toString().padLeft(2, '0')}",
      };
}
