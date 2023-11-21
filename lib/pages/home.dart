import 'package:conforthourse/colors.dart';
import 'package:conforthourse/widgets/appbar.dart';
import 'package:conforthourse/widgets/big_text.dart';
import 'package:conforthourse/widgets/bottom_navigation.dart';

import 'package:conforthourse/widgets/categorie.dart';
import 'package:conforthourse/widgets/list_temoignage.dart';
import 'package:conforthourse/widgets/location.dart';
import 'package:conforthourse/widgets/simple_text.dart';
import 'package:conforthourse/widgets/title_section.dart';
import 'package:conforthourse/widgets/video_player.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          shadowColor: AppColors.backgroundColor,
          backgroundColor: AppColors.backgroundColor,
          title: AppBarWidget(),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                // Title section
                TitleSectionWidget(
                  firstText: "CATEGORIES",
                  secondText: "Choisissez Votre Catégorie",
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  height: 700,
                  child: GridView.count(
                    primary: false,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.7,
                    padding: const EdgeInsets.all(20),
                    children: [
                      CategorieWidget(
                        icon: Icons.shopify_outlined,
                        text: "Chambres familiales",
                        number: 156,
                      ),
                      CategorieWidget(
                        icon: Icons.shop_two,
                        text: "Chambres",
                        number: 189,
                      ),
                      CategorieWidget(
                        icon: Icons.live_tv_sharp,
                        text: "Boutique",
                        number: 63,
                      ),
                      CategorieWidget(
                        icon: Icons.live_tv_sharp,
                        text: "Appartements",
                        number: 31,
                      ),
                      CategorieWidget(
                        icon: Icons.live_tv_sharp,
                        text: "Bureaux",
                        number: 63,
                      ),
                      CategorieWidget(
                        icon: Icons.live_tv_sharp,
                        text: "Autres",
                        number: 39,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TitleSectionWidget(
                  firstText: "DECOUVREZ NOS LOCATIONS IMMOBILIERES",
                  secondText: "Plonger Dans le Confort",
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 500 * 5.3,
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    itemBuilder: (BuildContext, position) {
                      return LocationWidget(
                        image: 'images/IMG-20231114-WA0018.jpg',
                        localisation: 'Cotonou',
                        description:
                            "*CHICS APPARTEMENTS MEUBLÉS À STE RITA* Disponibles à Ste Rita dans un immeuble moderne, plu ...",
                        price: 800000,
                        typeLocation: 'Appartements',
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                VideoApp(),
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
                SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                  child: BigTextWidget(
                    text: "ConforthOurse",
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
                  child: SimpleTextWidget(
                    text:
                        "ConforthOuse est une destination ultime pour trouer la location immobilière idéale. Notre plateforme offre un large choix de chambres de qualité, un processus facile et sécurisé, ainsi qu'un service client exeptionnel pour répondre à tous vos besoins.",
                    textAlign: TextAlign.justify,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        padding: const EdgeInsets.all(5),
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: AppColors.secondColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.call_outlined,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                      SimpleTextWidget(
                        text: "+229 98 74 14 37",
                        fontWeight: FontWeight.w300,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 10),
                        padding: const EdgeInsets.all(5),
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: AppColors.secondColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.location_on_outlined,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                      SimpleTextWidget(
                        text: "Cotonou, Bénin",
                        fontWeight: FontWeight.w300,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(
                      top: 20, left: 10, right: 10, bottom: 20),
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 10),
                        padding: const EdgeInsets.all(5),
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: AppColors.secondColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.mail_outlined,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                      SimpleTextWidget(
                        text: "contact@affectlac.com",
                        fontWeight: FontWeight.w300,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationWidget());
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
