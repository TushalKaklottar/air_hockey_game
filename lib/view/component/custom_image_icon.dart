import 'package:flutter/material.dart';

class CustomImageButton extends StatelessWidget {
  final String imagePath;
  final double imageSize;
  final VoidCallback? onTap;

  const CustomImageButton({
    required this.imagePath,
    required this.imageSize,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Image.asset(
        imagePath,
        height: imageSize,
      ),
    );
  }
}
