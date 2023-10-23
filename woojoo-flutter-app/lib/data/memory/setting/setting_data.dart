import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:woojoo/data/memory/group/group_data.dart';
import 'package:woojoo/data/memory/user/user_simple_data.dart';
import 'package:woojoo/data/memory/user/update_my_profile_request.dart';

class SettingData extends GetxController
    with GroupDataProvider, UserSimpleDataProvider {
  final Rxn<XFile?> _image = Rxn<XFile>();
  final RxString _userName = Get.find<UserSimpleData>().myProfile.name.obs;
  final RxnString _profileImageName =
      RxnString(Get.find<UserSimpleData>().myProfile.profileImageName);
  final RxString _groupName = Get.find<GroupData>().myGroup.name.obs;
  final RxString _groupDetail = Get.find<GroupData>().myGroup.detail1.obs;
  final RxnString _originImageName =
      RxnString(Get.find<UserSimpleData>().profileImageName);
  final RxBool _isName = true.obs;
  final RxBool _isNameChanged = false.obs;
  final RxBool _isGroup = true.obs;
  final RxBool _isGroupChanged = false.obs;
  final RxBool _isFile = false.obs;
  RxBool _isLoading = false.obs;

  updateSettingData() {
    _isLoading = true.obs;
    final request = UpdateMyProfileRequest(
      isFile: isFile,
      file: image,
      name: isNameChanged ? userName : null,
      groupName: isGroupChanged ? groupName : null,
      groupDetail1: isGroupChanged ? groupDetail : null,
      isGroup: isGroupChanged,
    );

    groupData.myGroup = groupData.myGroup.copyWith(name: groupName, detail1: groupDetail);
    userSimpleData.updateMyProfile(request).then((value) => isLoading = false);
  }

  Future getImageFromGallery() async {
    final status = await Permission.photos.request();
    if (status == PermissionStatus.granted) {
      await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 30)
          .then((selectedImage) {
        image = selectedImage;
        if (selectedImage == null) {
          originImageName = null;
        }
        isFile = true;
      });
    }
  }

  XFile? get image => _image.value;

  String get userName => _userName.value;

  String? get profileImageName => _profileImageName.value;

  String get groupName => _groupName.value;

  String get groupDetail => _groupDetail.value;

  String? get originImageName => _originImageName.value;

  bool get isName => _isName.value;

  bool get isNameChanged => _isNameChanged.value;

  bool get isGroup => _isGroup.value;

  bool get isGroupChanged => _isGroupChanged.value;

  bool get isFile => _isFile.value;

  bool get isLoading => _isLoading.value;

  set userName(String userName) => _userName.value = userName;

  set isName(bool isName) => _isName.value = isName;

  set isNameChanged(bool isNameChanged) =>
      _isNameChanged.value = isNameChanged;

  set isGroup(bool isGroup) => _isGroup.value = isGroup;

  set isGroupChanged(bool isGroup) => _isGroupChanged.value = isGroup;

  set groupName(String groupName) {
    _groupName.value = groupName;
    _groupDetail.value = '1';
  }

  set groupDetail(String detail1) => _groupDetail.value = detail1;

  set isLoading(bool isLoading) => _isLoading.value = isLoading;

  set image(XFile? image) => _image.value = image;

  set isFile(bool isFile) => _isFile.value = isFile;

  set originImageName(String? originImageName) =>
      _originImageName.value = originImageName;
}

mixin class SettingDataProvider {
  late final settingData = Get.find<SettingData>();
}
