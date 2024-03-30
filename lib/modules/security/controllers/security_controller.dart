import 'dart:convert';

import 'package:get/get.dart';

import '../../../data/api/api.dart';
import '../../../data/repository/demarcheur_repository.dart';
import '../../../routes/routes.dart';
import '../../../utils/constants.dart';
import '../../../utils/share_preference.dart';
import '../../base/controllers/base_controller.dart';
import '../views/login.dart';

class SecurityController extends GetxController {
  final DemarcheurRepository demarcheurRepository =
      DemarcheurRepository(api: Api.baseUrl);

  //Register
  void register(Map<String, dynamic> data) async {
    final result = await demarcheurRepository.register(data);
    if (result != null && result['success']) {
      BaseController baseController = Get.put(BaseController());
      Get.offNamed(Routes.login, arguments: {'baseController': baseController});
    } else {
      print(result);
    }
  }

  //Login
  void login(Map<String, dynamic> data) async {
    final result = await demarcheurRepository.login(data);
    if (result != null && result['success']) {
      result['datas']['demarcheur']['pays_id'] = result['datas']['pays'];
      SharePreferences.prefs
          .setString('acteur', jsonEncode(result['datas']['demarcheur']));
      SharePreferences.prefs.setString('token', result['token']);
      ConstantsValues.demarcheurControllerInit = true;
      // Changer la page une fois conneter

      BaseController baseController = Get.put(BaseController());
      baseController.currentIndex = 1;
      baseController.changePage(ConstantsValues.ADD_ANNONCE);
      Get.offAndToNamed(Routes.base);
    } else {
      Get.offAll(() => LoginView());
    }
  }
}
