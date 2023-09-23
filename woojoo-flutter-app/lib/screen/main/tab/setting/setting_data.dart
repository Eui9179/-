import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:woojoo/data/memory/group/group_data.dart';
import 'package:woojoo/data/memory/user/user_simple_data.dart';

class SettingData extends GetxController {
  Rxn<XFile?> rxnImage = Rxn<XFile>();
  UserSimpleData userSimpleData = Get.find<UserSimpleData>();
  GroupData groupData = Get.find<GroupData>();
  RxnString rxOriginImageName =
      RxnString(Get.find<UserSimpleData>().profileImageName);
  RxBool rxIsName = false.obs;
  RxBool rxIsNameChanged = false.obs;
  RxBool rxIsGroup = true.obs;
  RxBool rxIsGroupChanged = false.obs;
  RxBool rxIsFile = false.obs;
  RxBool rxIsLoading = false.obs;

  XFile? get image => rxnImage.value;

  String get userName => userSimpleData.myProfile.name;

  String? get profileImageName => userSimpleData.myProfile.profileImageName;

  String get groupName => groupData.myGroup.name;

  String get detail1 => groupData.myGroup.detail1;

  String? get originImageName => rxOriginImageName.value;

  bool get isName => rxIsName.value;

  bool get isNameChanged => rxIsNameChanged.value;

  bool get isGroup => rxIsGroup.value;

  bool get isGroupChanged => rxIsGroupChanged.value;

  bool get isFile => rxIsFile.value;

  bool get isLoading => rxIsLoading.value;

  set userName(String userName) {
    userSimpleData.myProfile.name = userName;
  }

  set isName(bool isName) => rxIsName.value = isName;

  set isNameChanged(bool isNameChanged) =>
      rxIsNameChanged.value = isNameChanged;

  set isGroup(bool isGroup) => rxIsGroup.value = isGroup;

  set isGroupChanged(bool isGroup) => rxIsGroupChanged.value = isGroup;

  set groupName(String groupName) {
    groupData.myGroup.name = groupName;
    groupData.myGroup.detail1 = '1';
  }

  set detail1(String detail1) => groupData.myGroup.detail1 = detail1;

  set isLoading(bool isLoading) => rxIsLoading.value = isLoading;

  set image(XFile? image) => rxnImage(image);

  set isFile(bool isFile) => rxIsFile.value = isFile;

  set originImageName(String? originImageName) =>
      rxOriginImageName.value = originImageName;
}

mixin class SettingDataProvider {
  late final settingData = Get.find<SettingData>();
}
