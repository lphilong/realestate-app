import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'src/app_controller/controller.dart';
import 'src/features/auth/controllers/login_controller.dart';
import 'src/features/auth/controllers/register_controller.dart';
import 'src/features/home/controllers/home_controller.dart';
import 'src/features/message/controllers/message_controller.dart';
import 'src/features/search/controllers/search_controller.dart';
import 'src/network.dart';
import 'src/routing/routes.dart';

void main() async {
  Get.put(AppController());
  Get.put(LoginController());
  Get.put(RegisterController());
  Get.put(HomeController());
  Get.put(SearchController());
  Get.put(MessageController());
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    startNetworkChecking();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: AppRoutes.auth,
      getPages: AppRoutes.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
