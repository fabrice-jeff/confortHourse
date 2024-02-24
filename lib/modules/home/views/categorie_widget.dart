import 'package:flutter/material.dart';

import '../../../data/models/categorie.dart';
import '../../../utils/colors.dart';
import '../../../utils/dimensions.dart';
import '../../../widgets/big_text.dart';

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
      padding: EdgeInsets.all(Dimensions.height10),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(Dimensions.radius10),
      ),
      child: Column(
        children: [
          Icon(
            Icons.location_history,
            color: AppColors.secondColor,
            size: Dimensions.large,
          ),
          SizedBox(
            height: Dimensions.height10,
          ),
          BigTextWidget(
            text: categorie.titre,
            sizeText: Dimensions.fontsize16,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: Dimensions.height10,
          ),
          Expanded(
            child: Center(
              child: Container(
                height: Dimensions.height10 * 4.5,
                width: Dimensions.width10 * 4.5,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.backgroundColor,
                  borderRadius: BorderRadius.circular(Dimensions.radius10),
                ),
                child: BigTextWidget(
                  text: categorie.nombreLocation.toString(),
                  sizeText: Dimensions.fontsize15,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
