import 'package:conforthourse/widgets/big_text.dart';
import 'package:flutter/material.dart';

class HeaderSectionWidget extends StatelessWidget {
  final String text;
  HeaderSectionWidget({super.key, required this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: 400,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/IMG-20231114-WA0018.jpg'),
          fit: BoxFit.cover,
          invertColors: false,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            child: Container(
              decoration: BoxDecoration(color: Colors.black.withOpacity(0.3)),
            ),
          ),
          Positioned(
            child: Container(
              alignment: Alignment.center,
              child: BigTextWidget(
                text: text,
                textColor: Colors.white,
                fontWeight: FontWeight.bold,
                sizeText: 40,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
