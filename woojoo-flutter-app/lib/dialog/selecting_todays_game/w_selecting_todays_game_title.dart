import 'package:flutter/material.dart';
import 'package:woojoo/common/context_extension.dart';

import '../../common/theme/font_size.dart';
import '../../common/widget/w_height.dart';

class SelectingTodaysGameTitle extends StatelessWidget {
  const SelectingTodaysGameTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: Column(
        children: [
          Text(
            '오늘 할 게임 선택',
            style: TextStyle(
              color: context.appColors.text,
              fontSize: FontSize.dialogTitle,
            ),
            textAlign: TextAlign.center,
          ),
          height10,
          Text(
            '오늘 무슨 게임을 할건지 선택해 주세요.',
            style: TextStyle(
              color: context.appColors.subText,
              fontSize: FontSize.subTitle,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            '친구들에게 공유됩니다.',
            style: TextStyle(
              color: context.appColors.subText,
              fontSize: FontSize.subTitle,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
