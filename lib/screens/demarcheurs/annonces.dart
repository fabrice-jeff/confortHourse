import 'package:conforthourse/colors.dart';
import 'package:conforthourse/constants.dart';
import 'package:conforthourse/screens/demarcheurs/user_page.dart';
import 'package:conforthourse/widgets/big_text.dart';
import 'package:conforthourse/widgets/header_section.dart';
import 'package:conforthourse/widgets/simple_text.dart';
import 'package:flutter/material.dart';

class AnnoncesPage extends StatelessWidget {
  const AnnoncesPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget _infoUser({required String libelle, required String value}) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 7, vertical: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              alignment: Alignment.topLeft,
              child: BigTextWidget(
                text: libelle,
                sizeText: 15,
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
                  sizeText: 14,
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
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: BigTextWidget(
                        text: "Mes annonces",
                        sizeText: 20,
                      ),
                    ),

                    Divider(),
                    SizedBox(
                      height: 10,
                    ),
                    // Tableau de données
                    Container(
                      child: Scrollbar(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
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
                      height: 20,
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
