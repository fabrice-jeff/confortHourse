import 'package:flutter/material.dart';

class BigTextWidget extends StatelessWidget {
  final String text;
  final Color textColor;
  final double? sizeText;
  final FontWeight fontWeight;
  final double? height;
  final TextAlign textAlign;

  const BigTextWidget({
    super.key,
    required this.text,
    this.textColor = const Color(0xFF0E2E50),
    this.fontWeight = FontWeight.bold,
    this.sizeText,
    this.height,
    this.textAlign = TextAlign.center,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        height: height,
        fontSize: sizeText,
        fontWeight: fontWeight,
        color: textColor,
      ),
    );
  }
}
