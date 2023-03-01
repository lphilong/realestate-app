import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../common_widgets/drawer.dart';
import '../../../constants/constants.dart';
import '../../../constants/controllers.dart';
import '../../../routing/routes.dart';
import '../models/users_model.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);
  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
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
        title: const Text('Contact', style: AppFonts.h4),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(AppRoutes.search);
              searchController.removeValue();
            },
            icon: const Icon(Icons.search_outlined),
            color: Pallete.lightPurple,
          )
        ],
      ),
      drawer: const CustomDrawer(),
      body: Container(
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
                child: FutureBuilder<List<Users>>(
                    future: messageController.getUsers(),
                    builder: (context, AsyncSnapshot<List<Users>> snapshot) {
                      if (messageController.usersList.isEmpty) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        List<Users> users = messageController.usersList;
                        return ListView.builder(
                            padding: const EdgeInsets.all(5),
                            itemCount: users.length,
                            itemBuilder: (context, index) {
                              int reverseIndex = users.length - 1 - index;
                              Users user = users[reverseIndex];
                              return Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                elevation: 5,
                                margin: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 5),
                                child: ListTile(
                                  subtitle: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 150,
                                        width: 60,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(300),
                                              child: CachedNetworkImage(
                                                imageUrl: user.picUser !=
                                                        "https://drive.google.com/uc?id="
                                                    ? user.picUser
                                                    : "https://media.istockphoto.com/id/476085198/photo/businessman-silhouette-as-avatar-or-default-profile-picture.jpg?s=612x612&w=0&k=20&c=GVYAgYvyLb082gop8rg0XC_wNsu0qupfSLtO7q9wu38=",
                                                height: 45,
                                                width: 45,
                                                fit: BoxFit.cover,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                "${user.lastName} ",
                                                style: AppFonts.h9,
                                              ),
                                              Text(
                                                user.firstName.toString(),
                                                style: AppFonts.h9,
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              const Text(
                                                'Agency: ',
                                                style: AppFonts.h1,
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text(user.agencyName.toString(),
                                                  maxLines: 2,
                                                  style: AppFonts.h2)
                                            ],
                                          ),
                                          const SizedBox(height: 5),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              const Text(
                                                'Job: ',
                                                style: AppFonts.h1,
                                              ),
                                              Text(
                                                user.jobTitle.toString(),
                                                style: AppFonts.h2,
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              const Text(
                                                'Email: ',
                                                style: AppFonts.h1,
                                              ),
                                              Text(
                                                user.email.toString(),
                                                style: AppFonts.h2,
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 7,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              const Text(
                                                'since ',
                                                style: AppFonts.h1,
                                              ),
                                              Text(
                                                user.created.toString(),
                                                style: AppFonts.h12,
                                              )
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  dense: true,
                                  onTap: () {},
                                ),
                              );
                            });
                      }
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
