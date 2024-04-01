import 'package:get/get.dart';

import '../../../data/api/api.dart';
import '../../../data/models/annonce.dart';
import '../../../data/models/categorie.dart';
import '../../../data/models/demarcheur.dart';
import '../../../data/models/fichier.dart';
import '../../../data/models/pays.dart';
import '../../../data/models/type_annonce.dart';
import '../../../data/repository/annonce_repository.dart';
import '../../../data/repository/base_repository.dart';
import '../../../routes/routes.dart';
import '../../../utils/constants.dart';
import '../../../utils/share_preference.dart';

class BaseController extends GetxController {
  int currentIndex = 0;
  Demarcheur? demarcheur;
  String page = ConstantsValues.addAnnonces;
  List<Categorie> categoriesObjet = [];
  List<String> categoriesArray = [];
  List<Pays> paysObjets = [];
  List<String> paysArray = [];
  final BaseRepository baseRepository = BaseRepository(api: Api.baseUrlApi);
  final AnnonceRepository annonceRepository =
      AnnonceRepository(api: Api.baseUrlApi);
  List<TypeAnnonce> typeObjet = [];
  List<String> typeArray = [];

  @override
  void onInit() {
    getPays();
    getCategories();
    getTypeAnnonce();
    super.onInit();
  }

  // Get categorie
  getCategories() async {
    var result = await baseRepository.getCategories();
    if (result != null && result['success']) {
      var data = result['datas'];
      if (data != null) {
        for (var categorie in data) {
          var objet = Categorie.fromJson(categorie);
          categoriesObjet.add(objet);
          categoriesArray.add(objet.libelle);
        }
      }
    }
    update();
  }

  getPays() async {
    var result = await baseRepository.getPays();
    if (result != null && result['success']) {
      var data = result['datas'];
      for (var pays in data) {
        var objet = Pays.fromJson(pays);
        paysObjets.add(objet);
        paysArray.add(objet.libelle);
      }
    }
    update();
  }

  //Récupération des type d'annonce
  getTypeAnnonce() async {
    var result = await baseRepository.getTypeAnnonce();
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

  /// change the selected screen index
  changeScreen(int selectedIndex) {
    if (selectedIndex == 1) {
      demarcheur = SharePreferences.getActeur();
      // Verifier si l'utilisateur est connecté
      if (demarcheur != null) {
        // On initsialise le controller Demarcheur
        page = ConstantsValues.addAnnonces;
        currentIndex = selectedIndex;
      } else {
        BaseController baseController = Get.put(BaseController());
        Get.toNamed(Routes.login,
            arguments: {'baseController': baseController});
      }
    } else if (selectedIndex == 2) {
      demarcheur = SharePreferences.getActeur();
      // Verifier si l'utilisateur est connecté
      if (demarcheur != null) {
        // On initsialise le controller Demarcheur
        page = ConstantsValues.parametres;
        currentIndex = selectedIndex;
      } else {
        BaseController baseController = Get.put(BaseController());
        Get.toNamed(Routes.login,
            arguments: {'baseController': baseController});
      }
    } else {
      currentIndex = selectedIndex;
    }
    update();
  }

  changePage(String value) {
    page = value;
    update();
  }

  logout() {
    demarcheur = null;
    SharePreferences.prefs.remove('acteur');
    SharePreferences.prefs.clear();
    currentIndex = 0;
    update();
  }
}
