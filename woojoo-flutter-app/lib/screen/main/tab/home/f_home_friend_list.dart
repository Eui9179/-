import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:woojoo/common/context_extension.dart';
import 'package:woojoo/common/theme/font_size.dart';
import 'package:woojoo/common/widget/w_empty_expanded.dart';
import 'package:woojoo/common/widget/w_height.dart';
import 'package:woojoo/common/widget/w_subject_title.dart';
import 'package:woojoo/common/widget/w_width.dart';

import '../../../../common/widget/w_friend_in_list.dart';
import '../../../../data/memory/friend/dto_friend_simple.dart';
import '../../../../data/memory/friend/friend_simple_data.dart';

class HomeFriendListFrame extends StatefulWidget {
  const HomeFriendListFrame({Key? key}) : super(key: key);

  @override
  State<HomeFriendListFrame> createState() => _HomeFriendListFrameState();
}

class _HomeFriendListFrameState extends State<HomeFriendListFrame>
    with FriendSimpleDataProvider {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      List<FriendSimple> myFriendList = friendSimpleData.myFriendList;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Height(8),
          Row(
            children: [
              const SubjectTitle("내 게임 친구"),
              emptyExpanded,
              SubjectTitle('${myFriendList.length.toString()} 명'),
              width10,
              IconButton(
                onPressed: () => friendSimpleData.syncMyFriendList(context),
                tooltip: "친구 동기화",
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                splashRadius: 20,
                icon: Icon(
                  Icons.refresh_sharp,
                  color: context.appColors.text,
                  size: 25,
                ),
              ),
            ],
          ).pSymmetric(v: 12, h: 13),
          myFriendList.isEmpty
              ? Container(
                  height: 40,
                  margin: const EdgeInsets.only(top: 35),
                  width: double.infinity,
                  child: Row(
                    textBaseline: TextBaseline.ideographic,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: [
                      "내 연락처를"
                          .text
                          .size(FontSize.normal)
                          .color(context.appColors.text)
                          .make(),
                      InkWell(
                        onTap: () =>
                            () => friendSimpleData.syncMyFriendList(context),
                        child: '동기화'
                            .text
                            .size(FontSize.normal)
                            .color(context.appColors.textButton)
                            .underline
                            .make(),
                      ),
                      " 해보세요!"
                          .text
                          .size(FontSize.normal)
                          .color(context.appColors.text)
                          .make(),
                    ],
                  ),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  itemExtent: 70.0,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: myFriendList.length,
                  itemBuilder: (context, index) =>
                      FriendInList(friendSimple: myFriendList[index]),
                ),
        ],
      );
    });
  }
}
