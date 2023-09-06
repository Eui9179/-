import 'package:woojoo/common/context_extension.dart';
import 'package:woojoo/common/theme/color_palette.dart';
import 'package:flutter/material.dart';

class DividingLine extends StatelessWidget {
  const DividingLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: context.appColors.dividingLine,
      thickness: 1,
      endIndent: 3,
    );
  }
}
