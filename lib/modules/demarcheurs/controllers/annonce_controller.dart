import 'dart:convert';

import 'package:conforthourse/data/models/demarcheur.dart';
import 'package:conforthourse/utils/share_preference.dart';
import 'package:get/get.dart';

import '../../../data/api/api.dart';
import '../../../data/models/categorie.dart';
import '../../../data/models/type_type.dart';
import '../../../data/models/ville.dart';
import '../../../data/repository/annonceRepository.dart';
import '../../../routes/routes.dart';
import '../../../services/generate_random_file_name.dart';

class AnnonceController extends GetxController {
  List<TypeType> typeObjet = [];
  List<String> typeArray = [];
  List<Ville> localisatioObjet = [];
  List<String> localisationArray = [];
  List<String> categoriesArray = [];
  List<Categorie> categoriesObjet = [];

  final AnnonceRepository annonceRepository =
      AnnonceRepository(api: Api.baseUrl);

  @override
  void onInit() {
    getTypeAnnonce();
    getCategories();
    getLocalisation();
    super.onInit();
  }

  addAnnonce(data) async {
    Demarcheur? demarcheur = await SharePreferences.getActeur();
    data['filename'] = generateRandomFileName('annonce');
    data['image'] = base64Encode(data['image'].readAsBytesSync());
    data['created_by'] = demarcheur!.user.code;
    var result = await annonceRepository.addAnnonce(data);
    if (result != null && result['success']) {
      Get.offAllNamed(Routes.base);
    }
  }

  getTypeAnnonce() async {
    var result = await annonceRepository.getTypeAnnonce();
    if (result != null && result['success']) {
      var data = result['datas'];
      for (var type in data) {
        var objet = TypeType.fromJson(type);
        typeObjet.add(objet);
        typeArray.add(objet.libelle);
      }
    }
  }

  getCategories() async {
    var result = await annonceRepository.getCategories();
    if (result != null && result['success']) {
      var data = result['datas'];
      for (var categorie in data) {
        categorie['categorie']['nombre_annonce'] = categorie['nombre_annonce'];
        var objet = Categorie.fromJson(categorie['categorie']);
        categoriesArray.add(objet.libelle);
        categoriesObjet.add(objet);
      }
    }
  }

  getLocalisation() async {
    var result = await annonceRepository.getLocalisation();
    if (result != null && result['success']) {
      var data = result['datas'];
      for (var ville in data) {
        ville['ville']['pays'] = ville['pays'];
        var objet = Ville.fromJson(ville['ville']);
        localisatioObjet.add(objet);
        localisationArray.add(objet.libelle);
      }
    }
  }
}
