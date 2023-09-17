import 'package:woojoo/data/memory/authentication/access_token_data.dart';
import 'package:woojoo/utils/notification.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../data/controller/my_groups_controller.dart';
import '../../../../../data/remote/group/get_my_groups.dart';
import 'w_group_text_button.dart';

class HomeGroupFrame extends StatefulWidget {
  const HomeGroupFrame({Key? key}) : super(key: key);

  @override
  State<HomeGroupFrame> createState() => _HomeGroupFrameState();
}

class _HomeGroupFrameState extends State<HomeGroupFrame> {
  List<dynamic> _myGroups = [];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyGroupsController>(
      builder: (controller) {
        _myGroups = Get.find<MyGroupsController>().groups;
        return Container(
          padding: const EdgeInsets.only(left: 13, bottom: 15, right: 13),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListView.builder(
                  shrinkWrap: true,
                  itemExtent: 28.0,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _myGroups.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GroupTextButton(
                      text:
                          '${_myGroups[index]["name"]} ${_myGroups[index]['detail1']}학년',
                      onTap: () {
                        Get.toNamed(
                            "/group/detail1?name=${_myGroups[index]['name']}&detail1=${_myGroups[index]['detail1']}");
                      },
                    );
                  }),
            ],
          ),
        );
      },
    );
  }

  void _initMyGroups() {
    String accessToken = Get.find<AccessTokenData>().accessToken;
    Future<Map<String, dynamic>> response = dioApiGetMyGroups(accessToken);
    response.then((res) {
      int statusCode = res['statusCode'];
      if (statusCode == 200) {
        Get.find<MyGroupsController>().setMyGroups(res['data']);
      } else if (statusCode == 401) {
        notification(context, '다시 로그인 해주세요');
      }
    });
  }
}
