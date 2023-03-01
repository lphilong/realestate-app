import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/constants.dart';
import '../features/auth/controllers/login_controller.dart';
import '../routing/routes.dart';

class CustomDrawer extends GetView<LoginController> {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Drawer(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFFf85187), Color(0xFF3ac3cb)]),
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              SizedBox(
                height: 170,
                child: DrawerHeader(
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.black,
                        width: 0.5,
                      ),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Pallete.lightBlue,
                            boxShadow: [
                              BoxShadow(
                                color: Pallete.gradient1.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 7,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Card(
                            color: Pallete.lightBlue,
                            elevation: 12,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 30,
                                      child: CachedNetworkImage(
                                        imageUrl: controller
                                                    .userModel!.data.picUser !=
                                                "https://drive.google.com/uc?id="
                                            ? controller.userModel!.data.picUser
                                            : "https://media.istockphoto.com/id/476085198/photo/businessman-silhouette-as-avatar-or-default-profile-picture.jpg?s=612x612&w=0&k=20&c=GVYAgYvyLb082gop8rg0XC_wNsu0qupfSLtO7q9wu38=",
                                        imageBuilder:
                                            (context, imageProvider) =>
                                                Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                image: imageProvider,
                                                fit: BoxFit.cover),
                                          ),
                                        ),
                                        placeholder: (context, url) =>
                                            const CircularProgressIndicator(),
                                        errorWidget: (context, url, error) =>
                                            const Icon(Icons.error),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        controller.userModel != null
                                            ? '${controller.userModel!.data.lastName}${" "}${controller.userModel!.data.firstName}'
                                            : 'Name',
                                        style: const TextStyle(
                                            fontSize: 20,
                                            color: Pallete.whiteText)),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                        controller.userModel != null
                                            ? controller.userModel!.data.email
                                            : 'Email',
                                        style: const TextStyle(
                                            fontSize: 15,
                                            color: Pallete.whiteText)),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home_outlined),
                title: const Text(
                  ' Home ',
                  style: TextStyle(color: Pallete.whiteText),
                ),
                onTap: () {
                  Get.offAllNamed(AppRoutes.home);
                },
              ),
              ListTile(
                leading: const Icon(Icons.people_outline_rounded),
                title: const Text(
                  ' Contact ',
                  style: TextStyle(color: Pallete.whiteText),
                ),
                onTap: () {
                  Get.offAllNamed(AppRoutes.contact);
                },
              ),
              ListTile(
                leading: const Icon(Icons.mail_outline_rounded),
                title: const Text(
                  ' Message ',
                  style: TextStyle(color: Pallete.whiteText),
                ),
                onTap: () {
                  Get.offAllNamed(AppRoutes.mess);
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout_outlined),
                title: const Text('LogOut',
                    style: TextStyle(color: Pallete.whiteText)),
                onTap: () {
                  controller.logout();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
