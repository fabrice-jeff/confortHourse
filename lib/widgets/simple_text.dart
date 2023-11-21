import 'package:conforthourse/colors.dart';
import 'package:flutter/material.dart';

class SimpleTextWidget extends StatelessWidget {
  final String text;
  final Color textColor;
  final double sizeText;
  final FontWeight fontWeight;
  final double height;
  final TextAlign textAlign;

  SimpleTextWidget({
    super.key,
    required this.text,
    this.textColor = const Color(0xFF282626),
    this.sizeText = 16,
    this.fontWeight = FontWeight.w300,
    this.height = 1.7,
    this.textAlign = TextAlign.left,
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
