import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:woojoo/common/get_it/get_it.dart';
import 'package:woojoo/data/remote/api/friend/friend_repository.dart';
import 'package:woojoo/utils/notification.dart';

import '../../dto/dto_friend_in_list.dart';

class FriendSimpleData extends GetxController {
  final RxList<UserInList> _myFriends = <UserInList>[].obs;

  final friendRepository = getIt.get<FriendRepository>();

  @override
  void onInit() async {
    getMyFriendList();
    super.onInit();
  }

  Future<void> getMyFriendList() async {
    List<UserInList> myFriendList = await friendRepository.getMyFriendList();
    _myFriends.clear();
    _myFriends.addAll(myFriendList);
  }

  void syncMyFriendList(BuildContext context) async {
    List<String> phoneNumberList = await _getPhoneNumberFromContact();
    await friendRepository.syncFriendList(phoneNumberList);
    if (context.mounted) {
      notification(context, "동기화가 완료되었습니다.", warning: false);
    }
    getMyFriendList();
  }

  Future<void> insertFriend(int userId) async {
    UserInList newFriend = await friendRepository.insertFriend(userId);
    _myFriends.add(newFriend);
  }

  Future<void> deleteFriend(int userId) async {
    await friendRepository.deleteFriend(userId);
    _removeFriend(userId);
  }

  Future<void> blockUser(int userId) async {
    await friendRepository.blockUser(userId);
    _removeFriend(userId);
  }

  void _removeFriend(int userId) {
    _myFriends.removeWhere((element) => element.userSimple.id == userId);
  }

  Future<List<String>> _getPhoneNumberFromContact() async {
    final status = await Permission.contacts.request();
    if (status == PermissionStatus.granted) {
      List<Contact> contacts = await ContactsService.getContacts();

      List<String> phoneNumberList = contacts
          .map((contact) => contact.phones)
          .where((phones) => (phones != null && phones.isNotEmpty))
          .map((phones) => phones!.first.value!)
          .toList();
      return _formattedContacts(phoneNumberList);
    }
    return [];
  }

  List<String> _formattedContacts(List<String?> contacts) {
    return contacts
        .where((contact) => (contact != null && contact.contains("010")))
        .map((contact) => contact!.replaceAll(' - ', ' '))
        .toList();
  }

  List<UserInList> get myFriendList => _myFriends;
}

mixin class FriendSimpleDataProvider {
  late final friendSimpleData = Get.find<FriendSimpleData>();
}
