import 'package:conforthourse/colors.dart';
import 'package:conforthourse/constants.dart';
import 'package:conforthourse/dimensions.dart';
import 'package:conforthourse/screens/demarcheurs/user_page.dart';
import 'package:conforthourse/widgets/big_text.dart';
import 'package:conforthourse/widgets/header_section.dart';
import 'package:conforthourse/widgets/simple_text.dart';
import 'package:flutter/material.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget _infoUser({required String libelle, required String value}) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: Dimensions.height10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              alignment: Alignment.topLeft,
              child: BigTextWidget(
                text: libelle,
                sizeText: Dimensions.fontsize16,
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Expanded(
              child: Container(
                alignment: Alignment.topRight,
                child: SimpleTextWidget(
                  textAlign: TextAlign.start,
                  text: value,
                  sizeText: Dimensions.fontsize15,
                ),
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        shadowColor: AppColors.backgroundColor,
        backgroundColor: AppColors.backgroundColor,
        title: BigTextWidget(
          text: "ConforthOurse",
          fontWeight: FontWeight.w400,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              HeaderSectionWidget(text: "PROFILE"),
              UserPage(page: ConstantsValues.PROFIL_USER),
              SizedBox(
                height: Dimensions.height10 * 2,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(Dimensions.radius10)),
                margin: EdgeInsets.symmetric(
                    horizontal: Dimensions.width10,
                    vertical: Dimensions.height10),
                padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.width10 * 2,
                    vertical: Dimensions.height10),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: BigTextWidget(
                        text: "Profile",
                        sizeText: Dimensions.fontsize20,
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          height: Dimensions.height10 * 5,
                          decoration: BoxDecoration(
                            color: AppColors.secondColor,
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add_circle_outline_rounded,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: Dimensions.width10,
                              ),
                              SimpleTextWidget(
                                text: "Ajouter une annonce",
                                sizeText: Dimensions.fontsize15,
                                textColor: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: Dimensions.height10),
                    Divider(),
                    _infoUser(libelle: "Nom complet:", value: "AGBO Fabrice"),
                    _infoUser(libelle: "Email:", value: "agbjeff@gmail.com"),
                    _infoUser(libelle: "Téléphone:", value: "+22997535808"),
                    _infoUser(libelle: "Whatsapp:", value: "+22997535808"),
                    _infoUser(libelle: "Total de location :", value: "0"),
                    _infoUser(libelle: "Location actif:", value: "0"),
                    _infoUser(libelle: "Location loués :", value: "0"),
                    _infoUser(libelle: "Création du compte:", value: ""),
                    _infoUser(
                        libelle: "Description:", value: "Agent immobilier"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
