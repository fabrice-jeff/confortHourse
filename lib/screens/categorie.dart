import 'package:conforthourse/colors.dart';
import 'package:conforthourse/widgets/big_text.dart';
import 'package:conforthourse/widgets/categorie.dart';
import 'package:conforthourse/widgets/header_section.dart';
import 'package:flutter/material.dart';

class CategorieLocation {
  CategorieLocation();
}

List<CategorieLocation> categoriesLocations = [];

class CategoriePage extends StatelessWidget {
  const CategoriePage({super.key});

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
              HeaderSectionWidget(text: "CATÉGORIES"),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                child: Container(
                  width: double.infinity,
                  child: GridView.builder(
                    primary: false,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      mainAxisExtent: 215,
                    ),
                    itemCount: 12,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {},
                        child: CategorieWidget(
                          icon: Icons.shopify_outlined,
                          text: "Chambres familiales",
                          number: 156,
                        ),
                      );
                    },
                    padding: const EdgeInsets.all(20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
