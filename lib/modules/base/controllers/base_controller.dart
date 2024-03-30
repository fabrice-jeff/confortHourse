import 'package:get/get.dart';

import '../../../data/api/api.dart';
import '../../../data/models/categorie.dart';
import '../../../data/models/demarcheur.dart';
import '../../../data/models/pays.dart';
import '../../../data/repository/base_repository.dart';
import '../../../routes/routes.dart';
import '../../../utils/constants.dart';
import '../../../utils/share_preference.dart';

class BaseController extends GetxController {
  int currentIndex = 0;
  Demarcheur? demarcheur;
  String page = ConstantsValues.ADD_ANNONCE;
  List<Categorie> categoriesObjet = [];
  List<String> categoriesArray = [];
  List<Pays> paysObjets = [];
  List<String> paysArray = [];
  final BaseRepository baseRepository = BaseRepository(api: Api.baseUrl);

  @override
  void onInit() {
    getPays();
    getCategories();
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

  /// change the selected screen index
  changeScreen(int selectedIndex) {
    if (selectedIndex == 1) {
      demarcheur = SharePreferences.getActeur();
      // Verifier si l'utilisateur est connecté
      if (demarcheur != null) {
        // On initsialise le controller Demarcheur
        page = ConstantsValues.ADD_ANNONCE;
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
        page = ConstantsValues.PARAMETRES;
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
