import 'package:get/get.dart';

import '../../../data/api/api.dart';
import '../../../data/models/annonce.dart';

import '../../../data/models/fichier.dart';
import '../../../data/repository/annonce_repository.dart';

class HomeController extends GetxController {
  List<Map<String, dynamic>> annonceBylimite = [];
  final AnnonceRepository annonceRepository =
      AnnonceRepository(api: Api.baseUrl);

  @override
  void onInit() {
    getAnnonceByLimite();
    super.onInit();
  }

  // Get annonce by  limite
  getAnnonceByLimite() async {
    var result = await annonceRepository.getAnnonceByLimite({'nombre': "5"});

    if (result != null && result['success']) {
      for (var element in result['datas']) {
        late Map<String, dynamic> annonce;

        // Récuprer l'ensemble des annonces
        element['ville']['pays'] = element['pays'];
        element['annonce']['type_annonce'] = element['type_annonce'];
        element['annonce']['ville'] = element['ville'];
        element['annonce']['categorie'] = element['categorie'];
        Annonce annonceObjet = Annonce.fromJson(element['annonce']);
        annonce = {'annonce': annonceObjet, 'fichiers': "fichiers"};
        annonceBylimite.add(annonce);
      }
    }
    update();
  }

  Future<List<Map<String, dynamic>>> getAnnonceByCategorie(
      Map<String, dynamic> data) async {
    List<Map<String, dynamic>> annoncesByCategorie = [];
    var result = await annonceRepository.getAnnonceByCategorie(data);
    if (result != null) {
      var data = result['datas'];
      for (var element in data) {
        element['annonce']['categorie_id'] = element['categorie'];
        element['annonce']['type_annonce_id'] = element['type_annonce'];
        element['annonce']['demarcheur_id'] = element['demarcheur'];
        element['annonce']['demarcheur_id']['pays_id'] =
            element['pays_demarcheur'];
        //Créer  une instance d'annonce
        Annonce annonce = Annonce.fromJson(element['annonce']);
        List<Fichier> fichiers = [];
        // créer les instances d'objet
        for (var value in element['fichiers']) {
          Fichier fichier = Fichier.fromJson(value);
          fichiers.add(fichier);
        }
        Map<String, dynamic> objet = {
          'annonce': annonce,
          'fichiers': fichiers,
        };
        annoncesByCategorie.add(objet);
      }
    }
    return annoncesByCategorie;
  }

  Future<List<Map<String, dynamic>>> getAnnonceSimulaireByCategorie(
      Map<String, dynamic> data) async {
    List<Map<String, dynamic>> annonceSimularsByCategorie = [];
    var result = await annonceRepository.getAnnonceSimulaireByCategorie(data);
    if (result != null) {
      var data = result['datas'];
      for (var element in data) {
        element['annonce']['categorie_id'] = element['categorie'];
        element['annonce']['type_annonce_id'] = element['type_annonce'];
        element['annonce']['demarcheur_id'] = element['demarcheur'];
        element['annonce']['demarcheur_id']['pays_id'] =
            element['pays_demarcheur'];
        //Créer  une instance d'annonce
        Annonce annonce = Annonce.fromJson(element['annonce']);
        List<Fichier> fichiers = [];
        // créer les instances d'objet
        for (var value in element['fichiers']) {
          Fichier fichier = Fichier.fromJson(value);
          fichiers.add(fichier);
        }
        Map<String, dynamic> objet = {
          'annonce': annonce,
          'fichiers': fichiers,
        };
        annonceSimularsByCategorie.add(objet);
      }
    }
    return annonceSimularsByCategorie;
  }
}
