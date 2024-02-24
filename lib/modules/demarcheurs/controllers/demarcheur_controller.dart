import 'package:get/get.dart';

import '../../../data/models/demarcheur.dart';
import '../../../utils/share_preference.dart';

class DemarcheurController extends GetxController {
  Demarcheur? demarcheur = SharePreferences.getActeur();
  @override
  void onInit() {
    super.onInit();
  }
}
