import 'package:get/get.dart';

import '../../categories/controllers/categorie_controller.dart';
import '../../demarcheurs/controllers/demarcheur_controller.dart';
import '../../home/controllers/home_controller.dart';
import '../../security/controllers/security_controller.dart';
import '../controllers/base_controller.dart';

class BaseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BaseController>(() => BaseController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<DemarcheurController>(() => DemarcheurController());
    Get.lazyPut<CategorieController>(() => CategorieController());
    Get.lazyPut<SecurityController>(() => SecurityController());
  }
}
