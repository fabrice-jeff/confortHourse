import 'package:conforthourse/widgets/big_text.dart';
import 'package:flutter/material.dart';

class TitleSectionWidget extends StatelessWidget {
  final String firstText;
  final String secondText;
  final Color colorFirstText;
  final Color colorSecondText;
  const TitleSectionWidget({
    super.key,
    required this.firstText,
    required this.secondText,
    this.colorFirstText = const Color(0xFFC82333),
    this.colorSecondText = const Color.fromRGBO(14, 46, 80, 1),
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(
            top: 20,
          ),
          alignment: Alignment.center,
          child: BigTextWidget(
            text: firstText,
            textColor: colorFirstText,
            sizeText: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.only(
            top: 10,
            bottom: 10,
          ),
          alignment: Alignment.center,
          child: Center(
            child: BigTextWidget(
              text: secondText,
              textColor: colorSecondText,
              sizeText: 40,
              height: 1.2,
            ),
          ),
        ),
      ],
    );
  }
}
