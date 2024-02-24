import 'package:get/get.dart';

import '../../demarcheurs/controllers/annonce_controller.dart';
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
    Get.lazyPut<AnnonceController>(() => AnnonceController());
    Get.lazyPut<SecurityController>(() => SecurityController());
  }
}
