import 'package:conforthourse/colors.dart';
import 'package:conforthourse/dimensions.dart';
import 'package:conforthourse/widgets/simple_text.dart';
import 'package:flutter/material.dart';

class LabelFormWidget extends StatelessWidget {
  final String label;
  final bool important;
  const LabelFormWidget({
    super.key,
    required this.label,
    this.important = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          child: SimpleTextWidget(
            text: label,
            sizeText: Dimensions.fontsize13,
          ),
        ),
        SizedBox(
          width: Dimensions.width10 / 2,
        ),
        if (important)
          SimpleTextWidget(
            text: "*",
            sizeText: 17,
            textColor: AppColors.secondColor,
          ),
      ],
    );
  }
}
