import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/api/api.dart';
import '../../../routes/routes.dart';
import '../../../utils/colors.dart';
import '../../../utils/dimensions.dart';
import '../../../widgets/big_text.dart';
import '../../../widgets/simple_text.dart';
import '../controllers/home_controller.dart';
import 'details_location.dart';

class LocationWidget extends GetView<HomeController> {
  final Map<String, dynamic> location;
  const LocationWidget({super.key, required this.location});
  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      height: 500,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: NetworkImage(
                          "${Api.baseUrl}/${location['fichiers'][0].path}"),
                      fit: BoxFit.cover),
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  alignment: Alignment.topCenter,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  height: 35,
                  width: MediaQuery.of(context).size.width * 0.5,
                  decoration: BoxDecoration(
                    color: AppColors.secondColor,
                    borderRadius: BorderRadius.circular(Dimensions.radius10),
                  ),
                  child: SimpleTextWidget(
                    text: location['annonce'].typeAnnonce.libelle,
                    textColor: Colors.white,
                    fontWeight: FontWeight.w500,
                    sizeText: 15,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: Dimensions.height10,
          ),
          Container(
            alignment: Alignment.topLeft,
            child: BigTextWidget(
              text: location['annonce'].ville,
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(
            height: Dimensions.height10 / 2,
          ),
          Expanded(
            child: SimpleTextWidget(text: location['annonce'].description),
          ),
          SizedBox(
            height: Dimensions.height10,
          ),
          Row(
            children: [
              SimpleTextWidget(
                text: "Prix",
              ),
              const Spacer(),
              BigTextWidget(
                text: location['annonce'].prix + "F / Mois",
                textColor: AppColors.secondColor,
              ),
            ],
          ),
          SizedBox(
            height: Dimensions.height10,
          ),
          Divider(
            height: 1,
            color: AppColors.textColor.withOpacity(0.2),
          ),
          SizedBox(
            height: Dimensions.height10,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    color: AppColors.backgroundColor,
                    borderRadius: BorderRadius.circular(30),
                    image: const DecorationImage(
                      image: AssetImage('images/user.webp'),
                    ),
                  ),
                ),
                BigTextWidget(
                  text:
                      "${location['annonce'].demarcheur!.nom} ${location['annonce'].demarcheur!.prenoms}",
                  height: 0,
                  sizeText: 17,
                ),
                Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: 80,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: AppColors.secondColor,
                      width: 1,
                    ),
                  ),
                  child: TextButton(
                    onPressed: () async {
                      // Get other annonces
                      Map<String, dynamic> data = {
                        "categorie": location['annonce'].categorie.libelle,
                        'annonce': location['annonce'].id.toString()
                      };
                      var annoncesSimulaires =
                          await controller.getAnnonceSimulaireByCategorie(data);

                      // Détails d'une annomce
                      Get.offAndToNamed(Routes.detailsLocation, arguments: {
                        'location': location,
                        'otherAnnonces': annoncesSimulaires
                      });
                    },
                    child: SimpleTextWidget(
                      text: 'Détails',
                      textColor: AppColors.secondColor,
                      fontWeight: FontWeight.w400,
                      sizeText: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
