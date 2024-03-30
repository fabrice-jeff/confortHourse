import 'package:get/get.dart';

import '../../../data/api/api.dart';
import '../../../data/models/annonce.dart';

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
    var result = await annonceRepository.getAnnonceByCategorie(data);
    List<Map<String, dynamic>> annonceArray = [];
    if (result != null && result['success']) {
      for (var element in result['datas']) {
        late Map<String, dynamic> annonce;
        // List<Fichier> fichiers = [];

        // // Récuperer l'ensemble des fichiers
        // for (var fichier in element['fichier']) {
        //   Fichier fichierObjet = Fichier.fromJson(fichier);
        //   fichiers.add(fichierObjet);
        // }
        // Récuprer l'ensemble des annonces
        element['ville']['pays'] = element['pays'];
        element['annonce']['type_annonce'] = element['type_annonce'];
        element['annonce']['ville'] = element['ville'];
        element['annonce']['categorie'] = element['categorie'];
        Annonce annonceObjet = Annonce.fromJson(element['annonce']);
        annonce = {'annonce': annonceObjet, 'fichiers': "fichiers"};
        annonceArray.add(annonce);
      }
    }
    return annonceArray;
  }

  Future<List<Map<String, dynamic>>> getOtherAnnonceByCategorie(
      Map<String, dynamic> data) async {
    var result = await annonceRepository.getOtherAnnonceByCategorie(data);
    List<Map<String, dynamic>> annonceArray = [];
    if (result != null && result['success']) {
      for (var element in result['datas']) {
        late Map<String, dynamic> annonce;
        // List<Fichier> fichiers = [];

        // // Récuperer l'ensemble des fichiers
        // for (var fichier in element['fichier']) {
        //   Fichier fichierObjet = Fichier.fromJson(fichier);
        //   fichiers.add(fichierObjet);
        // }
        // Récuprer l'ensemble des annonces
        element['ville']['pays'] = element['pays'];
        element['annonce']['type_annonce'] = element['type_annonce'];
        element['annonce']['ville'] = element['ville'];
        element['annonce']['categorie'] = element['categorie'];
        Annonce annonceObjet = Annonce.fromJson(element['annonce']);
        annonce = {'annonce': annonceObjet, 'fichiers': "fichiers"};
        annonceArray.add(annonce);
      }
    }
    return annonceArray;
  }
}
