import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:woojoo/common/context_extension.dart';
import 'package:woojoo/common/theme/font_size.dart';

class SubjectTitle extends StatelessWidget {
  const SubjectTitle({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: context.appColors.subText,
        fontSize: FontSize.subTitle,
      ),
    );
  }
}
