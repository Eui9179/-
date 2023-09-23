import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:woojoo/data/memory/group/group_data.dart';
import 'package:woojoo/data/memory/user/user_simple_data.dart';

class SettingData extends GetxController {
  Rxn<XFile?> rxnImage = Rxn<XFile>();
  RxString rxUserName = Get.find<UserSimpleData>().myProfile.name.obs;
  RxnString rxProfileImageName =
      RxnString(Get.find<UserSimpleData>().myProfile.profileImageName);
  RxString rxGroupName = Get.find<GroupData>().myGroup.name.obs;
  RxString rxGroupDetail = Get.find<GroupData>().myGroup.detail1.obs;
  RxnString rxOriginImageName =
      RxnString(Get.find<UserSimpleData>().profileImageName);
  RxBool rxIsName = true.obs;
  RxBool rxIsNameChanged = false.obs;
  RxBool rxIsGroup = true.obs;
  RxBool rxIsGroupChanged = false.obs;
  RxBool rxIsFile = false.obs;
  RxBool rxIsLoading = false.obs;

  XFile? get image => rxnImage.value;

  String get userName => rxUserName.value;

  String? get profileImageName => rxProfileImageName.value;

  String get groupName => rxGroupName.value;

  String get groupDetail => rxGroupDetail.value;

  String? get originImageName => rxOriginImageName.value;

  bool get isName => rxIsName.value;

  bool get isNameChanged => rxIsNameChanged.value;

  bool get isGroup => rxIsGroup.value;

  bool get isGroupChanged => rxIsGroupChanged.value;

  bool get isFile => rxIsFile.value;

  bool get isLoading => rxIsLoading.value;

  set userName(String userName) => rxUserName.value = userName;

  set isName(bool isName) => rxIsName.value = isName;

  set isNameChanged(bool isNameChanged) =>
      rxIsNameChanged.value = isNameChanged;

  set isGroup(bool isGroup) => rxIsGroup.value = isGroup;

  set isGroupChanged(bool isGroup) => rxIsGroupChanged.value = isGroup;

  set groupName(String groupName) {
    rxGroupName.value = groupName;
    rxGroupDetail.value = '1';
  }

  set groupDetail(String detail1) => rxGroupDetail.value = detail1;

  set isLoading(bool isLoading) => rxIsLoading.value = isLoading;

  set image(XFile? image) => rxnImage(image);

  set isFile(bool isFile) => rxIsFile.value = isFile;

  set originImageName(String? originImageName) =>
      rxOriginImageName.value = originImageName;
}

mixin class SettingDataProvider {
  late final settingData = Get.find<SettingData>();
}
