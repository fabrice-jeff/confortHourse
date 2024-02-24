import 'package:get/get.dart';

import '../controllers/annonce_controller.dart';
import '../controllers/demarcheur_controller.dart';

class DemarcheurBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DemarcheurController>(() => DemarcheurController());
    Get.lazyPut<AnnonceController>(() => AnnonceController());
  }
}
