import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/controllers.dart';
import '../models/add_messages.dart';
import '../models/chats_model.dart';
import '../../../Api/api_service.dart';
import '../models/message_model.dart';
import '../models/users_model.dart';

class MessageController extends GetxController {
  static MessageController instance = Get.find();
  List<Message> messageInfoList = [];
  AddMessage? addChat;
  List<AddMessage> chats = [];
  List<Chat> dataChats = [];
  List<Users> usersList = [];
  late TextEditingController message;
  RxBool isLoading = false.obs;
  @override
  void onInit() {
    message = TextEditingController();
    appController.onSubscriptionConnectivity();
    clearValue();
    super.onInit();
  }

  @override
  void dispose() {
    message.dispose();
    super.dispose();
  }

  clear() {
    message.clear();
  }

  clearValue() {
    dataChats.clear();
    messageInfoList.clear();
  }

  Future<List<Message>> getMessageInfo() async {
    var scopedToken = await ApiHandler.getToken();
    isLoading(true);
    try {
      if (scopedToken != null) {
        appController.token?.value = scopedToken;
        var res =
            await ApiHandler.get('participantByUserLogin', null, scopedToken);
        var data = DataMessage.fromJson(json.decode(res)).data;

        for (var element in data!) {
          messageInfoList
              .removeWhere((e) => element.conversationId == e.conversationId);
          messageInfoList.add(element);
        }
        return messageInfoList;
      }
    } catch (e) {
      Get.snackbar('Announcement', 'Server Error'); //ignore
    } finally {
      isLoading(false);
    }
    return messageInfoList;
  }

  Future addMessage(Map<String, String> body, Message prop) async {
    var scopedToken = await ApiHandler.getToken();
    isLoading(true);

    try {
      if (scopedToken != null) {
        appController.token?.value = scopedToken;
        AddMessage addMessage = AddMessage(
            type: "1",
            message: message.text,
            status: "sent",
            created: appController.now);
        await ApiHandler.post(
            addMessageToJson(addMessage),
            'messages/send',
            {
              "sender_id": loginController.userModel!.data.id.toString(),
              "conversation_id": prop.conversationId.toString(),
            },
            scopedToken);
      }
    } catch (e) {
      Get.snackbar('Announcement', 'Server Error'); //ignore
    } finally {
      isLoading(false);
    }
  }

  Future<List<Chat>> getChatDetail(Message prop) async {
    var scopedToken = await ApiHandler.getToken();
    try {
      if (scopedToken != null) {
        appController.token?.value = scopedToken;
        var res = await ApiHandler.get(
            'messages/${prop.conversationId.toString()}',
            {"pagesize": "100"},
            scopedToken);
        var data = ChatModel.fromJson(json.decode(res));
        var chats = ChatModel.fromJson(json.decode(res)).data;

        if (data.status != "failed") {
          for (var chat in chats) {
            dataChats.removeWhere((e) => chat.id == e.id);
            dataChats.add(chat);
          }

          return dataChats;
        }
      }
    } catch (e) {
      Get.snackbar('Announcement', 'Server Error'); //ignore
    }
    return dataChats;
  }

  Future<List<Users>> getUsers() async {
    var scopedToken = await ApiHandler.getToken();
    try {
      if (scopedToken != null) {
        appController.token?.value = scopedToken;
        var res =
            await ApiHandler.get('users', {"pagesize": "100"}, scopedToken);
        var data = UsersModel.fromJson(json.decode(res)).data;

        for (var element in data) {
          usersList.removeWhere((e) => e.id == element.id);
          usersList.add(element);
        }
        return usersList;
      }
    } catch (e) {
      Get.snackbar('Announcement', 'Server Error'); //ignore
    }
    return usersList;
  }
}
