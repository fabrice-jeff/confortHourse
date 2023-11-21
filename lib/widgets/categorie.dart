import 'dart:ffi';

import 'package:conforthourse/colors.dart';
import 'package:conforthourse/widgets/big_text.dart';
import 'package:flutter/material.dart';

class CategorieWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final int number;
  CategorieWidget({
    super.key,
    required this.icon,
    required this.text,
    required this.number,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: AppColors.secondColor,
            size: 50,
          ),
          SizedBox(
            height: 10,
          ),
          BigTextWidget(
            text: text,
            sizeText: 15,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 50,
            width: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.backgroundColor,
              borderRadius: BorderRadius.circular(25),
            ),
            child: BigTextWidget(
              text: number.toString(),
              sizeText: 15,
            ),
          )
        ],
      ),
    );
  }
}
