import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../data/api/api.dart';
import '../../../utils/colors.dart';
import '../../../utils/constants.dart';
import '../../../utils/dimensions.dart';
import '../../../widgets/big_text.dart';
import '../../../widgets/header_section.dart';
import '../../../widgets/simple_text.dart';
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
              UserPage(page: ConstantsValues.ANNONCES),
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
                                  text: "Chambres",
                                ),
                              ),
                              DataColumn(
                                label: BigTextWidget(
                                  text: "Catégorie",
                                ),
                              ),
                              DataColumn(
                                label: BigTextWidget(text: "Date"),
                              ),
                              DataColumn(
                                label: BigTextWidget(text: "Status"),
                              ),
                              DataColumn(
                                label: BigTextWidget(text: "Prix"),
                              ),
                              DataColumn(
                                label: BigTextWidget(text: "Actions"),
                              ),
                            ],
                            rows: <DataRow>[
                              for (var element
                                  in controller.recentsPublicaation)
                                DataRow(
                                  cells: [
                                    DataCell(
                                      Container(
                                        width: double.infinity,
                                        height: 200,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: DecorationImage(
                                              image: NetworkImage(Api.baseUrl +
                                                  "/" +
                                                  element['fichiers'][0].path),
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                          element['annonce'].categorie.libelle),
                                    ),
                                    DataCell(
                                      Text(DateFormat("dd/MM/yyyy").format(
                                          element['annonce'].createdAt)),
                                    ),
                                    DataCell(
                                      // if(element['annonce'].deleted =)
                                      (element['annonce'].deleted)
                                          ? Container(
                                              decoration: BoxDecoration(
                                                color: AppColors.secondColor,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        Dimensions.radius10),
                                              ),
                                              child: SimpleTextWidget(
                                                text: "Désactivé",
                                                textColor: Colors.white,
                                              ),
                                            )
                                          : Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal:
                                                      Dimensions.width10 / 2),
                                              decoration: BoxDecoration(
                                                color: Colors.green,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        Dimensions.radius10),
                                              ),
                                              child: SimpleTextWidget(
                                                text: "Actif",
                                                fontWeight: FontWeight.w700,
                                                textColor: Colors.white,
                                              ),
                                            ),
                                    ),
                                    DataCell(
                                      Text(element['annonce'].prix + " FCFA"),
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
                                              onTap: () {
                                                // Voir détails de l'annonce
                                              },
                                              child: Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal:
                                                        Dimensions.height10),
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
                                                        Dimensions.height10),
                                                child: Icon(
                                                  Icons.edit,
                                                  color: AppColors.textColor,
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                // Voir détails de l'annonce
                                              },
                                              child: Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal:
                                                        Dimensions.height10),
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
