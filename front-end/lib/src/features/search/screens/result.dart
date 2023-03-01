import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common_widgets/drawer.dart';
import '../../../constants/constants.dart';
import '../../../constants/controllers.dart';
import '../../../routing/routes.dart';
import '../widgets/result_widget.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key}) : super(key: key);

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
        title: const Text('Result', style: AppFonts.h4),
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
      body: const ResultWidget(),
    );
  }
}
