import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:woojoo/common/context_extension.dart';
import 'package:woojoo/common/widget/logo/w_logo.dart';

import '../w_width.dart';

class LogoWithName extends StatelessWidget {
  const LogoWithName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Logo(),
        const Width(8),
        '우주'
            .text
            .color(context.appColors.text)
            .size(25)
            .fontWeight(FontWeight.w600)
            .make()
      ],
    ).pOnly(top: 10);
  }
}