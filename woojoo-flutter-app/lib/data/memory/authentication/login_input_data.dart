import 'package:get/get.dart';

abstract mixin class LoginInputDataProvider {
  late final inputData = Get.find<LoginInputData>();
}

class LoginInputData extends GetxController {
  RxString phoneNumberObs = "".obs;
  RxBool buttonActiveObs = false.obs;

  void activeButton() {
    buttonActiveObs.value = true;
  }

  void disableButton() {
    buttonActiveObs.value = false;
  }

  set phoneNumber(String phoneNumber) {
    phoneNumberObs.value = phoneNumber;
  }

  String get phoneNumber => phoneNumberObs.value;
  bool get buttonActive => buttonActiveObs.value;
}