import 'package:conforthourse/utils/colors.dart';
import 'package:conforthourse/utils/dimensions.dart';
import 'package:conforthourse/views/demarcheurs/add_annonce.dart';
import 'package:conforthourse/views/demarcheurs/dashboard.dart';
import 'package:flutter/material.dart';

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.width10),
      width: double.infinity,
      height: Dimensions.height10 * 6,
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Dimensions.radius30),
          topRight: Radius.circular(Dimensions.radius30),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const AddAnnoncePage();
              }));
            },
            child: Icon(
              Icons.search,
              color: AppColors.secondColor,
              size: Dimensions.small,
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const AddAnnoncePage();
              }));
            },
            child: Icon(
              Icons.add,
              color: AppColors.secondColor,
              size: Dimensions.small,
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const DashboardPage();
              }));
              // if (user.isEmpty) {
              //   // Rediriger vers l'interface de connexion
              //   Navigator.push(context, MaterialPageRoute(builder: (context) {
              //     return const LoginPage();
              //   }));
              // } else {
              //   // Continuer vers les autres interfaces
              //   Navigator.push(context, MaterialPageRoute(builder: (context) {
              //     return const DashboardPage();
              //   }));
              // }
            },
            child: Icon(
              Icons.person_2_outlined,
              color: AppColors.secondColor,
              size: Dimensions.small,
            ),
          ),
        ],
      ),
    );
  }
}
