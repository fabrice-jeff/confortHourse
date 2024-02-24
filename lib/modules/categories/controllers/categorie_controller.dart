import 'package:get/get.dart';

import '../../../data/models/categorie.dart';

class CategorieController extends GetxController {
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
}
