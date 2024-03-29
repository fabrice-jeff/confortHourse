import 'dart:convert';

import 'package:get/get.dart';
import '../../../data/api/api.dart';
import '../../../data/models/categorie.dart';
import '../../../data/models/demarcheur.dart';
import '../../../data/models/type_annonce.dart';
import '../../../data/repository/annonceRepository.dart';
import '../../../routes/routes.dart';
import '../../../services/generate_random_file_name.dart';
import '../../../utils/share_preference.dart';

class AnnonceController extends GetxController {
  List<TypeAnnonce> typeObjet = [];
  List<String> typeArray = [];
  List<String> categoriesArray = [];
  List<Categorie> categoriesObjet = [];

  final AnnonceRepository annonceRepository =
      AnnonceRepository(api: Api.baseUrl);

  @override
  void onInit() {
    getTypeAnnonce();
    getCategories();
    super.onInit();
  }

  addAnnonce(data) async {
    Demarcheur? demarcheur = await SharePreferences.getActeur();
    data['filename'] = generateRandomFileName('annonce');
    data['image'] = base64Encode(data['image'].readAsBytesSync());
    data['created_by'] = demarcheur!.id;
    var result = await annonceRepository.addAnnonce(data);
    if (result != null && result['success']) {
      Get.offAllNamed(Routes.base);
    }
  }

  getTypeAnnonce() async {
    var result = await annonceRepository.getTypeAnnonce();
    if (result != null && result['success']) {
      var data = result['datas'];
      if (data != null) {
        for (var type in data) {
          var objet = TypeAnnonce.fromJson(type);
          typeObjet.add(objet);
          typeArray.add(objet.libelle);
        }
      }
    }
  }

  getCategories() async {
    var result = await annonceRepository.getCategories();
    if (result != null && result['success']) {
      var data = result['datas'];
      if (data != null) {
        for (var categorie in data) {
          categorie['categorie']['nombre_annonce'] =
              categorie['nombre_annonce'];
          var objet = Categorie.fromJson(categorie['categorie']);
          categoriesArray.add(objet.libelle);
          categoriesObjet.add(objet);
        }
      }
    }
  }
}
