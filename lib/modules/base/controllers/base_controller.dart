import 'package:get/get.dart';

import '../../../data/models/demarcheur.dart';
import '../../../routes/routes.dart';
import '../../../utils/share_preference.dart';

class BaseController extends GetxController {
  int currentIndex = 0;

  /// change the selected screen index
  changeScreen(int selectedIndex) {
    if (selectedIndex == 1) {
      Demarcheur? demarcheur = SharePreferences.getActeur();
      // Verifier si l'utilisateur est connecté
      print(demarcheur);
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
}
