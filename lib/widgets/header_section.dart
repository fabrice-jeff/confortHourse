import 'package:conforthourse/utils/dimensions.dart';
import 'package:conforthourse/widgets/big_text.dart';
import 'package:flutter/material.dart';

class HeaderSectionWidget extends StatelessWidget {
  final String text;
  HeaderSectionWidget({super.key, required this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: Dimensions.height10 * 4),
      alignment: Alignment.center,
      width: double.infinity,
      height: Dimensions.heightHeader,
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
              alignment: Alignment.center,
              child: BigTextWidget(
                text: text,
                textColor: Colors.white,
                fontWeight: FontWeight.bold,
                sizeText: Dimensions.fontsize30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
