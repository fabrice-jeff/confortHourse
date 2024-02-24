import 'package:flutter/material.dart';

import '../../../utils/colors.dart';
import '../../../utils/constants.dart';
import '../../../utils/dimensions.dart';
import '../../../widgets/big_text.dart';
import '../../../widgets/header_section.dart';
import '../../../widgets/simple_text.dart';
import 'user_page.dart';

class AnnoncesPage extends StatelessWidget {
  const AnnoncesPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget _infoUser({required String libelle, required String value}) {
      return Container(
        margin: EdgeInsets.symmetric(
            horizontal: Dimensions.width10, vertical: Dimensions.height10),
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
              width: Dimensions.width10,
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
                                label: BigTextWidget(text: "Prix"),
                              ),
                              DataColumn(
                                label: BigTextWidget(text: "Type"),
                              ),
                            ],
                            rows: const <DataRow>[
                              DataRow(cells: const <DataCell>[
                                DataCell(
                                  Text("Bonjour"),
                                ),
                                DataCell(
                                  Text("Bonjour"),
                                ),
                                DataCell(
                                  Text("Bonjour"),
                                ),
                                DataCell(
                                  Text("Bonjour"),
                                ),
                              ]),
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
