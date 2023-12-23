import 'package:conforthourse/colors.dart';
import 'package:conforthourse/providers/user_login.dart';
import 'package:conforthourse/screens/demarcheurs/dashboard.dart';
import 'package:conforthourse/screens/security/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var user = context.watch<UserLogin>().email;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {},
            child: Icon(
              Icons.search,
              color: AppColors.secondColor,
              size: 30,
            ),
          ),
          InkWell(
            onTap: () {},
            child: Icon(
              Icons.add,
              color: AppColors.secondColor,
              size: 30,
            ),
          ),
          InkWell(
            onTap: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) {
              //   return const DashboardPage();
              // }));
              if (user.isEmpty) {
                // Rediriger vers l'interface de connexion
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const LoginPage();
                }));
              } else {
                // Continuer vers les autres interfaces
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const DashboardPage();
                }));
              }
            },
            child: Icon(
              Icons.person_2_outlined,
              color: AppColors.secondColor,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
