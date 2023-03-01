import 'package:get/get.dart';

import '../features/search/controllers/search_controller.dart';

class SearchBiding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchController());
  }
}
