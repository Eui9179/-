import 'package:get/get.dart';
import 'package:woojoo/data/remote/group/group_repository.dart';
import 'package:woojoo/data/memory/group/dto_group.dart';
import 'package:woojoo/data/remote/group/group_api.dart';

class GroupData extends GetxController {
  final Rx<Group> _rxMyGroup = Group().obs;

  GroupRepository groupRepository = GroupApi.instance;

  @override
  void onInit() async {
    Group group = await groupRepository.getMyGroup();
    _rxMyGroup(group);
    super.onInit();
  }

  Group get myGroup => _rxMyGroup.value;
}

mixin class GroupDataProvider {
  late final groupData = Get.find<GroupData>();
}