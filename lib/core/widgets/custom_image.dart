import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({
    super.key,
    required this.assetImage,
    required this.height,
  });
  final String assetImage;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      decoration:
          BoxDecoration(image: DecorationImage(image: AssetImage(assetImage))),
    );
  }
}
