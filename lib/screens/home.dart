import 'package:conforthourse/colors.dart';
import 'package:conforthourse/controllers/categorie_controller.dart';
import 'package:conforthourse/controllers/location_controller.dart';
import 'package:conforthourse/dimensions.dart';
import 'package:conforthourse/models/categorie.dart';
import 'package:conforthourse/models/location.dart';
import 'package:conforthourse/providers/user_login.dart';
import 'package:conforthourse/screens/location_by_categorie.dart';
import 'package:conforthourse/screens/menu.dart';
import 'package:conforthourse/widgets/big_text.dart';
import 'package:conforthourse/widgets/bottom_navigation.dart';
import 'package:conforthourse/widgets/categorie_widget.dart';
import 'package:conforthourse/widgets/list_temoignage.dart';
import 'package:conforthourse/widgets/location_widget.dart';
import 'package:conforthourse/widgets/simple_text.dart';
import 'package:conforthourse/widgets/title_section.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late var locations;
  late Future<List<Categorie>> categories;

  @override
  void initState() {
    super.initState();
    locations = LocationController.all();
    categories = CategorieController.all();
  }

  @override
  Widget build(BuildContext context) {
    var user = context.watch<UserLogin>().email;
    print(MediaQuery.of(context).size.height);
    print(MediaQuery.of(context).size.width);

    return Scaffold(
      appBar: AppBar(
        shadowColor: AppColors.backgroundColor,
        elevation: 4.5,
        title: BigTextWidget(
          text: "ConforthOurse",
          sizeText: Dimensions.fontsize20,
          fontWeight: FontWeight.w400,
        ),
        actions: [
          IconButton(
            onPressed: () {
              //Allez vers le menu
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return MenuPage();
                  },
                ),
              );
            },
            icon: Icon(
              Icons.menu,
              size: Dimensions.small,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: Dimensions.height10,
              ),
              // Title
              TitleSectionWidget(
                firstText: "CATÉGORIES",
                secondText: "Choisissez Votre Catégorie",
              ),
              SizedBox(
                height: Dimensions.height10,
              ),
              FutureBuilder<List<Categorie>>(
                future: categories,
                builder: (context, AsyncSnapshot<List<Categorie>> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
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
                        crossAxisSpacing: Dimensions.height10,
                        mainAxisSpacing: Dimensions.width10,
                        mainAxisExtent: 215,
                      ),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        var categorie = snapshot.data![index];

                        return InkWell(
                          onTap: () {
                            // Affiche la page de l'ensemble des locations pour  une catégorie donnée
                            var locationsByCategorie =
                                LocationController.allByCategorie(categorie.id);
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return LocationByCategoriePage(
                                  categorie: categorie.titre,
                                  locations: locationsByCategorie,
                                );
                              },
                            ));
                          },
                          child: CategorieWidget(
                            categorie: categorie,
                          ),
                        );
                      },
                      padding: EdgeInsets.symmetric(
                          horizontal: Dimensions.width10,
                          vertical: Dimensions.height10),
                    ),
                  );
                },
              ),
              SizedBox(
                height: Dimensions.height10,
              ),
              TitleSectionWidget(
                firstText: "DÉCOUVREZ NOS LOCATIONS IMMOBILIÈRE",
                secondText: "Plongez Dans Le Confort",
              ),
              SizedBox(
                height: Dimensions.height10,
              ),
              Container(
                child: FutureBuilder<List<Location>>(
                  future: locations,
                  builder: (context, AsyncSnapshot<List<Location>> snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (BuildContext, i) {
                        var location = snapshot.data![i];
                        return LocationWidget(
                          location: location,
                        );
                      },
                    );
                  },
                ),
              ),
              SizedBox(
                height: Dimensions.height10,
              ),
              // VideoApp(),
              TitleSectionWidget(
                firstText: "CONFORTHOUSE",
                secondText: "Pourquoi Nous choisir",
              ),
              Container(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 3,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext, position) {
                    return _listReasons(context);
                  },
                ),
              ),
              SizedBox(
                height: Dimensions.height10,
              ),
              Container(
                padding: EdgeInsets.only(
                  left: Dimensions.width10,
                  right: Dimensions.width10,
                  top: Dimensions.height10,
                  bottom: Dimensions.height10 * 4,
                ),
                alignment: Alignment.center,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFF022956),
                ),
                child: Column(
                  children: [
                    Container(
                      child: TitleSectionWidget(
                        firstText: "TEMOIGNAGES",
                        secondText: "Ce Que Nos Clients Disent",
                        colorSecondText: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    Container(
                      height: Dimensions.heightTemoignage,
                      child: const ListTemoignage(),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }

  Widget _listReasons(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(
          horizontal: Dimensions.width10, vertical: Dimensions.height10 * 1.5),
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.width10, vertical: Dimensions.height10 * 1.5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Dimensions.radius10),
      ),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: Dimensions.height10 * 2),
            child: Icon(
              Icons.location_city,
              color: AppColors.secondColor,
              size: Dimensions.large,
            ),
          ),
          SizedBox(
            height: Dimensions.height10,
          ),
          BigTextWidget(
            text: "Large sélection de chambres",
            sizeText: Dimensions.fontsize20,
          ),
          SizedBox(
            height: Dimensions.height10,
          ),
          SimpleTextWidget(
            text:
                "Découvrez une vaste sélection de chambres à louer, soigneusement publiées par nos agents immobiliers partenaires, pour trouver celle qui correspond parfaitement à vos besoins.",
            textAlign: TextAlign.center,
            sizeText: Dimensions.fontsize15,
          ),
        ],
      ),
    );
  }
}
