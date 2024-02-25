import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/colors.dart';
import '../../../utils/dimensions.dart';
import '../../../views/location_by_categorie.dart';
import '../../../widgets/big_text.dart';
import '../../../widgets/list_temoignage.dart';
import '../../../widgets/location_widget.dart';
import '../../../widgets/simple_text.dart';
import '../../../widgets/title_section.dart';
import '../controllers/home_controller.dart';
import 'categorie_widget.dart';

class HomeView extends GetView<HomeController> {
  const HomeView();
  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return GetBuilder<HomeController>(builder: (_) {
      return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: Dimensions.height10,
                ),
                // Title
                TitleSectionWidget(
                  firstText: "CATÉGORIES",
                  secondText: "Choisissez Votre Catégorie",
                ),
                SizedBox(
                  height: Dimensions.height10,
                ),
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
                          print(annonces);

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
                TitleSectionWidget(
                  firstText: "DÉCOUVREZ NOS LOCATIONS IMMOBILIÈRE",
                  secondText: "Plongez Dans Le Confort",
                ),
                SizedBox(
                  height: Dimensions.height10,
                ),
                // Container(
                //   child: ListView.builder(
                //     shrinkWrap: true,
                //     physics: NeverScrollableScrollPhysics(),
                //     itemCount: controller.locations.length,
                //     itemBuilder: (BuildContext context, i) {
                //       return LocationWidget(
                //         location: controller.locations[i],
                //       );
                //     },
                //   ),
                // ),
                SizedBox(
                  height: Dimensions.height10,
                ),
                // VideoApp(),
                TitleSectionWidget(
                  firstText: "CONFORTHOUSE",
                  secondText: "Pourquoi Nous choisir",
                ),
                Container(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 3,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext, position) {
                      return _listReasons(context);
                    },
                  ),
                ),
                SizedBox(
                  height: Dimensions.height10,
                ),
                Container(
                  padding: EdgeInsets.only(
                    left: Dimensions.width10,
                    right: Dimensions.width10,
                    top: Dimensions.height10,
                    bottom: Dimensions.height10 * 4,
                  ),
                  alignment: Alignment.center,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xFF022956),
                  ),
                  child: Column(
                    children: [
                      Container(
                        child: TitleSectionWidget(
                          firstText: "TEMOIGNAGES",
                          secondText: "Ce Que Nos Clients Disent",
                          colorSecondText: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.height10,
                      ),
                      Container(
                        height: Dimensions.heightTemoignage,
                        child: const ListTemoignage(),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget _listReasons(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(
          horizontal: Dimensions.width10, vertical: Dimensions.height10 * 1.5),
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.width10, vertical: Dimensions.height10 * 1.5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Dimensions.radius10),
      ),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: Dimensions.height10 * 2),
            child: Icon(
              Icons.location_city,
              color: AppColors.secondColor,
              size: Dimensions.large,
            ),
          ),
          SizedBox(
            height: Dimensions.height10,
          ),
          BigTextWidget(
            text: "Large sélection de chambres",
            sizeText: Dimensions.fontsize20,
          ),
          SizedBox(
            height: Dimensions.height10,
          ),
          SimpleTextWidget(
            text:
                "Découvrez une vaste sélection de chambres à louer, soigneusement publiées par nos agents immobiliers partenaires, pour trouver celle qui correspond parfaitement à vos besoins.",
            textAlign: TextAlign.center,
            sizeText: Dimensions.fontsize15,
          ),
        ],
      ),
    );
  }
}
