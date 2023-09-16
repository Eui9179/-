import 'package:flutter/material.dart';

const width5 = Width(5);
const width10 = Width(10);
const width20 = Width(20);

class Width extends StatelessWidget {
  final double size;
  const Width(this.size, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
    );
  }
}
