import 'package:get/get.dart';

class LoginInputData extends GetxController {
  RxString rxPhoneNumber = "".obs;
  RxBool rxButtonActive = false.obs;

  void activeButton() {
    rxButtonActive.value = true;
  }

  void disableButton() {
    rxButtonActive.value = false;
  }

  set phoneNumber(String phoneNumber) {
    rxPhoneNumber.value = phoneNumber;
  }

  String get phoneNumber => rxPhoneNumber.value;
  bool get buttonActive => rxButtonActive.value;
}

abstract mixin class LoginInputDataProvider {
  late final inputData = Get.find<LoginInputData>();
}