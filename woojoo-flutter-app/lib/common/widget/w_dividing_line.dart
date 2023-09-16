import 'package:flutter/material.dart';
import 'package:woojoo/common/context_extension.dart';

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
