import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Api/api_service.dart';
import '../../../constants/controllers.dart';
import '../../message/models/add_messages.dart';
import '../../message/models/chats_model.dart';
import '../models/properties_model.dart';

class HomeController extends GetxController {
  static HomeController instance = Get.find();
  PropsModel? propsModel;
  List<Props> propsList = [];
  List<Chat> dataChat = [];
  RxBool isLoading = false.obs;
  late TextEditingController message;

  @override
  void onInit() {
    appController.onSubscriptionConnectivity();
    message = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    message.dispose();
    super.dispose();
  }

  Future<List<Chat>> getChatDetail(Props sender) async {
    var scopedToken = await ApiHandler.getToken();
    try {
      if (scopedToken != null) {
        appController.token?.value = scopedToken;
        var res = await ApiHandler.get(
            'messages/${sender.conversationId.toString()}',
            {"pagesize": "100"},
            scopedToken);
        var data = ChatModel.fromJson(json.decode(res));
        var chats = ChatModel.fromJson(json.decode(res)).data;

        if (data.status != "failed") {
          for (var chat in chats) {
            dataChat.removeWhere((e) => chat.id == e.id);
            dataChat.add(chat);
          }

          return dataChat;
        }
      }
    } catch (e) {
      Get.snackbar('Announcement', 'Server Error'); //ignore
    }
    return dataChat;
  }

  Future addMessage(Map<String, String> body, Props prop) async {
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

  Future<List<Props>> getProps() async {
    var scopedToken = await ApiHandler.getToken();
    try {
      if (scopedToken != null) {
        appController.token?.value = scopedToken;
        var res =
            await ApiHandler.get('properties', {"pagesize": "1"}, scopedToken);
        var data = PropsModel.fromJson(json.decode(res)).data;
        propsModel = PropsModel.fromJson(json.decode(res));

        for (var element in data) {
          propsList.removeWhere((e) => element!.id == e.id);
          propsList.add(element!);
        }
        return propsList;
      }
    } catch (e) {
      Get.snackbar('Announcement', 'Server Error'); //ignore
    }
    return propsList;
  }

  clearChat() {
    dataChat.clear();
  }

  clearMess() {
    message.clear();
  }
}
