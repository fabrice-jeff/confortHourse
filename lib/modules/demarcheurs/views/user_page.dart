import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/colors.dart';
import '../../../utils/constants.dart';
import '../../../utils/dimensions.dart';
import '../../../widgets/big_text.dart';
import '../../../widgets/simple_text.dart';
import '../../base/controllers/base_controller.dart';

class UserPage extends GetView<BaseController> {
  final String page;
  const UserPage({
    super.key,
    required this.page,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: Dimensions.width10, vertical: Dimensions.height10),
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.width10, vertical: Dimensions.height10),
      alignment: Alignment.center,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Dimensions.radius10),
      ),
      child: Column(
        children: [
          SizedBox(
            height: Dimensions.height10,
          ),
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: Dimensions.width10, vertical: Dimensions.height10),
            width: Dimensions.width10 * 10,
            height: Dimensions.height10 * 10,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.screenWidth),
              image: DecorationImage(
                image: AssetImage('images/user.webp'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: Dimensions.height10 * 2,
          ),
          BigTextWidget(
            text: (controller.demarcheur == null)
                ? ""
                : controller.demarcheur!.nom +
                    " " +
                    controller.demarcheur!.prenoms,
            sizeText: Dimensions.fontsize30,
            fontWeight: FontWeight.w700,
            height: 0,
          ),
          SizedBox(
            height: 5,
          ),
          SimpleTextWidget(
            text: (controller.demarcheur == null)
                ? ""
                : controller.demarcheur!.email,
          ),
          SizedBox(
            height: Dimensions.height10 * 2,
          ),
          Divider(),
          SizedBox(
            height: Dimensions.height10 * 2,
          ),
          InkWell(
            onTap: () {
              //DASHBOARD
              controller.changePage(ConstantsValues.DASHBOARD);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.width10),
              width: double.infinity,
              height: Dimensions.height10 * 5,
              decoration: BoxDecoration(
                color: (page == ConstantsValues.DASHBOARD)
                    ? AppColors.secondColor
                    : Colors.white,
                borderRadius: BorderRadius.circular(Dimensions.radius10),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.dashboard_outlined,
                    color: (page == ConstantsValues.DASHBOARD)
                        ? Colors.white
                        : AppColors.secondColor,
                  ),
                  SizedBox(
                    width: Dimensions.width10,
                  ),
                  SimpleTextWidget(
                    text: "Tableau de bord",
                    textColor: (page == ConstantsValues.DASHBOARD)
                        ? Colors.white
                        : AppColors.textColor,
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              // Changer la page dans le base Controller
              controller.changePage(ConstantsValues.PROFIL_USER);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.width10),
              width: double.infinity,
              height: Dimensions.height10 * 5,
              decoration: BoxDecoration(
                color: (page == ConstantsValues.PROFIL_USER)
                    ? AppColors.secondColor
                    : Colors.white,
                borderRadius: BorderRadius.circular(Dimensions.radius10),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.person_outline,
                    color: (page == ConstantsValues.PROFIL_USER)
                        ? Colors.white
                        : AppColors.secondColor,
                  ),
                  SizedBox(
                    width: Dimensions.width10,
                  ),
                  SimpleTextWidget(
                    text: "Mon profile",
                    textColor: (page == ConstantsValues.PROFIL_USER)
                        ? Colors.white
                        : AppColors.textColor,
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              // L'interface MES ANNONCES
              controller.changePage(ConstantsValues.ANNONCES);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.width10),
              width: double.infinity,
              height: Dimensions.height10 * 5,
              decoration: BoxDecoration(
                color: (page == ConstantsValues.ANNONCES)
                    ? AppColors.secondColor
                    : Colors.white,
                borderRadius: BorderRadius.circular(Dimensions.width10),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.home_outlined,
                    color: (page == ConstantsValues.ANNONCES)
                        ? Colors.white
                        : AppColors.secondColor,
                  ),
                  SizedBox(
                    width: Dimensions.width10,
                  ),
                  SimpleTextWidget(
                    text: "Mes annonces",
                    textColor: (page == ConstantsValues.ANNONCES)
                        ? Colors.white
                        : AppColors.textColor,
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              // L'interface AJOUTER UNE ANNONCE
              controller.changePage(ConstantsValues.ADD_ANNONCE);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.width10),
              width: double.infinity,
              height: Dimensions.height10 * 5,
              decoration: BoxDecoration(
                color: (page == ConstantsValues.ADD_ANNONCE)
                    ? AppColors.secondColor
                    : Colors.white,
                borderRadius: BorderRadius.circular(Dimensions.radius10),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.add_circle_outline_rounded,
                    color: (page == ConstantsValues.ADD_ANNONCE)
                        ? Colors.white
                        : AppColors.secondColor,
                  ),
                  SizedBox(
                    width: Dimensions.width10,
                  ),
                  SimpleTextWidget(
                    text: "Publier une annonce",
                    textColor: (page == ConstantsValues.ADD_ANNONCE)
                        ? Colors.white
                        : AppColors.textColor,
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              // L'interface PARAMATRE DE PROFIL
              controller.changePage(ConstantsValues.PARAMETRES);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.width10),
              width: double.infinity,
              height: Dimensions.height10 * 5,
              decoration: BoxDecoration(
                color: (page == ConstantsValues.PARAMETRES)
                    ? AppColors.secondColor
                    : Colors.white,
                borderRadius: BorderRadius.circular(Dimensions.radius10),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.settings_outlined,
                    color: (page == ConstantsValues.PARAMETRES)
                        ? Colors.white
                        : AppColors.secondColor,
                  ),
                  SizedBox(
                    width: Dimensions.width10,
                  ),
                  SimpleTextWidget(
                    text: "Paramètre de profile",
                    textColor: (page == ConstantsValues.PARAMETRES)
                        ? Colors.white
                        : AppColors.textColor,
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              // Deconnexion de l'utilisateur connecté
              controller.logout();
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.width10),
              width: double.infinity,
              height: Dimensions.height10 * 5,
              decoration: BoxDecoration(
                color: (page == ConstantsValues.DECONNEXION)
                    ? AppColors.secondColor
                    : Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.logout_outlined,
                    color: (page == ConstantsValues.DECONNEXION)
                        ? Colors.white
                        : AppColors.secondColor,
                  ),
                  SizedBox(
                    width: Dimensions.width10,
                  ),
                  SimpleTextWidget(
                    text: "Déconnexion",
                    textColor: (page == ConstantsValues.DECONNEXION)
                        ? Colors.white
                        : AppColors.textColor,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
