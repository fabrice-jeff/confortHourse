import 'package:flutter/material.dart';

class BigTextWidget extends StatelessWidget {
  final String text;
  final Color textColor;
  final double sizeText;
  final FontWeight fontWeight;
  final double height;
  final TextAlign textAlign;
  final String fontFamily;

  const BigTextWidget({
    super.key,
    required this.text,
    this.textColor = const Color(0xFF0E2E50),
    this.sizeText = 20,
    this.fontWeight = FontWeight.bold,
    this.height = 1.7,
    this.textAlign = TextAlign.center,
    this.fontFamily = "sans-serif",
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
        letterSpacing: 1.4,
      ),
    );
  }
}
