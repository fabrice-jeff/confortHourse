import 'package:get/get.dart';

import '../controllers/demarcheur_controller.dart';

class DemarcheurBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DemarcheurController>(() => DemarcheurController());
  }
}
