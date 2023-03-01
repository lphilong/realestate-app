import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Api/api_service.dart';
import '../../../constants/constants.dart';
import '../../../constants/controllers.dart';
import '../../../routing/routes.dart';
import '../widgets/searchItems.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    getLocation();
    super.initState();
  }

  getLocation() async {
    searchController.isLoading(true);
    var token = await ApiHandler.getToken();
    try {
      if (token == null) {
        await Get.offAllNamed(AppRoutes.auth);
      } else {
        await searchController.getCountry();
        await searchController.getProvince();
        await searchController.getDistrict();
        await searchController.getWard();
      }
    } finally {
      searchController.isLoading(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Pallete.appBar,
          elevation: 0,
          iconTheme: const IconThemeData(color: Pallete.lightBlue),
          title: const Text('Search', style: AppFonts.h4),
          actions: [
            IconButton(
              onPressed: () {
                Get.offAllNamed(AppRoutes.home);
                searchController.removeValue();
              },
              icon: const Icon(Icons.home),
              color: Pallete.lightPurple,
            )
          ],
        ),
        body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFFf85187), Color(0xFF3ac3cb)]),
            ),
            child: Obx(
              (() => searchController.isLoading.value == true
                  ? const Center(child: CircularProgressIndicator())
                  : Scaffold(
                      backgroundColor: Colors.transparent,
                      body: Center(
                          child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              elevation: 5,
                              child: const SearchItems())),
                      floatingActionButtonLocation:
                          FloatingActionButtonLocation.centerFloat,
                      floatingActionButton: FloatingActionButton(
                        onPressed: () async {
                          await searchController.search();
                          if (searchController.propsModel!.status == 'failed') {
                            await Get.offAllNamed(AppRoutes.noResult);
                          } else {
                            await Get.offAllNamed(AppRoutes.result);
                          }
                        },
                        backgroundColor: Pallete.lightPurple,
                        child: const Icon(Icons.search_rounded),
                      ))),
            )));
  }
}
