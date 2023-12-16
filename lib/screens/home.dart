import 'package:conforthourse/colors.dart';
import 'package:conforthourse/controllers/categorie_controller.dart';
import 'package:conforthourse/controllers/location_controller.dart';
import 'package:conforthourse/models/categorie.dart';
import 'package:conforthourse/models/location.dart';
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
    // TODO: implement initState
    super.initState();
    locations = LocationController.all();
    categories = CategorieController.all();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: AppColors.backgroundColor,
        elevation: 4.5,
        title: BigTextWidget(
          text: "ConforthOurse",
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
            icon: Icon(Icons.menu),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              // Title
              TitleSectionWidget(
                firstText: "CATÉGORIES",
                secondText: "Choisissez Votre Catégorie",
              ),
              SizedBox(
                height: 10,
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
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
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
                      padding: const EdgeInsets.all(20),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 20,
              ),
              TitleSectionWidget(
                firstText: "DÉCOUVREZ NOS LOCATIONS IMMOBILIÈRE",
                secondText: "Plongez Dans Le Confort",
              ),
              SizedBox(
                height: 10,
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
                height: 20,
              ),
              // VideoApp(),
              TitleSectionWidget(
                firstText: "CONFORTHOUSE",
                secondText: "Pourquoi Nous choisir",
              ),
              Container(
                height: 400 * 3.3,
                child: ListView.builder(
                  itemCount: 3,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext, position) {
                    return _listReasons(context);
                  },
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: 850,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFF022956),
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 30, bottom: 20),
                      child: TitleSectionWidget(
                        firstText: "TEMOIGNAGES",
                        secondText: "Ce Que Nos Clients Disent",
                        colorSecondText: Colors.white,
                      ),
                    ),
                    Container(
                      height: 350,
                      child: const ListTemoignage(),
                    )
                  ],
                ),
              ),
              // SizedBox(
              //   height: 10,
              // ),
              // Container(
              //   alignment: Alignment.topLeft,
              //   padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
              //   child: BigTextWidget(
              //     text: "ConforthOurse",
              //     textAlign: TextAlign.left,
              //   ),
              // ),
              // Container(
              //   padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
              //   child: SimpleTextWidget(
              //     text:
              //         "ConforthOuse est une destination ultime pour trouer la location immobilière idéale. Notre plateforme offre un large choix de chambres de qualité, un processus facile et sécurisé, ainsi qu'un service client exeptionnel pour répondre à tous vos besoins.",
              //     textAlign: TextAlign.justify,
              //     fontWeight: FontWeight.w300,
              //   ),
              // ),
              // Container(
              //   padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
              //   child: Row(
              //     children: [
              //       Container(
              //         margin: EdgeInsets.only(right: 10),
              //         padding: const EdgeInsets.all(5),
              //         height: 30,
              //         width: 30,
              //         decoration: BoxDecoration(
              //           color: AppColors.secondColor,
              //           borderRadius: BorderRadius.circular(10),
              //         ),
              //         child: const Icon(
              //           Icons.call_outlined,
              //           color: Colors.white,
              //           size: 20,
              //         ),
              //       ),
              //       SimpleTextWidget(
              //         text: "+229 98 74 14 37",
              //         fontWeight: FontWeight.w300,
              //       ),
              //     ],
              //   ),
              // ),
              // Container(
              //   padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
              //   child: Row(
              //     children: [
              //       Container(
              //         margin: const EdgeInsets.only(right: 10),
              //         padding: const EdgeInsets.all(5),
              //         height: 30,
              //         width: 30,
              //         decoration: BoxDecoration(
              //           color: AppColors.secondColor,
              //           borderRadius: BorderRadius.circular(10),
              //         ),
              //         child: const Icon(
              //           Icons.location_on_outlined,
              //           color: Colors.white,
              //           size: 20,
              //         ),
              //       ),
              //       SimpleTextWidget(
              //         text: "Cotonou, Bénin",
              //         fontWeight: FontWeight.w300,
              //       ),
              //     ],
              //   ),
              // ),
              // Container(
              //   padding: const EdgeInsets.only(
              //       top: 20, left: 10, right: 10, bottom: 20),
              //   child: Row(
              //     children: [
              //       Container(
              //         margin: const EdgeInsets.only(right: 10),
              //         padding: const EdgeInsets.all(5),
              //         height: 30,
              //         width: 30,
              //         decoration: BoxDecoration(
              //           color: AppColors.secondColor,
              //           borderRadius: BorderRadius.circular(10),
              //         ),
              //         child: const Icon(
              //           Icons.mail_outlined,
              //           color: Colors.white,
              //           size: 20,
              //         ),
              //       ),
              //       SimpleTextWidget(
              //         text: "contact@affectlac.com",
              //         fontWeight: FontWeight.w300,
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationWidget(),
    );
  }

  Widget _listReasons(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      padding: const EdgeInsets.all(10),
      height: 400,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(top: 20),
            child: Icon(
              Icons.location_city,
              color: AppColors.secondColor,
              size: 80,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          BigTextWidget(
            text: "Large sélection de chambres",
            sizeText: 20,
          ),
          SizedBox(
            height: 10,
          ),
          SimpleTextWidget(
            text:
                "Découvrez une vaste sélection de chambres à louer, soigneusement publiées par nos agents immobiliers partenaires, pour trouver celle qui correspond parfaitement à vos besoins.",
            textAlign: TextAlign.center,
            sizeText: 16,
          ),
        ],
      ),
    );
  }
}
