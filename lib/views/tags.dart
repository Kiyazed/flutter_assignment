import 'package:flutter/material.dart';

class Tags extends StatelessWidget {
  const Tags(
      {required this.backgroundColor, required this.children, super.key});

  final Color backgroundColor;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(mainAxisSize: MainAxisSize.min, children: children),
    );
  }
}
