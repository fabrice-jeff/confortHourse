import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../data/api/api.dart';
import '../../../routes/routes.dart';
import '../../../utils/colors.dart';
import '../../../utils/constants.dart';
import '../../../utils/dimensions.dart';
import '../../../components/big_text.dart';
import '../../../components/header_section.dart';
import '../../../components/simple_text.dart';
import '../../base/controllers/base_controller.dart';
import '../controllers/annonce_controller.dart';
import 'user_page.dart';

class AnnoncesView extends GetView<AnnonceController> {
  final BaseController? baseController;
  const AnnoncesView({super.key, this.baseController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              HeaderSectionWidget(text: "MES ANNONCES"),
              UserPage(page: ConstantsValues.annonces),
              SizedBox(
                height: Dimensions.height10 * 2,
              ),
              Container(
                padding:
                    EdgeInsets.symmetric(horizontal: Dimensions.width10 * 1.5),
                alignment: Alignment.topLeft,
                child: BigTextWidget(
                  text: "Mes annonces",
                  sizeText: Dimensions.fontsize20,
                ),
              ),

              // Tableau
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(Dimensions.radius10)),
                margin: EdgeInsets.symmetric(
                    horizontal: Dimensions.width10,
                    vertical: Dimensions.height10),
                padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.width10,
                    vertical: Dimensions.height10),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    // Tableau de données
                    Container(
                      child: Scrollbar(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(
                            dataRowHeight: Dimensions.height10 * 25,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius10),
                            ),
                            border: TableBorder.all(
                              color: Colors.grey,
                              width: 0.5,
                            ),
                            columns: const <DataColumn>[
                              DataColumn(
                                label: BigTextWidget(
                                  text: "Annonces",
                                ),
                              ),
                              DataColumn(
                                label: BigTextWidget(
                                  text: "Vues",
                                ),
                              ),
                              DataColumn(
                                label: BigTextWidget(text: "Publié le"),
                              ),
                              DataColumn(
                                label: BigTextWidget(
                                  text: "Catégorie",
                                ),
                              ),
                              DataColumn(
                                label: BigTextWidget(text: "Actions"),
                              ),
                            ],
                            rows: <DataRow>[
                              for (var element in controller.mesAnnonces)
                                DataRow(
                                  cells: [
                                    DataCell(
                                      Container(
                                        width: Dimensions.width10 * 20,
                                        alignment: Alignment.topLeft,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.symmetric(
                                                  vertical:
                                                      Dimensions.height10),
                                              width: Dimensions.width10 * 12,
                                              height: Dimensions.height10 * 12,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                image: DecorationImage(
                                                  image: NetworkImage(
                                                    "${Api.baseUrl}/${element['fichiers'][0].path}",
                                                  ),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: Dimensions.width10 * 12,
                                              child: BigTextWidget(
                                                  textAlign: TextAlign.start,
                                                  sizeText: 20,
                                                  fontWeight: FontWeight.bold,
                                                  text:
                                                      element['annonce'].titre),
                                            ),
                                            SizedBox(
                                              height: Dimensions.height10 / 2,
                                            ),
                                            Container(
                                              width: Dimensions.width10 * 12,
                                              child: SimpleTextWidget(
                                                  textAlign: TextAlign.start,
                                                  sizeText: 16,
                                                  fontWeight: FontWeight.w300,
                                                  text:
                                                      element['annonce'].ville),
                                            ),
                                            SizedBox(
                                              height: Dimensions.height10 / 2,
                                            ),
                                            Container(
                                              width: Dimensions.width10 * 12,
                                              child: BigTextWidget(
                                                  textAlign: TextAlign.start,
                                                  sizeText: 20,
                                                  fontWeight: FontWeight.bold,
                                                  text:
                                                      "${element['annonce'].prix} FCFA"),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      Text("Vues"),
                                    ),
                                    DataCell(
                                      Text(DateFormat("dd/MM/yyyy H:m:ss")
                                          .format(
                                              element['annonce'].createdAt)),
                                    ),
                                    DataCell(
                                      Text(
                                          element['annonce'].categorie.libelle),
                                    ),
                                    DataCell(
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal:
                                                Dimensions.height10 * 2),
                                        width: double.infinity,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            InkWell(
                                              onTap: () async {
                                                // Voir détails de l'annonce
                                                Map<String, dynamic> data = {
                                                  "categorie":
                                                      element['annonce']
                                                          .categorie
                                                          .libelle,
                                                  'annonce': element['annonce']
                                                      .id
                                                      .toString()
                                                };
                                                var annoncesSimulaires =
                                                    await baseController!
                                                        .getAnnonceSimulaireByCategorie(
                                                            data);

                                                // Détails d'une annomce
                                                Get.toNamed(
                                                  Routes.detailsLocation,
                                                  arguments: {
                                                    'location': element,
                                                    'otherAnnonces':
                                                        annoncesSimulaires,
                                                    'baseController':
                                                        baseController,
                                                  },
                                                );
                                              },
                                              child: Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal:
                                                        Dimensions.width10 / 2),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal:
                                                        Dimensions.width10,
                                                    vertical:
                                                        Dimensions.height10),
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color:
                                                          AppColors.textColor),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          Dimensions.radius10),
                                                ),
                                                child: Icon(
                                                  Icons.remove_red_eye,
                                                  color: AppColors.textColor,
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                // modifier l'annonce
                                              },
                                              child: Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal:
                                                        Dimensions.width10 / 2),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal:
                                                        Dimensions.width10,
                                                    vertical:
                                                        Dimensions.height10),
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color:
                                                          AppColors.textColor),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          Dimensions.radius10),
                                                ),
                                                child: Icon(
                                                  Icons.edit,
                                                  color: AppColors.textColor,
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                // Supprimer l'annonce
                                                Map<String, dynamic> data = {
                                                  'annonce': element['annonce']
                                                      .id
                                                      .toString()
                                                };
                                                controller.deleteAnnonce(data);
                                              },
                                              child: Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal:
                                                        Dimensions.width10 / 2),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal:
                                                        Dimensions.width10,
                                                    vertical:
                                                        Dimensions.height10),
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color:
                                                          AppColors.textColor),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          Dimensions.radius10),
                                                ),
                                                child: Icon(
                                                  Icons.delete,
                                                  color: AppColors.textColor,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.height10 * 2,
                    ),
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
