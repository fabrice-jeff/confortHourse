import 'package:conforthourse/widgets/big_text.dart';
import 'package:flutter/material.dart';

class HeaderSectionWidget extends StatelessWidget {
  final String text;
  HeaderSectionWidget({super.key, required this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 100),
      alignment: Alignment.center,
      width: double.infinity,
      height: 340,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/breadcrumb.jpg'),
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
              padding: EdgeInsets.all(5),
              alignment: Alignment.center,
              child: BigTextWidget(
                text: text,
                height: 1.2,
                textColor: Colors.white,
                fontWeight: FontWeight.bold,
                sizeText: 35,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
