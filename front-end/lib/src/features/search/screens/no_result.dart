import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Api/api_service.dart';
import '../../../common_widgets/drawer.dart';
import '../../../constants/constants.dart';
import '../../../constants/controllers.dart';
import '../../../routing/routes.dart';

class NoResultScreen extends StatelessWidget {
  const NoResultScreen({Key? key}) : super(key: key);

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
              Get.offAllNamed(AppRoutes.search);
              searchController.removeValue();
            },
            icon: const Icon(Icons.search_outlined),
            color: Pallete.lightPurple,
          )
        ],
      ),
      drawer: const CustomDrawer(),
      body: const NoResult(),
    );
  }
}

class NoResult extends StatefulWidget {
  const NoResult({Key? key}) : super(key: key);

  @override
  _NoResult createState() => _NoResult();
}

class _NoResult extends State<NoResult> {
  @override
  void initState() {
    getFiltered();
    super.initState();
  }

  getFiltered() async {
    var token = await ApiHandler.getToken();
    try {
      if (token == null) {
        await Get.offAllNamed(AppRoutes.auth);
      } else {
        await searchController.search();
      }
    } finally {}
  }

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
            body: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              elevation: 5,
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              child: const Center(
                child: Text(
                  'No Item Found',
                  style: AppFonts.h15,
                ),
              ),
            )));
  }
}
