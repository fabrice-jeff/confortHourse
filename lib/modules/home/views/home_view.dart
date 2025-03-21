import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/colors.dart';
import '../../../utils/constants.dart';
import '../../../utils/dimensions.dart';
import '../../../components/big_text.dart';
import '../../../components/list_temoignage.dart';
import '../../base/controllers/base_controller.dart';
import 'location_by_categorie.dart';
import 'location_widget.dart';
import '../../../components/simple_text.dart';
import '../../../components/title_section.dart';
import '../controllers/home_controller.dart';
import 'categorie_widget.dart';

class HomeView extends GetView<HomeController> {
  final BaseController? baseController;
  const HomeView({super.key, this.baseController});
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
                const TitleSectionWidget(
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
                    itemCount: baseController!.categoriesObjet.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () async {
                          //Récupérer annonces par catégorie
                          var annonces = await baseController!
                              .getAnnonceByCategorie({
                            "categorie":
                                baseController!.categoriesObjet[index].libelle
                          });
                          Get.to(LocationByCategoriePage(
                            baseController: baseController,
                            categorie:
                                baseController!.categoriesObjet[index].libelle,
                            locations: annonces,
                          ));
                        },
                        child: CategorieWidget(
                          categorie: baseController!.categoriesObjet[index],
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
                const TitleSectionWidget(
                  firstText: "DÉCOUVREZ NOS LOCATIONS IMMOBILIÈRE",
                  secondText: "Plongez Dans Le Confort",
                ),
                SizedBox(
                  height: Dimensions.height10,
                ),
                Container(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.annonceBylimite.length,
                    itemBuilder: (BuildContext context, int position) {
                      var location = controller.annonceBylimite[position];
                      return LocationWidget(location: location);
                    },
                  ),
                ),
                SizedBox(
                  height: Dimensions.height10,
                ),
                // VideoApp(),
                TitleSectionWidget(
                  firstText: ConstantsValues.appName.toUpperCase(),
                  secondText: "Pourquoi Nous choisir",
                ),
                Container(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 3,
                    physics: const NeverScrollableScrollPhysics(),
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
                  decoration: const BoxDecoration(
                    color: Color(0xFF022956),
                  ),
                  child: Column(
                    children: [
                      Container(
                        child: const TitleSectionWidget(
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
