import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/demarcheur.dart';
import '../../../routes/routes.dart';
import '../../../utils/colors.dart';
import '../../../utils/constants.dart';
import '../../../utils/dimensions.dart';
import '../../../widgets/big_text.dart';
import '../../../widgets/simple_text.dart';
import 'annonces.dart';
import 'dashboard.dart';
import 'parametre_profil.dart';
import 'profil_view.dart';

class UserPage extends StatelessWidget {
  final Demarcheur? demarcheur;
  final String page;
  const UserPage({super.key, required this.page, this.demarcheur});

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
            text: (demarcheur == null)
                ? ""
                : demarcheur!.nom + " " + demarcheur!.prenoms,
            sizeText: Dimensions.fontsize30,
            fontWeight: FontWeight.w700,
            height: 0,
          ),
          SizedBox(
            height: 5,
          ),
          SimpleTextWidget(
            text: (demarcheur == null) ? "" : demarcheur!.email,
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
              // L'interface DASHBOARD
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DashboardPage();
              }));
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
              // L'interface PROFIL
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ProfilView();
              }));
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
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const AnnoncesPage();
              }));
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
              Get.toNamed(Routes.demarcheurAddAnnonce);
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
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const ParametreProfilPage();
              }));
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
              // L'interface DECONNEXION
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
