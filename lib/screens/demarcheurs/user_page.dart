import 'package:conforthourse/colors.dart';
import 'package:conforthourse/constants.dart';
import 'package:conforthourse/providers/user_login.dart';
import 'package:conforthourse/screens/demarcheurs/add_annonce.dart';
import 'package:conforthourse/screens/demarcheurs/annonces.dart';
import 'package:conforthourse/screens/demarcheurs/dashboard.dart';
import 'package:conforthourse/screens/demarcheurs/parametre_profil.dart';
import 'package:conforthourse/screens/demarcheurs/profil.dart';
import 'package:conforthourse/screens/home.dart';
import 'package:conforthourse/widgets/big_text.dart';
import 'package:conforthourse/widgets/simple_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserPage extends StatelessWidget {
  final String page;
  const UserPage({super.key, required this.page});
  void logout(BuildContext context) {
    context.read<UserLogin>().connect("");
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const HomePage();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      alignment: Alignment.center,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              image: DecorationImage(
                image: AssetImage('images/user.webp'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          BigTextWidget(
            text: "AGBO Fabrice",
            sizeText: 30,
            fontWeight: FontWeight.w700,
            height: 0,
          ),
          SizedBox(
            height: 5,
          ),
          SimpleTextWidget(
            text: "agbjeff@gmail.com",
            height: 0,
          ),
          SizedBox(
            height: 20,
          ),
          Divider(),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              // L'interface DASHBOARD
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DashboardPage();
              }));
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                color: (page == ConstantsValues.DASHBOARD)
                    ? AppColors.secondColor
                    : Colors.white,
                borderRadius: BorderRadius.circular(10),
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
                    width: 10,
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
                return ProfilPage();
              }));
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                color: (page == ConstantsValues.PROFIL_USER)
                    ? AppColors.secondColor
                    : Colors.white,
                borderRadius: BorderRadius.circular(10),
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
                    width: 10,
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
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                color: (page == ConstantsValues.ANNONCES)
                    ? AppColors.secondColor
                    : Colors.white,
                borderRadius: BorderRadius.circular(10),
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
                    width: 10,
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
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const AddAnnoncePage();
              }));
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                color: (page == ConstantsValues.ADD_ANNONCE)
                    ? AppColors.secondColor
                    : Colors.white,
                borderRadius: BorderRadius.circular(10),
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
                    width: 10,
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
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                color: (page == ConstantsValues.PARAMETRES)
                    ? AppColors.secondColor
                    : Colors.white,
                borderRadius: BorderRadius.circular(10),
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
                    width: 10,
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
              logout(context);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              height: 50,
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
                    width: 10,
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
