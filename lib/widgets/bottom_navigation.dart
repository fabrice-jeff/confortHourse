import 'package:conforthourse/colors.dart';
import 'package:conforthourse/dimensions.dart';
import 'package:conforthourse/providers/user_login.dart';
import 'package:conforthourse/screens/demarcheurs/add_annonce.dart';
import 'package:conforthourse/screens/demarcheurs/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var user = context.watch<UserLogin>().email;

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
