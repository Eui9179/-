import 'package:woojoo/data/dto/dto_group.dart';

abstract interface class GroupRepository {
  Future<Group> getMyGroup();
}
