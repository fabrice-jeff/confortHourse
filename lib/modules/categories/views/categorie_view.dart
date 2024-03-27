import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/colors.dart';
import '../../../utils/constants.dart';
import '../../../utils/dimensions.dart';

import '../../../widgets/big_text.dart';
import '../../home/controllers/home_controller.dart';
import '../../home/views/categorie_widget.dart';
import '../../home/views/location_by_categorie.dart';

class CategorieView extends GetView<HomeController> {
  const CategorieView();
  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return GetBuilder<HomeController>(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          shadowColor: AppColors.backgroundColor,
          backgroundColor: AppColors.backgroundColor,
          title: BigTextWidget(
              text: ConstantsValues.appName.toUpperCase(),
              fontWeight: FontWeight.bold),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: Dimensions.height10,
                ),
                // Title

                Container(
                  width: double.infinity,
                  child: GridView.builder(
                    primary: false,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: Dimensions.height10,
                      mainAxisSpacing: Dimensions.width10,
                      mainAxisExtent: 215,
                    ),
                    itemCount: controller.categoriesObjet.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () async {
                          // Get annonce by categorie
                          var annonces = await controller
                              .getAnnonceByCategorie({
                            "categorie": controller.categoriesObjet[index].code
                          });
                          Get.to(LocationByCategoriePage(
                            categorie:
                                controller.categoriesObjet[index].libelle,
                            locations: annonces,
                          ));
                        },
                        child: CategorieWidget(
                          categorie: controller.categoriesObjet[index],
                        ),
                      );
                    },
                    padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.width10,
                        vertical: Dimensions.height10),
                  ),
                ),
                SizedBox(
                  height: Dimensions.height10,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
