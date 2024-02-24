import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/colors.dart';
import '../../../utils/constants.dart';
import '../../../utils/dimensions.dart';
import '../../../widgets/big_text.dart';
import '../../../widgets/header_section.dart';
import '../../../widgets/simple_text.dart';
import 'user_page.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
              HeaderSectionWidget(text: "DASHBOARD"),
              UserPage(page: ConstantsValues.DASHBOARD),
              SizedBox(
                height: Dimensions.height10,
              ),
              statistiqueUser(
                  context: context,
                  primaryColor: const Color(0xFF6259CA),
                  backgroundColor: Color.fromRGBO(98, 89, 202, 0.2),
                  nombre: 0,
                  icon: Icons.home_outlined,
                  text: "Total Publication"),
              SizedBox(
                height: Dimensions.height10 * 2,
              ),
              statistiqueUser(
                  context: context,
                  primaryColor: Color(0xFF09AD95),
                  backgroundColor: Color.fromRGBO(0, 230, 130, 0.2),
                  nombre: 0,
                  icon: Icons.home_outlined,
                  text: "Chambres louées"),
              SizedBox(
                height: Dimensions.height10 * 2,
              ),
              statistiqueUser(
                  context: context,
                  primaryColor: Color(0xFFFB6B25),
                  backgroundColor: Color.fromRGBO(251, 107, 37, 0.2),
                  nombre: 0,
                  icon: CupertinoIcons.money_dollar_circle_fill,
                  text: "Prix Chambres louées"),
              SizedBox(
                height: Dimensions.height10 * 2,
              ),
              Container(
                padding:
                    EdgeInsets.symmetric(horizontal: Dimensions.width10 * 1.5),
                alignment: Alignment.topLeft,
                child: BigTextWidget(
                  text: "Annonces récemment publiées",
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
              SizedBox(
                height: Dimensions.height10 * 2,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget statistiqueUser({
    required BuildContext context,
    required Color primaryColor,
    required Color backgroundColor,
    required int nombre,
    required IconData icon,
    required String text,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: Dimensions.width10, vertical: Dimensions.height10),
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.width10 * 2, vertical: Dimensions.height10),
      height: Dimensions.height10 * 11,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            color: primaryColor,
            width: Dimensions.height10 / 2,
          ),
        ),
        color: backgroundColor,
        borderRadius: BorderRadius.circular(Dimensions.radius10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: BigTextWidget(
                    text: nombre.toString(),
                    sizeText: Dimensions.fontsize20 * 2,
                    textColor: primaryColor,
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: SimpleTextWidget(
                    textAlign: TextAlign.start,
                    text: text,
                    sizeText: Dimensions.fontsize15,
                    textColor: primaryColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: Dimensions.height10 * 6,
            height: Dimensions.height10 * 6,
            child: Icon(
              Icons.home_outlined,
              color: Colors.white,
              size: Dimensions.small,
            ),
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(Dimensions.screenWidth),
            ),
          ),
        ],
      ),
    );
  }
}
