import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../utils/colors.dart';
import '../../../utils/constants.dart';
import '../../../utils/dimensions.dart';
import '../../../components/big_text.dart';
import '../../../components/header_section.dart';
import '../../../components/simple_text.dart';
import '../../base/controllers/base_controller.dart';
import '../controllers/annonce_controller.dart';
import 'user_page.dart';

class ProfilView extends GetView<AnnonceController> {
  final BaseController? baseController;
  const ProfilView({super.key, this.baseController});

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
              sizeText: Dimensions.fontsize15,
              textAlign: TextAlign.start,
            ),
          ),
          SizedBox(
            width: Dimensions.width10 / 2,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: (baseController!.demarcheur != null)
              ? Column(
                  children: [
                    HeaderSectionWidget(text: "PROFILE"),
                    UserPage(page: ConstantsValues.profilUser),
                    SizedBox(
                      height: Dimensions.height10 * 2,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius10)),
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
                              onTap: () {
                                //Interface d'ajout d'une annonce
                                baseController!
                                    .changePage(ConstantsValues.addAnnonces);
                              },
                              child: Container(
                                height: Dimensions.height10 * 5,
                                decoration: BoxDecoration(
                                  color: AppColors.secondColor,
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.radius10),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
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
                          const Divider(),
                          _infoUser(
                              libelle: "Nom complet:".toUpperCase(),
                              value:
                                  "${baseController!.demarcheur!.nom} ${baseController!.demarcheur!.prenoms}"),
                          _infoUser(
                              libelle: "Email:".toUpperCase(),
                              value: baseController!.demarcheur!.email),
                          _infoUser(
                              libelle: "Téléphone:".toUpperCase(),
                              value: baseController!.demarcheur!.telephone),
                          _infoUser(
                              libelle: "Whatsapp:".toUpperCase(),
                              value: baseController!.demarcheur!.whatsapp),
                          _infoUser(
                              libelle: "Total de location :".toUpperCase(),
                              value: controller.totalPublicationByDemarcheur
                                  .toString()),
                          _infoUser(
                              libelle: "Location active:".toUpperCase(),
                              value:
                                  controller.totalChambresActives.toString()),
                          _infoUser(
                              libelle: "Location loués :".toUpperCase(),
                              value: controller.totalChambresLouees.toString()),
                          _infoUser(
                              libelle: "Création du compte:".toUpperCase(),
                              value: DateFormat("dd/MM/yyyy").format(
                                  baseController!.demarcheur!.createdAt)),
                          _infoUser(
                              libelle: "Description:".toUpperCase(),
                              value: baseController!.demarcheur!.description!),
                        ],
                      ),
                    ),
                  ],
                )
              : Container(),
        ),
      ),
    );
  }
}
