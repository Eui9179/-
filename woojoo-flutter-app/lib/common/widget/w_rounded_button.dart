import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:woojoo/common/context_extension.dart';

class RoundedButton extends StatelessWidget {
  final double buttonWidth = 350;
  final double buttonHeight = 50;

  final bool btnEnabled;
  final VoidCallback onPressed;
  final String text;
  final Color? backgroundColor;
  final Color? foregroundColor;

  const RoundedButton({
    Key? key,
    required this.btnEnabled,
    required this.onPressed,
    required this.text,
    this.backgroundColor,
    this.foregroundColor,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: (btnEnabled) ? onPressed : null,
      style: OutlinedButton.styleFrom(
          side: BorderSide(
            width: 2.0,
            color: context.appColors.font,
          ),
          fixedSize: Size(buttonWidth, buttonHeight),
          foregroundColor: foregroundColor ?? context.appColors.loginScreenBackground,
          backgroundColor: backgroundColor ?? context.appColors.font,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25)),
          )),
      child: text.text.size(23).make(),
    );
  }
}
