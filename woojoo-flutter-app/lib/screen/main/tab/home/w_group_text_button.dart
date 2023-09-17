import 'package:flutter/material.dart';
import 'package:woojoo/common/context_extension.dart';

class GroupTextButton extends StatelessWidget {
  const GroupTextButton({Key? key, required this.text, required this.onTap}) : super(key: key);
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: context.appColors.headerBackgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.school_sharp, color: context.appColors.font, size: 19,),
              const SizedBox(width: 10,),
              Text(text, style: TextStyle(color: context.appColors.font, fontWeight: FontWeight.w400, fontSize: 20),),
            ],
          ),
          Icon(Icons.chevron_right, color: context.appColors.font,size: 18,),
        ],
      ),
    );
  }
}
