import 'package:flutter/material.dart';

const height5 = Height(5);
const height10 = Height(10);
const height20 = Height(20);

class Height extends StatelessWidget {
  final double size;

  const Height(this.size, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
    );
  }
}
