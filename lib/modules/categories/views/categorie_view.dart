import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/colors.dart';
import '../../../utils/dimensions.dart';
import '../../../widgets/big_text.dart';
import '../../../widgets/header_section.dart';
import '../../home/views/categorie_widget.dart';
import '../controllers/categorie_controller.dart';

class CategorieView extends GetView<CategorieController> {
  const CategorieView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: AppColors.backgroundColor,
        backgroundColor: AppColors.backgroundColor,
        title: BigTextWidget(
          text: "ConforthOurse",
          fontWeight: FontWeight.w400,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              HeaderSectionWidget(text: "CATÉGORIES"),
              SizedBox(
                height: Dimensions.height10 * 2,
              ),
              Container(
                width: double.infinity,
                child: GridView.builder(
                  primary: false,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: Dimensions.width10,
                    mainAxisSpacing: Dimensions.height10,
                    mainAxisExtent: 215,
                  ),
                  itemCount: controller.categories.length,
                  itemBuilder: (context, index) {
                    var categorie = controller.categories[index];

                    return InkWell(
                      onTap: () {
                        // Affiche la page de l'ensemble des locations pour  une catégorie donnée
                        // var locationsByCategorie =
                        //     LocationController.allByCategorie(categorie.id);
                        // Navigator.push(context, MaterialPageRoute(
                        //   builder: (context) {
                        //     return LocationByCategoriePage(
                        //       categorie: categorie.titre,
                        //       locations: locationsByCategorie,
                        //     );
                        //   },
                        // ));
                      },
                      child: CategorieWidget(
                        categorie: categorie,
                      ),
                    );
                  },
                  padding: EdgeInsets.symmetric(
                    vertical: Dimensions.height10 * 2,
                    horizontal: Dimensions.width10 * 2,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
