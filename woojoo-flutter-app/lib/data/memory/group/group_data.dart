import 'package:get/get.dart';
import 'package:woojoo/common/get_it/get_it.dart';
import 'package:woojoo/data/dto/dto_group.dart';
import 'package:woojoo/data/remote/api/group/group_repository.dart';

class GroupData extends GetxController {
  final Rx<Group> _myGroup = Group().obs;

  final groupRepository = getIt.get<GroupRepository>();

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
