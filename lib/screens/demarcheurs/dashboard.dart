import 'package:conforthourse/colors.dart';
import 'package:conforthourse/screens/demarcheurs/user_page.dart';
import 'package:conforthourse/widgets/big_text.dart';
import 'package:conforthourse/widgets/simple_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

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
              UserPage(
                headerTitle: "DASHBOARD",
              ),
              SizedBox(
                height: 20,
              ),
              statistiqueUser(
                  context: context,
                  primaryColor: const Color(0xFF6259CA),
                  backgroundColor: Color.fromRGBO(98, 89, 202, 0.2),
                  nombre: 0,
                  icon: Icons.home_outlined,
                  text: "Total Publication"),
              SizedBox(
                height: 20,
              ),
              statistiqueUser(
                  context: context,
                  primaryColor: Color(0xFF09AD95),
                  backgroundColor: Color.fromRGBO(0, 230, 130, 0.2),
                  nombre: 0,
                  icon: Icons.home_outlined,
                  text: "Chambres louées"),
              SizedBox(
                height: 20,
              ),
              statistiqueUser(
                  context: context,
                  primaryColor: Color(0xFFFB6B25),
                  backgroundColor: Color.fromRGBO(251, 107, 37, 0.2),
                  nombre: 0,
                  icon: CupertinoIcons.money_dollar_circle_fill,
                  text: "Prix Chambres louées"),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.topLeft,
                child: BigTextWidget(text: "Récemment publié"),
              ),
              // Tableau
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
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
              SizedBox(
                height: 20,
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
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            color: primaryColor,
            width: 6,
          ),
        ),
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
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
                    sizeText: 50,
                    textColor: primaryColor,
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: SimpleTextWidget(
                    textAlign: TextAlign.start,
                    text: text,
                    sizeText: 15,
                    textColor: primaryColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 60,
            height: 60,
            child: Icon(
              Icons.home_outlined,
              color: Colors.white,
              size: 40,
            ),
            decoration: BoxDecoration(
                color: primaryColor, borderRadius: BorderRadius.circular(30)),
          ),
        ],
      ),
    );
  }
}
