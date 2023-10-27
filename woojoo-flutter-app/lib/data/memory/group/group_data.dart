import 'package:get/get.dart';
import 'package:woojoo/data/dto/dto_group.dart';
import 'package:woojoo/data/remote/api/group/group_api.dart';
import 'package:woojoo/data/remote/api/group/group_repository.dart';

class GroupData extends GetxController {
  final Rx<Group> _myGroup = Group().obs;

  GroupRepository groupRepository = GroupApi.instance;

  @override
  void onInit() async {
    Group group = await groupRepository.getMyGroup();
    _myGroup(group);
    super.onInit();
  }

  Group get myGroup => _myGroup.value;

  set myGroup(Group group) => _myGroup.value = group;
}

mixin class GroupDataProvider {
  late final groupData = Get.find<GroupData>();
}
