import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../utils/colors.dart';
import '../../../utils/constants.dart';
import '../../../utils/dimensions.dart';
import '../../../widgets/big_text.dart';
import '../../../widgets/header_section.dart';
import '../../../widgets/simple_text.dart';
import '../controllers/demarcheur_controller.dart';
import 'user_page.dart';

class ProfilView extends GetView<DemarcheurController> {
  const ProfilView({super.key});

  @override
  Widget build(BuildContext context) {
    String nom = (ConstantsValues.demarcheurControllerInit)
        ? controller.demarcheur!.nom + " " + controller.demarcheur!.prenoms
        : "";
    String email = (ConstantsValues.demarcheurControllerInit)
        ? controller.demarcheur!.email
        : "";
    String telephone = (ConstantsValues.demarcheurControllerInit)
        ? controller.demarcheur!.telephone
        : "";
    String whatsapp = (ConstantsValues.demarcheurControllerInit)
        ? controller.demarcheur!.whatsapp
        : "";
    String description = (ConstantsValues.demarcheurControllerInit)
        ? controller.demarcheur!.description
        : "";
    String createdAtAcccompte =
        DateFormat("dd/MM/yyyy").format(controller.demarcheur!.createdAt);

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
                    _infoUser(libelle: "Nom complet:", value: nom),
                    _infoUser(libelle: "Email:", value: email),
                    _infoUser(libelle: "Téléphone:", value: telephone),
                    _infoUser(libelle: "Whatsapp:", value: whatsapp),
                    _infoUser(libelle: "Total de location :", value: "0"),
                    _infoUser(libelle: "Location actif:", value: "0"),
                    _infoUser(libelle: "Location loués :", value: "0"),
                    _infoUser(
                        libelle: "Création du compte:",
                        value: createdAtAcccompte),
                    _infoUser(libelle: "Description:", value: description),
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
