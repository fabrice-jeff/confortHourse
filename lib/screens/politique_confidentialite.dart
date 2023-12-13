import 'package:conforthourse/colors.dart';
import 'package:conforthourse/widgets/big_text.dart';
import 'package:conforthourse/widgets/header_section.dart';
import 'package:conforthourse/widgets/simple_text.dart';
import 'package:flutter/material.dart';

class PolitiqueConfidentialitePage extends StatelessWidget {
  const PolitiqueConfidentialitePage({super.key});

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
              HeaderSectionWidget(text: "POLITIQUE DE CONFIDENTIALITÉ"),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.topLeft,
                child: BigTextWidget(
                  text: "Objet",
                  sizeText: 26,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                alignment: Alignment.topLeft,
                child: SimpleTextWidget(
                  text:
                      "Infinity s’engage pour la protection de votre vie privée et de vos données personnelles collectées et traitées à l’occasion de votre utilisation du Site (ci après « IHouse.com ») et de la plateforme web ainsi que de ses applications. La présente politique de confidentialité (ci-après la « Politique de Confidentialité ») décrit de quelle manière la startup Infinity utilise vos données personnelles. Elle s’applique dès lors que Infinity traite des données personnelles vous concernant notamment lors de votre navigation sur le Site, avec ou sans abonnement à une offre proposée par Infinity.Cette politique de confidentialité vise à vous exposer de façon transparente la façon dont Loi n° 2009-09 portant protection des données à caractère personnel en République du Bénin,relative à l’informatique, aux fichiers et aux libertés dans sa version modifiée. Au sens de la présente Politique de Confidentialité, l'expression \"donnée à caractère personnel\" signifie : toute information relative à une personne physique identifiée ou susceptible de l’être, directement ou indirectement, par référence à un numéro d’identification ou à un ou plusieurs éléments qui luisont propres. L’identification se fait à partir des moyens dont dispose ou auxquels peut avoir accès, le responsable du traitement ou toute autre personne ; (ci-après « Donnée »).",
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.topLeft,
                child: BigTextWidget(
                  text: "Responsable du traitement des données",
                  sizeText: 26,
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
