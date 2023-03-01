import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/constants.dart';
import '../../../constants/controllers.dart';
import '../../message/models/chats_model.dart';
import '../models/properties_model.dart';

class ChatScreen extends StatefulWidget {
  final Props senders;

  const ChatScreen({Key? key, required this.senders}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late Future<List<Chat>> _chat;
  @override
  void initState() {
    super.initState();
    _chat = homeController.getChatDetail(widget.senders);
  }

  _buildMessage(Chat message, bool isMe) {
    return Container(
      margin: isMe
          ? const EdgeInsets.only(
              top: 8.0,
              bottom: 8.0,
              left: 80.0,
            )
          : const EdgeInsets.only(
              top: 8.0,
              bottom: 8.0,
              right: 80.0,
            ),
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
      decoration: BoxDecoration(
        color: isMe
            ? Theme.of(context).backgroundColor
            : const Color.fromARGB(255, 91, 91, 93),
        borderRadius: isMe
            ? const BorderRadius.only(
                topLeft: Radius.circular(15.0),
                bottomLeft: Radius.circular(15.0),
              )
            : const BorderRadius.only(
                topRight: Radius.circular(15.0),
                bottomRight: Radius.circular(15.0),
              ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            message.created!,
            style: const TextStyle(
              color: Pallete.whiteText,
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            message.message!,
            style: const TextStyle(
              color: Pallete.whiteText,
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  var formKey = GlobalKey<FormState>();

  _buildMessageComposer() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      height: 70.0,
      color: Colors.white,
      child: Form(
        key: formKey,
        child: Row(
          children: <Widget>[
            Expanded(
              child: TextFormField(
                controller: homeController.message,
                textCapitalization: TextCapitalization.sentences,
                validator: (value) {
                  if (value == null) {
                    return 'Insert your message';
                  }
                  return null;
                },
                decoration: const InputDecoration.collapsed(
                  hintText: 'Send a message...',
                ),
              ),
            ),
            Obx((() => homeController.isLoading.value == true
                ? const Center(child: CircularProgressIndicator())
                : IconButton(
                    icon: const Icon(Icons.send),
                    iconSize: 25.0,
                    color: Theme.of(context).primaryColor,
                    onPressed: () async {
                      if (homeController.message.text != "") {
                        await homeController.addMessage({
                          "type": "1",
                          "message": homeController.message.text,
                          "status": "sent",
                          "created": appController.now.toString(),
                          "deleted": "null",
                        }, widget.senders).then((value) =>
                            homeController.getChatDetail(widget.senders));
                        homeController.clearMess();
                        setState(() {
                          _chat = homeController.getChatDetail(widget.senders);
                        });
                      }
                    },
                  )))
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF1C1E21),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            widget.senders.userName.toString(),
            style: const TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          elevation: 0.0,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.more_horiz),
              iconSize: 30.0,
              color: Colors.white,
              onPressed: () {},
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: FutureBuilder<List<Chat>>(
                  future: _chat,
                  builder: (context, AsyncSnapshot<List<Chat>> snapshot) {
                    if (snapshot.data == null) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      List<Chat> dataChat = homeController.dataChat;
                      return ListView.builder(
                          reverse: true,
                          padding: const EdgeInsets.only(top: 15.0),
                          itemCount: dataChat.length,
                          itemBuilder: (context, index) {
                            int reverseIndex = dataChat.length - 1 - index;
                            final Chat message = dataChat[reverseIndex];
                            final bool isMe = message.senderName.toString() !=
                                widget.senders.userName.toString();
                            return _buildMessage(message, isMe);
                          });
                    }
                  }),
            ),
            _buildMessageComposer()
          ],
        ),
      ),
    );
  }
}
