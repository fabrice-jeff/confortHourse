import 'package:conforthourse/data/models/location.dart';
import 'package:get/get.dart';

import '../../../data/models/categorie.dart';

class HomeController extends GetxController {
  List categories = [
    Categorie(
      id: 1,
      titre: "Chambres familiales",
      icon: 'hourse',
      nombreLocation: 23,
    ),
    Categorie(
      id: 1,
      titre: "Chambres Etudiantes",
      icon: 'hourse',
      nombreLocation: 23,
    ),
    Categorie(
      id: 1,
      titre: "Boutiques",
      icon: 'hourse',
      nombreLocation: 23,
    ),
    Categorie(
      id: 1,
      titre: "Appartement",
      icon: 'hourse',
      nombreLocation: 23,
    ),
    Categorie(
      id: 1,
      titre: "Bureaux",
      icon: 'hourse',
      nombreLocation: 23,
    ),
  ];

  List<Location> locations = [
    Location(
      id: 1,
      code: "GHDF8978UJGH",
      localisation: "Cotonou",
      description:
          "Disponible à houèto Commissariat Sbee  personnel à carte Une Chambre salon sanitaire sans couloir nouvelle construction à  30.000 y compris frais d'eau 7 ménages Douche et WC visiteur Avance : 3 + 1 mois prépayé caution courant 20 mille",
      photo: "03.jpg",
      prix: 200,
      pays: "BENIN",
      type: "Sanitaire",
      categorie: "Chambre familiale",
      status: false,
      louer: true,
      idCategorie: 1,
    )
  ];
  @override
  void onInit() {
    super.onInit();
  }
}
