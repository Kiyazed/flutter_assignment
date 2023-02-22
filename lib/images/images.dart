import 'package:flutter/material.dart';

class Images extends StatelessWidget {
  const Images({
    Key? key,
    this.height = 100,
    this.borderRadius = 15,
    required this.width,
    required this.imageUrl,
    required this.padding,
    this.child,
    this.margin,
  }) : super(key: key);
  final double width;
  final double height;
  final String imageUrl;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double borderRadius;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(19),
          image: DecorationImage(
              image: NetworkImage(imageUrl), fit: BoxFit.cover)),
      child: child,
    );
  }
}
