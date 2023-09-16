import 'package:velocity_x/velocity_x.dart';
import 'package:woojoo/common/context_extension.dart';
import 'package:woojoo/common/widget/w_width.dart';
import 'package:woojoo/ui/static_widget/woojoo_logo.dart';
import 'package:flutter/material.dart';

class WoojooLogoAndName extends StatelessWidget {
  const WoojooLogoAndName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const WoojooLogo(),
        const Width(8),
        '우주'
            .text
            .color(context.appColors.font)
            .size(25)
            .fontWeight(FontWeight.w600)
            .make()
      ],
    ).pOnly(top: 10);
  }
}
