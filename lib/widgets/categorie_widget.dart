import 'package:conforthourse/colors.dart';
import 'package:conforthourse/models/categorie.dart';
import 'package:conforthourse/widgets/big_text.dart';
import 'package:flutter/material.dart';

class CategorieWidget extends StatelessWidget {
  final Categorie categorie;
  CategorieWidget({
    super.key,
    required this.categorie,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Icon(
            Icons.location_history,
            color: AppColors.secondColor,
            size: 50,
          ),
          SizedBox(
            height: 5,
          ),
          BigTextWidget(
            text: categorie.titre,
            sizeText: 16,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 5,
          ),
          Expanded(
            child: Center(
              child: Container(
                height: 50,
                width: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.backgroundColor,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: BigTextWidget(
                  text: categorie.nombreLocation.toString(),
                  sizeText: 15,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
