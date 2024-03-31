import 'dart:convert';

import 'package:get/get.dart';
import '../../../data/api/api.dart';

import '../../../data/models/annonce.dart';
import '../../../data/models/fichier.dart';
import '../../../data/repository/annonce_repository.dart';
import '../../../routes/routes.dart';
import '../../../services/generate_random_file_name.dart';

class AnnonceController extends GetxController {
  final AnnonceRepository annonceRepository =
      AnnonceRepository(api: Api.baseUrl);
  int totalPublicationByDemarcheur = 0;
  int totalChambresLouees = 0;
  int prixChambreLouees = 0;
  List<dynamic> recentsPublicaation = [];

  addAnnonce(data) async {
    data['filename'] = generateRandomFileName('annonce');
    data['image'] = base64Encode(data['image'].readAsBytesSync());
    var result = await annonceRepository.addAnnonce(data);

    if (result != null && result['success']) {
      Get.offAllNamed(Routes.base);
    } else {
      // A faire Echec lors de l'ajout d'une annonce
      print(result);
    }
    getTotalPublicationByDemarcheur();
    getRecentsPublicationByDemarcheur();
    update();
  }

  getTotalPublicationByDemarcheur() async {
    var result = await annonceRepository.totalPublication();
    if (result != null) {
      totalPublicationByDemarcheur = result['datas']['total_publication'];
      totalChambresLouees = result['datas']['total_chambres_louees'];
      prixChambreLouees = result['datas']['prix_chambres_louees'];
    }
    update();
  }

  getRecentsPublicationByDemarcheur() async {
    recentsPublicaation = [];
    var result = await annonceRepository.recentsPublication();
    if (result != null) {
      var data = result['datas'];
      for (var element in data) {
        element['annonce']['categorie_id'] = element['categorie'];
        element['annonce']['type_annonce_id'] = element['type_annonce'];
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
        recentsPublicaation.add(objet);
      }
      print(recentsPublicaation.length);
    }
    update();
  }
}
