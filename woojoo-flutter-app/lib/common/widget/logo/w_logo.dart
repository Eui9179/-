import 'package:flutter/material.dart';
import 'package:woojoo/common/constants.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(8.0)),
      child: Image.asset(
        '$basePath/logo/logo.png',
        fit: BoxFit.cover,
        width: 30,
        height: 30,
      ),
    );
  }
}