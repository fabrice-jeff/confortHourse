import 'package:conforthourse/utils/colors.dart';
import 'package:conforthourse/widgets/simple_text.dart';
import 'package:flutter/material.dart';

class ButtonAddAnnonceWidget extends StatelessWidget {
  const ButtonAddAnnonceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: InkWell(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 5,
          ),
          height: 47,
          width: MediaQuery.of(context).size.width * 0.65,
          decoration: BoxDecoration(
            color: AppColors.secondColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add_circle_outline_rounded,
                color: Colors.white,
              ),
              SizedBox(
                width: 5,
              ),
              SimpleTextWidget(
                text: "Ajouter une annonce",
                textColor: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
