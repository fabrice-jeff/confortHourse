import 'package:flutter/material.dart';
import 'package:flutter_pagination/flutter_pagination.dart';
import 'package:flutter_pagination/widgets/button_styles.dart';

import '../../../utils/colors.dart';
import '../../../utils/constants.dart';
import '../../../utils/dimensions.dart';
import '../../../components/big_text.dart';
import '../../../components/header_section.dart';
import '../../base/controllers/base_controller.dart';
import 'location_widget.dart';

class LocationByCategoriePage extends StatefulWidget {
  final List<Map<String, dynamic>> locations;
  final String categorie;
  final BaseController? baseController;
  const LocationByCategoriePage(
      {super.key,
      required this.categorie,
      required this.locations,
      this.baseController});

  @override
  State<LocationByCategoriePage> createState() => _LocationByCategorieState();
}

class _LocationByCategorieState extends State<LocationByCategoriePage> {
  int currentPage = 0;
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: AppColors.backgroundColor,
        backgroundColor: AppColors.backgroundColor,
        title: BigTextWidget(
          text: ConstantsValues.appName.toUpperCase(),
          fontWeight: FontWeight.w400,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              HeaderSectionWidget(text: widget.categorie),
              Column(
                children: [
                  Container(
                    height: 530.0 * widget.locations.length,
                    child: PageView.builder(
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: 7,
                      onPageChanged: (index) {
                        setState(() {
                          currentPage = index;
                        });
                      },
                      controller: pageController,
                      itemBuilder: (context, index) {
                        index = currentPage;
                        return Container(
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: widget.locations.length,
                            itemBuilder: (BuildContext context, int position) {
                              var location = widget.locations[position];
                              return LocationWidget(
                                location: location,
                                baseController: widget.baseController,
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: Dimensions.height10,
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
                          // Il faut changer la page View ici
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
            ],
          ),
        ),
      ),
    );
  }
}
