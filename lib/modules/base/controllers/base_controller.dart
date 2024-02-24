import 'package:conforthourse/modules/demarcheurs/controllers/demarcheur_controller.dart';
import 'package:get/get.dart';

import '../../../data/models/demarcheur.dart';
import '../../../utils/constants.dart';
import '../../../utils/share_preference.dart';

class BaseController extends GetxController {
  Demarcheur? demarcheur = SharePreferences.getActeur();
  int currentIndex = 0;

  /// change the selected screen index
  changeScreen(int selectedIndex) {
    currentIndex = selectedIndex;
    if (selectedIndex == 1) {
      // On initsialise le controller Demarcheur
      Get.put(DemarcheurController());
    }
    update();
  }
}
