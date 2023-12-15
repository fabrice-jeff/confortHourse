import 'package:conforthourse/colors.dart';
import 'package:conforthourse/models/location.dart';
import 'package:conforthourse/widgets/big_text.dart';
import 'package:conforthourse/widgets/header_section.dart';
import 'package:conforthourse/widgets/location_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pagination/flutter_pagination.dart';
import 'package:flutter_pagination/widgets/button_styles.dart';

class LocationByCategoriePage extends StatefulWidget {
  final Future<List<Location>> locations;
  final String categorie;
  const LocationByCategoriePage({
    super.key,
    required this.categorie,
    required this.locations,
  });

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
              HeaderSectionWidget(text: widget.categorie),
              FutureBuilder(
                future: widget.locations,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return Container(
                    height: 530 * 2,
                    child: PageView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 2,
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
                            itemCount: 2,
                            itemBuilder: (BuildContext, position) {
                              var location = snapshot.data![position];
                              return LocationWidget(location: location);
                            },
                          ),
                        );
                      },
                    ),
                  );
                },
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
