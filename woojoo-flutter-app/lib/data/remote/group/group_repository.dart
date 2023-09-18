import '../../memory/group/dto_group.dart';

abstract interface class GroupRepository {
  Future<Group> getMyGroup();
}