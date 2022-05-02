import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'home_controller.dart';
import 'home_use_case.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      HomeController(
        homeUseCase: Get.put(
          HomeUseCase(
            getStorage: Get.put(GetStorage()),
          ),
        ),
      ),
    );
  }
}
