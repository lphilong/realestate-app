import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiengviet/tiengviet.dart';
import '../../../Api/api_service.dart';
import '../../../constants/controllers.dart';
import '../../home/models/properties_model.dart';
import '../models/country_model.dart';
import '../models/district_model.dart';
import '../models/province_model.dart';
import '../models/ward_model.dart';

class SearchController extends GetxController {
  static SearchController instance = Get.find();
  List<String> countryList = [];
  List<String> provinceList = [];
  List<String> wardList = [];
  List<String> districtList = [];
  List<Props> filteredList = [];
  RxString countryValue = "".obs;
  RxString provinceValue = "".obs;
  RxString districtValue = "".obs;
  RxString wardValue = "".obs;
  RxString buitSizeValue = "".obs;
  CountryModel? countryModel;
  ProvinceModel? provinceModel;
  DistrictModel? districtModel;
  WardModel? wardModel;
  RxString? token;
  RxBool isLoading = false.obs;
  PropsModel? propsModel;

  late TextEditingController minPriceController,
      maxPriceController,
      bedRoomController,
      bathRoomController;
  @override
  void onInit() {
    appController.onSubscriptionConnectivity();
    minPriceController = TextEditingController();
    maxPriceController = TextEditingController();
    bedRoomController = TextEditingController();
    bathRoomController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    minPriceController.dispose();
    maxPriceController.dispose();
    bedRoomController.dispose();
    bathRoomController.dispose();
    super.dispose();
  }

  //----------------Search----------------//
  Future<List<Props>> search() async {
    var scopedToken = await ApiHandler.getToken();
    isLoading(true);

    try {
      if (scopedToken != null) {
        token?.value = scopedToken;
        var res = await ApiHandler.get(
            'properties/search',
            {
              "minprices": minPriceController.text,
              "maxprices": maxPriceController.text,
              "minbeds": bedRoomController.text,
              "minbaths": bathRoomController.text,
              "maxareas": buitSizeValue.value,
              "provinces_name": TiengViet.parse(
                  provinceValue.value.toLowerCase().removeAllWhitespace),
              "wards_name": TiengViet.parse(
                  wardValue.value.toLowerCase().removeAllWhitespace),
              "countries_name": TiengViet.parse(
                  countryValue.value.toLowerCase().removeAllWhitespace),
              "districts_name": TiengViet.parse(
                  districtValue.value.toLowerCase().removeAllWhitespace),
              "pagesize": "10"
            },
            scopedToken);

        var data = PropsModel.fromJson(json.decode(res)).data;
        propsModel = PropsModel.fromJson(json.decode(res));

        for (var element in data) {
          filteredList.removeWhere((e) => element!.id == e.id);
          filteredList.add(element!);
        }
        return filteredList;
      }
    } catch (e) {
      Get.snackbar('Announcement', 'Server Error'); //ignore
    } finally {
      isLoading(false);
    }
    return filteredList;
  }

  removeValue() {
    countryValue.value = "";
    provinceValue.value = "";
    districtValue.value = "";
    wardValue.value = "";
    buitSizeValue.value = "";
    minPriceController.clear();
    maxPriceController.clear();
    bathRoomController.clear();
    bedRoomController.clear();
    filteredList.clear();
  }

  //--------------------------getLocation--------------------------//
  Future<List<String>> getCountry() async {
    var scopedToken = await ApiHandler.getToken();
    try {
      if (scopedToken != null) {
        token?.value = scopedToken;
        var res = await ApiHandler.get('countries', null, scopedToken);
        var data = CountryModel.fromJson(json.decode(res)).data;
        countryModel = CountryModel.fromJson(json.decode(res));

        for (var element in data) {
          countryList.removeWhere((e) => element.name == e);
          countryList.add(element.name);
        }
        return countryList;
      }
    } catch (e) {
      Get.snackbar('Announcement', 'Server Error'); //ignore
    }
    return countryList;
  }

  Future<List<String>> getProvince() async {
    var scopedToken = await ApiHandler.getToken();
    try {
      if (scopedToken != null) {
        token?.value = scopedToken;
        var res = await ApiHandler.get('provinces', null, scopedToken);
        var data = ProvinceModel.fromJson(json.decode(res)).data;
        provinceModel = ProvinceModel.fromJson(json.decode(res));
        for (var element in data) {
          provinceList.removeWhere((e) => element.name == e);
          provinceList.add(element.name);
        }
        return provinceList;
      }
    } catch (e) {
      Get.snackbar('Announcement', 'Server Error'); //ignore
    }
    return provinceList;
  }

  Future<List<String>> getDistrict() async {
    var scopedToken = await ApiHandler.getToken();
    try {
      if (scopedToken != null) {
        token?.value = scopedToken;
        var res = await ApiHandler.get('districts', null, scopedToken);
        var data = DistrictModel.fromJson(json.decode(res)).data;
        districtModel = DistrictModel.fromJson(json.decode(res));
        for (var element in data) {
          districtList.removeWhere((e) => element.name == e);
          districtList.add(element.name);
        }
        return districtList;
      }
    } catch (e) {
      Get.snackbar('Announcement', 'Server Error'); //ignore
    }
    return districtList;
  }

  Future<List<String>> getWard() async {
    var scopedToken = await ApiHandler.getToken();
    try {
      if (scopedToken != null) {
        token?.value = scopedToken;
        var res = await ApiHandler.get('wards', null, scopedToken);
        var data = CountryModel.fromJson(json.decode(res)).data;
        wardModel = WardModel.fromJson(json.decode(res));
        for (var element in data) {
          wardList.removeWhere((e) => element.name == e);
          wardList.add(element.name);
        }
        return wardList;
      }
    } catch (e) {
      Get.snackbar('Announcement', 'Server Error');
      //ignore
    }
    return wardList;
  }
}
