import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:woojoo/data/remote/friend/delete_friend.dart';
import 'package:woojoo/data/remote/friend/friend_api.dart';
import 'package:woojoo/data/remote/friend/insert_friend.dart';
import 'package:woojoo/utils/notification.dart';

import 'dto_friend_simple.dart';

class FriendSimpleData extends GetxController {
  final RxList<FriendSimple> _myFriends = <FriendSimple>[].obs;

  FriendApi friendRepository = FriendApi.instance;

  @override
  void onInit() async {
    getMyFriendList();
    super.onInit();
  }

  Future<void> getMyFriendList() async {
    List<FriendSimple> myFriendList = await friendRepository.getMyFriendList();
    _myFriends.clear();
    _myFriends.addAll(myFriendList);
  }

  void syncMyFriendList(BuildContext context) {
    _getPhoneNumberFromContact().then((phoneNumberList) {
      return friendRepository.syncFriendList(phoneNumberList).then((_) {
        notification(context, "동기화가 완료되었습니다.", warning: false);
        return getMyFriendList();
      });
    });
  }

  Future<void> insertFriend(int userId) async {
    Map<String, dynamic> response = await dioApiInsertFriendOne(userId);
    _myFriends.add(FriendSimple.fromJson(response['data']));
  }

  Future<void> deleteFriend(int userId) async {
    await dioApiDeleteFriendOne(userId);
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

  List<FriendSimple> get myFriendList => _myFriends;
}

mixin class FriendSimpleDataProvider {
  late final friendSimpleData = Get.find<FriendSimpleData>();
}
