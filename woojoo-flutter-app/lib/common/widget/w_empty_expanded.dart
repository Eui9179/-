import 'package:flutter/material.dart';

const emptyExpanded = EmptyExpanded();

class EmptyExpanded extends StatelessWidget {
  const EmptyExpanded({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Container());
  }
}
