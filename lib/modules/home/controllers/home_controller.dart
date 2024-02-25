import 'package:get/get.dart';

import '../../../data/api/api.dart';
import '../../../data/models/Fichier.dart';
import '../../../data/models/annonce.dart';
import '../../../data/models/categorie.dart';
import '../../../data/repository/annonceRepository.dart';

class HomeController extends GetxController {
  List<Categorie> categoriesObjet = [];
  final AnnonceRepository annonceRepository =
      AnnonceRepository(api: Api.baseUrl);

  @override
  void onInit() {
    getCategories();
    super.onInit();
  }

  getCategories() async {
    var result = await annonceRepository.getCategories();
    if (result != null && result['success']) {
      var data = result['datas'];
      for (var categorie in data) {
        categorie['categorie']['nombre_annonce'] = categorie['nombre_annonce'];
        var objet = Categorie.fromJson(categorie['categorie']);
        categoriesObjet.add(objet);
      }
    }
    update();
  }

  Future<List<Map<String, dynamic>>> getAnnonceByCategorie(
      Map<String, dynamic> data) async {
    var result = await annonceRepository.getAnnonceByCategorie(data);
    List<Map<String, dynamic>> annonceArray = [];
    if (result != null && result['success']) {
      for (var element in result['datas']) {
        late Map<String, dynamic> annonce;
        List<Fichier> fichiers = [];

        // Récuperer l'ensemble des fichiers
        for (var fichier in element['fichier']) {
          Fichier fichierObjet = Fichier.fromJson(fichier);
          fichiers.add(fichierObjet);
        }
        // Récuprer l'ensemble des annonces
        element['ville']['pays'] = element['pays'];
        element['annonce']['type_annonce'] = element['type_annonce'];
        element['annonce']['ville'] = element['ville'];
        element['annonce']['categorie'] = element['categorie'];
        Annonce annonceObjet = Annonce.fromJson(element['annonce']);
        annonce = {'annonce': annonceObjet, 'fichiers': fichiers};
        annonceArray.add(annonce);
      }
    }
    return annonceArray;
  }
}
