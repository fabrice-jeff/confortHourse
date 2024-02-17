import 'package:conforthourse/utils/colors.dart';
import 'package:conforthourse/controllers/categorie_controller.dart';
import 'package:conforthourse/controllers/location_controller.dart';
import 'package:conforthourse/utils/dimensions.dart';
import 'package:conforthourse/data/models/categorie.dart';
import 'package:conforthourse/views/location_by_categorie.dart';
import 'package:conforthourse/widgets/big_text.dart';
import 'package:conforthourse/modules/home/views/categorie_widget.dart';
import 'package:conforthourse/widgets/header_section.dart';
import 'package:conforthourse/widgets/simple_text.dart';
import 'package:flutter/material.dart';

Future<List<Categorie>> _categories = CategorieController.all();

class CategoriePage extends StatelessWidget {
  CategoriePage({super.key});
  final Future<List<Categorie>> _categories = CategorieController.all();

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
                height: Dimensions.height10 * 2,
              ),
              FutureBuilder<List<Categorie>>(
                future: _categories,
                builder: (context, AsyncSnapshot<List<Categorie>> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.data!.isEmpty) {
                    return Center(
                      child: SimpleTextWidget(text: "Aucune catégorie"),
                    );
                  }
                  return Container(
                    width: double.infinity,
                    child: GridView.builder(
                      primary: false,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: Dimensions.width10,
                        mainAxisSpacing: Dimensions.height10,
                        mainAxisExtent: 215,
                      ),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        var categorie = snapshot.data![index];

                        return InkWell(
                          onTap: () {
                            // Affiche la page de l'ensemble des locations pour  une catégorie donnée
                            // var locationsByCategorie =
                            //     LocationController.allByCategorie(categorie.id);
                            // Navigator.push(context, MaterialPageRoute(
                            //   builder: (context) {
                            //     return LocationByCategoriePage(
                            //       categorie: categorie.titre,
                            //       locations: locationsByCategorie,
                            //     );
                            //   },
                            // ));
                          },
                          child: CategorieWidget(
                            categorie: categorie,
                          ),
                        );
                      },
                      padding: EdgeInsets.symmetric(
                        vertical: Dimensions.height10 * 2,
                        horizontal: Dimensions.width10 * 2,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
