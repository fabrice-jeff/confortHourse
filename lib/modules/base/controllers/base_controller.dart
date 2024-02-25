import 'package:conforthourse/utils/constants.dart';
import 'package:get/get.dart';

import '../../../data/models/demarcheur.dart';
import '../../../routes/routes.dart';
import '../../../utils/share_preference.dart';

class BaseController extends GetxController {
  int currentIndex = 0;
  Demarcheur? demarcheur;
  String page = ConstantsValues.ADD_ANNONCE;

  /// change the selected screen index
  changeScreen(int selectedIndex) {
    if (selectedIndex == 1) {
      demarcheur = SharePreferences.getActeur();
      // Verifier si l'utilisateur est connecté
      if (demarcheur != null) {
        // On initsialise le controller Demarcheur
        currentIndex = selectedIndex;
      } else {
        Get.toNamed(Routes.login);
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
