import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common_widgets/formField.dart';
import '../../../constants/controllers.dart';
import '../controllers/search_controller.dart';
import 'search_click.dart';
import 'package:collection/collection.dart';

class SearchItems extends StatefulWidget {
  const SearchItems({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchItems> createState() => _SearchItemsState();
}

class _SearchItemsState extends State<SearchItems> {
  final SearchController searchController = Get.find();
  String? countryValue;
  String? provinceValue;
  String? districtValue;
  String? wardValue;
  String? builtValue;
  String? typeValue;
  List<dynamic> tempProvince = [];
  List<dynamic> tempWard = [];
  List<dynamic> tempDistrict = [];
  List<dynamic> listBuiltSize = ["<34", "<50", "<70", "<90", "Above 100"];
  DeepCollectionEquality dcEquality = const DeepCollectionEquality();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          margin: const EdgeInsets.only(top: 10),
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Column(children: [
            IntrinsicHeight(
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: form('Price From',
                          searchController.minPriceController, isEmpty, true)),
                  const VerticalDivider(
                    color: Colors.black,
                    thickness: 0.6,
                  ),
                  Expanded(
                      child: form('Price To',
                          searchController.maxPriceController, isEmpty, true)),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            IntrinsicHeight(
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: form('Bedrooms',
                          searchController.bedRoomController, isEmpty, true)),
                  const VerticalDivider(
                    color: Colors.black,
                    thickness: 0.6,
                  ),
                  Expanded(
                      child: form('Bathrooms',
                          searchController.bathRoomController, isEmpty, true)),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            fieldBtn(
                context,
                builtValue ?? "Select Built Size",
                () => appController.showDialogs(
                      context,
                      builtValue ?? "Select Built Size",
                      listBuiltSize,
                      'Built Size',
                      builtValue ?? listBuiltSize[0],
                      onBuiltSizeChange,
                    ),
                Icons.menu,
                Colors.black,
                Colors.black26),
            const SizedBox(
              height: 20,
            ),
            fieldBtn(
                context,
                countryValue ?? 'Country',
                () => appController.showDialogs(
                      context,
                      'Select Country',
                      searchController.countryList,
                      'Country',
                      countryValue ?? searchController.countryList[0],
                      onCountryChange,
                    ),
                Icons.menu,
                Colors.black,
                Colors.black26),
            const SizedBox(
              height: 20,
            ),
            fieldBtn(
              context,
              provinceValue ?? 'Province',
              () => appController.showDialogs(
                context,
                provinceValue ?? 'Select Province',
                tempProvince,
                'Province',
                provinceValue,
                onProvinceChange,
              ),
              Icons.menu,
              Colors.black,
              Colors.black26,
            ),
            const SizedBox(
              height: 20,
            ),
            fieldBtn(
                context,
                districtValue ?? 'District',
                () => appController.showDialogs(
                      context,
                      districtValue ?? 'Select District',
                      tempDistrict,
                      'District',
                      districtValue,
                      onDistrictChange,
                    ),
                Icons.menu,
                Colors.black,
                Colors.black26),
            const SizedBox(
              height: 20,
            ),
            fieldBtn(
                context,
                wardValue ?? 'Ward',
                () => appController.showDialogs(
                      context,
                      wardValue ?? 'Select Ward',
                      tempWard,
                      'Ward',
                      wardValue,
                      onWardChange,
                    ),
                Icons.menu,
                Colors.black,
                Colors.black26),
            const SizedBox(
              height: 25,
            ),
          ])),
    );
  }

  void onCountryChange(country) {
    if (dcEquality.equals(
            searchController.provinceModel?.data
                .map((e) => e.countryName)
                .toList(),
            searchController.provinceModel?.data
                .where((element) => element.countryName == country)
                .map((e) => e.countryName)
                .toList()) ==
        true) {
      tempProvince = searchController.provinceList;
    } else {
      tempProvince = [];
    }
    setState(() {
      provinceValue = null;
      districtValue = null;
      wardValue = null;
      countryValue = country;
      searchController.countryValue.value = countryValue!;
      Navigator.pop(context);
    });
  }

  void onProvinceChange(province) {
    if (dcEquality.equals(
            searchController.districtModel?.data.map((e) => e.name).toList(),
            searchController.districtModel?.data
                .where((element) => element.provinceName == province)
                .map((e) => e.name)
                .toList()) ==
        true) {
      tempDistrict = searchController.districtList;
    } else {
      tempDistrict = [];
    }
    setState(() {
      districtValue = null;
      wardValue = null;
      provinceValue = province;
      searchController.provinceValue.value = provinceValue!;
      Navigator.pop(context);
    });
  }

  void onDistrictChange(district) {
    if (searchController.wardList
            .toSet()
            .intersection(searchController.wardModel!.data
                .where((element) => element.districtName == district)
                .map((e) => e.name)
                .toSet())
            .isNotEmpty ==
        true) {
      tempWard = searchController.wardModel!.data
          .where((element) => element.districtName == district)
          .map((e) => e.name)
          .toList();
    } else {
      tempWard = [];
    }
    setState(() {
      wardValue = null;
      districtValue = district;
      searchController.districtValue.value = districtValue!;

      Navigator.pop(context);
    });
  }

  void onWardChange(ward) {
    setState(() {
      wardValue = ward;
      searchController.wardValue.value = wardValue!;

      Navigator.pop(context);
    });
  }

  void onBuiltSizeChange(builtSize) {
    if (builtSize == "<34") {
      builtValue = "34";
    } else if (builtSize == "<50") {
      builtValue = "50";
    } else if (builtSize == "<70") {
      builtValue = "70";
    } else if (builtSize == "<90") {
      builtValue = "90";
    } else if (builtSize == "Above 100") {
      builtValue = "1000";
    }
    searchController.buitSizeValue.value = builtValue!;
    setState(() {
      builtValue = builtSize;

      Navigator.pop(context);
    });
  }

  String? isEmpty(String? text) {
    if (text == null || text.isEmpty) {
      return 'Field is empty';
    }

    return null;
  }
}
