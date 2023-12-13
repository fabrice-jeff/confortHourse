import 'package:conforthourse/colors.dart';
import 'package:conforthourse/widgets/big_text.dart';
import 'package:conforthourse/widgets/header_section.dart';
import 'package:conforthourse/widgets/location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pagination/flutter_pagination.dart';
import 'package:flutter_pagination/widgets/button_styles.dart';

class LocationByCategoriePage extends StatefulWidget {
  const LocationByCategoriePage({super.key});

  @override
  State<LocationByCategoriePage> createState() => _LocationByCategorieState();
}

class _LocationByCategorieState extends State<LocationByCategoriePage> {
  int currentPage = 1;
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
              HeaderSectionWidget(text: "CHAMBRE FAMILIALES"),
              Container(
                height: 500 * 5,
                child: PageView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  onPageChanged: (index) {
                    setState(() {
                      currentPage = index + 1;
                    });
                  },
                  itemBuilder: (context, index) {
                    index = currentPage;
                    return Container(
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 10,
                        itemBuilder: (BuildContext, position) {
                          return LocationWidget(
                            image: 'images/IMG-20231114-WA0018.jpg',
                            localisation: 'Cotonou',
                            description:
                                "*CHICS APPARTEMENTS MEUBLÉS À STE RITA* Disponibles à Ste Rita dans un immeuble moderne, plu ...",
                            price: index,
                            typeLocation: 'Appartements',
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: Pagination(
                  width: 200,
                  paginateButtonStyles: PaginateButtonStyles(
                    activeBackgroundColor: AppColors.primaryColor,
                    backgroundColor: AppColors.secondColor,
                  ),
                  prevButtonStyles: PaginateSkipButton(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                    buttonBackgroundColor: AppColors.secondColor,
                  ),
                  nextButtonStyles: PaginateSkipButton(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    buttonBackgroundColor: AppColors.secondColor,
                  ),
                  onPageChange: (number) {
                    setState(() {
                      currentPage = number;
                    });
                  },
                  useGroup: false,
                  totalPage: 7,
                  show: 1,
                  currentPage: currentPage,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
