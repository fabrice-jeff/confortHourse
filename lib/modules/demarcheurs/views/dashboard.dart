import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../data/api/api.dart';
import '../../../data/models/demarcheur.dart';
import '../../../utils/colors.dart';
import '../../../utils/constants.dart';
import '../../../utils/dimensions.dart';
import '../../../widgets/big_text.dart';
import '../../../widgets/header_section.dart';
import '../../../widgets/simple_text.dart';
import '../controllers/annonce_controller.dart';
import 'user_page.dart';

class DashboardView extends GetView<AnnonceController> {
  final Demarcheur? demarcheur;
  const DashboardView({
    super.key,
    this.demarcheur,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  backgroundColor: const Color.fromRGBO(98, 89, 202, 0.2),
                  nombre: controller.totalPublicationByDemarcheur.toString(),
                  icon: Icons.home_outlined,
                  text: "Total Publication"),
              SizedBox(
                height: Dimensions.height10 * 2,
              ),
              statistiqueUser(
                  context: context,
                  primaryColor: const Color(0xFF09AD95),
                  backgroundColor: const Color.fromRGBO(0, 230, 130, 0.2),
                  nombre: controller.totalChambresLouees.toString(),
                  icon: Icons.home_outlined,
                  text: "Chambres louées"),
              SizedBox(
                height: Dimensions.height10 * 2,
              ),
              statistiqueUser(
                  context: context,
                  primaryColor: const Color(0xFFFB6B25),
                  backgroundColor: const Color.fromRGBO(251, 107, 37, 0.2),
                  nombre: controller.prixChambreLouees.toString(),
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
                  text: "Récemment publié",
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
    required String nombre,
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
                Expanded(
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: BigTextWidget(
                      text: nombre.toString(),
                      sizeText: Dimensions.fontsize20 * 2,
                      textColor: primaryColor,
                    ),
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
