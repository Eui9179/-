import 'package:woojoo/common/context_extension.dart';
import 'package:woojoo/common/theme/color_palette.dart';
import 'package:flutter/material.dart';

class ProfileLoadingScreen extends StatelessWidget {
  const ProfileLoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appColors.mainBackgroundColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: context.appColors.headerBackgroundColor,
      ),
      body: Container(
        width: double.infinity,
        padding:
            const EdgeInsets.only(top: 15, bottom: 20, right: 13, left: 13),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  context.appColors.headerBackgroundColor,
                  context.appColors.mainBackgroundColor
            ],
                stops: const [
              0.4,
              0.4
            ])),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 45.0,
              ),
              const SizedBox(
                height: 15,
              ),
              Text('',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: context.appColors.font)),
            ]),
      ),
    );
  }
}
