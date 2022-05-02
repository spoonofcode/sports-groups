import 'package:get/get.dart';

import 'home_use_case.dart';

class HomeController extends GetxController {
  final HomeUseCase homeUseCase;

  HomeController({required this.homeUseCase});

  final RxString userName = ''.obs;

  @override
  void onInit() {
    userName.value = homeUseCase.getUserName();
    super.onInit();
  }
}
