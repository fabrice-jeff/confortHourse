import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/api/api.dart';
import '../../../utils/colors.dart';
import '../../../utils/constants.dart';
import '../../../utils/dimensions.dart';
import '../../../widgets/big_text.dart';
import '../../../widgets/header_section.dart';

import '../../../widgets/simple_text.dart';
import '../../../widgets/title_section.dart';
import '../controllers/home_controller.dart';
import 'location_by_categorie.dart';
import 'location_widget.dart';

class DetailsLocationView extends GetView<HomeController> {
  final Map<String, dynamic>? location;
  final List<Map<String, dynamic>>? otherAnnonces;

  DetailsLocationView(
      {super.key,
      Map<String, dynamic>? location,
      List<Map<String, dynamic>>? otherAnnonces})
      : location = location ?? Get.arguments?['location'],
        otherAnnonces = otherAnnonces ?? Get.arguments?['otherAnnonces'];

  Widget _options(IconData icon) {
    return Container(
      alignment: Alignment.center,
      width: 40,
      height: 40,
      margin: const EdgeInsets.only(right: 15),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.secondColor),
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: AppColors.backgroundColor,
        backgroundColor: AppColors.backgroundColor,
        title: BigTextWidget(
          text: ConstantsValues.appName.toUpperCase(),
          fontWeight: FontWeight.w400,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              HeaderSectionWidget(text: 'DÉTAIL DE LA LOCATION'),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(
                        Api.baseUrl + "/" + location!['fichiers'][0].path),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.topLeft,
                child: BigTextWidget(text: location!['annonce'].ville),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  alignment: Alignment.center,
                  width: 100,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.secondColor),
                  child: SimpleTextWidget(
                    text: location!['annonce'].typeAnnonce.libelle,
                    textColor: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.topLeft,
                child: SimpleTextWidget(
                  text: "${location!['annonce'].prix} FCFA",
                  fontWeight: FontWeight.bold,
                  sizeText: 25,
                  textColor: AppColors.secondColor,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.topLeft,
                child: Row(
                  children: [
                    _options(
                      Icons.share_outlined,
                    ),
                    _options(
                      Icons.print_outlined,
                    ),
                    _options(
                      Icons.favorite_outline,
                    ),
                    _options(
                      Icons.repeat_rounded,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: const BigTextWidget(
                        text: "Description",
                        textAlign: TextAlign.start,
                      ),
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: SimpleTextWidget(
                          text: location!['annonce'].description),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: const BigTextWidget(
                        text: "Votre décision",
                        textAlign: TextAlign.start,
                      ),
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll<Color>(
                              AppColors.secondColor),
                        ),
                        child: SimpleTextWidget(
                          text: "Je suis interressé",
                          textColor: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: const BigTextWidget(
                        text: "Contact de l'Agent",
                        textAlign: TextAlign.start,
                      ),
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Row(
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 2.8, color: AppColors.secondColor),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Container(
                              height: double.maxFinite,
                              width: double.maxFinite,
                              margin: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(45),
                                image: const DecorationImage(
                                    image: AssetImage("images/user.webp"),
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: Dimensions.height10 * 2,
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      alignment: Alignment.topLeft,
                                      child: BigTextWidget(
                                        text:
                                            "${location!['annonce'].demarcheur!.nom} ${location!['annonce'].demarcheur!.prenoms}",
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: Dimensions.height10 / 2,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.phone_outlined,
                                      color: AppColors.secondColor,
                                      size: 18,
                                    ),
                                    SizedBox(
                                      width: Dimensions.height10 / 2,
                                    ),
                                    Container(
                                      alignment: Alignment.topLeft,
                                      child: SimpleTextWidget(
                                        text: "Télephone",
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: Dimensions.height10 / 2,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.email_outlined,
                                      color: AppColors.secondColor,
                                      size: 18,
                                    ),
                                    SizedBox(
                                      width: Dimensions.width10 / 2,
                                    ),
                                    Container(
                                      alignment: Alignment.topLeft,
                                      child: SimpleTextWidget(
                                        text: "Email",
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Dimensions.height10 * 9,
              ),
              const TitleSectionWidget(
                  firstText: "ANNONCES SIMILAIRES",
                  secondText: "Découvrez les Annonces Similaires"),
              SizedBox(
                height: Dimensions.height10 * 2,
              ),
              Container(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: otherAnnonces!.length,
                  itemBuilder: (BuildContext context, int position) {
                    var location = otherAnnonces![position];
                    return LocationWidget(location: location);
                  },
                ),
              ),
              InkWell(
                onTap: () async {
                  //Récupérer annonces par catégorie
                  var annonces = await controller.getAnnonceByCategorie(
                    {"categorie": location!['annonce'].categorie.libelle},
                  );
                  Get.to(LocationByCategoriePage(
                    categorie: location!['annonce'].categorie.libelle,
                    locations: annonces,
                  ));
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.secondColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 60),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: BigTextWidget(
                    text:
                        "Voir plus de  ${location!['annonce'].categorie.libelle}"
                            .toUpperCase(),
                    textColor: const Color.fromARGB(255, 244, 212, 212),
                    sizeText: 16,
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
