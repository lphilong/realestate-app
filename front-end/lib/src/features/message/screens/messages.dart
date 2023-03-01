import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../common_widgets/drawer.dart';
import '../../../common_widgets/keepalive_page.dart';
import '../../../constants/controllers.dart';

import '../../../constants/constants.dart';
import '../models/message_model.dart';
import 'chat_screen.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          );
        }),
        title: const Text('Message', style: AppFonts.h4),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
            color: Pallete.lightPurple,
          )
        ],
      ),
      drawer: const CustomDrawer(),
      body: const MessageView(),
    );
  }
}

class MessageView extends StatefulWidget {
  const MessageView({Key? key}) : super(key: key);

  @override
  _MessageViewState createState() => _MessageViewState();
}

class _MessageViewState extends State<MessageView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFf85187), Color(0xFF3ac3cb)]),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Expanded(
              child: FutureBuilder<List<Message>>(
                  future: messageController.getMessageInfo(),
                  builder: (context, AsyncSnapshot<List<Message>> snapshot) {
                    if (messageController.isLoading.value == true) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      List<Message> messageInfoList =
                          messageController.messageInfoList;
                      return ListView.builder(
                          padding: const EdgeInsets.all(5),
                          itemCount: messageInfoList.length,
                          itemBuilder: (context, index) {
                            int reverseIndex =
                                messageInfoList.length - 1 - index;
                            Message props = messageInfoList[reverseIndex];
                            return Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              elevation: 5,
                              margin: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 5),
                              child: ListTile(
                                leading: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(300),
                                      child: CachedNetworkImage(
                                        imageUrl: props.picUser !=
                                                "https://drive.google.com/uc?id="
                                            ? props.picUser
                                            : "https://media.istockphoto.com/id/476085198/photo/businessman-silhouette-as-avatar-or-default-profile-picture.jpg?s=612x612&w=0&k=20&c=GVYAgYvyLb082gop8rg0XC_wNsu0qupfSLtO7q9wu38=",
                                        height: 45,
                                        width: 45,
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                  ],
                                ),
                                title: Text(
                                  props.userName.toString(),
                                  style: AppFonts.h9,
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "${props.lastMessage}",
                                      style: AppFonts.h2,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 7),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          props.created.toString(),
                                          style: AppFonts.h12,
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                dense: true,
                                onTap: () {
                                  messageController.clearValue();
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => KeepAlivePage(
                                                  child: ChatScreen(
                                                prop: props,
                                              ))));
                                },
                              ),
                            );
                          });
                    }
                  }),
            )
          ],
        ),
      ),
    );
  }
}
