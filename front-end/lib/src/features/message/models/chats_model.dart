import 'dart:convert';

ChatModel chatModelFromJson(String str) => ChatModel.fromJson(json.decode(str));

String catModelToJson(ChatModel data) => json.encode(data.toJson());

class ChatModel {
  ChatModel({
    this.status,
    this.message,
    required this.data,
  });

  String? status;
  String? message;
  List<Chat> data;

  factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
      status: json["status"],
      message: json["message"],
      data: List<Chat>.from(
        json["data"] == ""
            ? []
            : List<Chat>.from(json["data"].map((x) => Chat.fromJson(x))),
      ));

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<Chat>.from(data.map((x) => x.toJson())),
      };
}

class Chat {
  Chat({
    this.id,
    this.senderName,
    this.conversationName,
    this.type,
    this.message,
    this.status,
    this.created,
    this.deleted,
    this.picUser,
  });

  int? id;
  String? senderName;
  String? conversationName;
  String? type;
  String? message;
  int? status;
  String? created;
  String? deleted;
  String? picUser;

  factory Chat.fromJson(Map<String, dynamic> json) => Chat(
        id: json['id'],
        senderName: json['senderName'],
        conversationName: json['conversationName'],
        type: json['type'],
        message: json['message'],
        status: json['status'],
        created: json['created'],
        deleted: json['deleted'],
        picUser: json['pic_user'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "senderName": senderName,
        'conversationName': conversationName,
        'type': type,
        'message': message,
        'status': status,
        'created': created,
        'deleted': deleted,
        'pic_user': picUser,
      };
}
