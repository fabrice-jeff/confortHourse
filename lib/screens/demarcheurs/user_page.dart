import 'package:conforthourse/colors.dart';
import 'package:conforthourse/widgets/big_text.dart';
import 'package:conforthourse/widgets/header_section.dart';
import 'package:conforthourse/widgets/simple_text.dart';
import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  final String headerTitle;
  const UserPage({super.key, required this.headerTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderSectionWidget(text: headerTitle),
        Container(
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
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: AppColors.secondColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.dashboard,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      BigTextWidget(
                        text: "Tableau de bord",
                        textColor: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: ListTile(
                  leading: Icon(
                    Icons.person_outline,
                  ),
                  title: SimpleTextWidget(
                    text: "Mon profile",
                    height: 0,
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: ListTile(
                  leading: Icon(
                    Icons.home_outlined,
                  ),
                  title: SimpleTextWidget(
                    text: "Mes annonces",
                    height: 0,
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: ListTile(
                  leading: Icon(
                    Icons.add_circle_outline_rounded,
                  ),
                  title: SimpleTextWidget(
                    text: "Publier une annonces",
                    height: 0,
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: ListTile(
                  leading: Icon(
                    Icons.settings_outlined,
                  ),
                  title: SimpleTextWidget(
                    text: "Paramètre de profile",
                    height: 0,
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: ListTile(
                  leading: Icon(
                    Icons.logout_outlined,
                  ),
                  title: SimpleTextWidget(
                    text: "Déconnexion",
                    height: 0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
