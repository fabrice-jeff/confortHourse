import 'package:conforthourse/colors.dart';
import 'package:conforthourse/widgets/big_text.dart';
import 'package:conforthourse/widgets/header_section.dart';
import 'package:conforthourse/widgets/location.dart';
import 'package:conforthourse/widgets/simple_text.dart';
import 'package:conforthourse/widgets/title_section.dart';
import 'package:flutter/material.dart';

class DetailsLocation extends StatelessWidget {
  DetailsLocation({super.key});
  Widget _options(IconData icon) {
    return Container(
      alignment: Alignment.center,
      width: 40,
      height: 40,
      margin: const EdgeInsets.only(right: 15),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.secondColor),
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: AppColors.backgroundColor,
        backgroundColor: AppColors.backgroundColor,
        title: const BigTextWidget(
          text: "ConforthOurse",
          fontWeight: FontWeight.w400,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              HeaderSectionWidget(text: 'DÉTAIL DE LA LOCATION'),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    image: AssetImage("images/IMG-20231210-WA0002.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.topLeft,
                child: const BigTextWidget(text: 'Abomey Calavi'),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  alignment: Alignment.center,
                  width: 100,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.secondColor),
                  child: SimpleTextWidget(
                    text: "Sanitaire",
                    textColor: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.topLeft,
                child: SimpleTextWidget(
                  text: "30.000 FCFA",
                  fontWeight: FontWeight.bold,
                  sizeText: 25,
                  textColor: AppColors.secondColor,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.topLeft,
                child: Row(
                  children: [
                    _options(
                      Icons.share_outlined,
                    ),
                    _options(
                      Icons.print_outlined,
                    ),
                    _options(
                      Icons.favorite_outline,
                    ),
                    _options(
                      Icons.repeat_rounded,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: const BigTextWidget(
                        text: "Description",
                        textAlign: TextAlign.start,
                      ),
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: SimpleTextWidget(
                          text:
                              "Disponible immédiatement à Houega non loin de AGOUALAND, une chambre salon sanitaire propre avec douche et cuisine séparées. Accès véhicule, portail toujours fermé. Loyer mensuel : 25.000f Conditions: 03 mois d'avance 01 mois prépayé 01 mois commission Caution Électricité 30.000f Caution Eau: Gratuite (forage) 📲 : 40 38 99 10 appel et WhatsApp"),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: const BigTextWidget(
                        text: "Votre décision",
                        textAlign: TextAlign.start,
                      ),
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll<Color>(
                              AppColors.secondColor),
                        ),
                        child: SimpleTextWidget(
                          text: "Je suis interressé",
                          textColor: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: const BigTextWidget(
                        text: "Contact de l'Agent",
                        textAlign: TextAlign.start,
                      ),
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Row(
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 2.8, color: AppColors.secondColor),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Container(
                              height: double.maxFinite,
                              width: double.maxFinite,
                              margin: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(45),
                                image: DecorationImage(
                                    image: AssetImage("images/user.webp"),
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 18,
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      alignment: Alignment.topLeft,
                                      child: BigTextWidget(
                                        text: "ConforthOurse",
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      height: 18,
                                      width: 18,
                                      decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.circular(9),
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 0.4,
                                            spreadRadius: 0.4,
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.phone_outlined,
                                      color: AppColors.secondColor,
                                      size: 18,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      alignment: Alignment.topLeft,
                                      child: SimpleTextWidget(
                                        text: "Télephone",
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.email_outlined,
                                      color: AppColors.secondColor,
                                      size: 18,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      alignment: Alignment.topLeft,
                                      child: SimpleTextWidget(
                                        text: "Email",
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 100,
              ),
              TitleSectionWidget(
                  firstText: "ANNONCES SIMILAIRES",
                  secondText: "Découvrez les Annonces Similaires"),
              SizedBox(
                height: 20,
              ),
              Container(
                child: ListView.builder(
                  shrinkWrap: true,
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
              InkWell(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.secondColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 60),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: BigTextWidget(
                    text: "Voir PLus De Chambres Familiales",
                    textColor: Colors.white,
                    sizeText: 16,
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
