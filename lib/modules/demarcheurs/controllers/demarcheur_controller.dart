import 'dart:convert';

import 'package:get/get.dart';

import '../../../data/api/api.dart';
import '../../../data/models/demarcheur.dart';
import '../../../data/repository/demarcheur_repository.dart';
import '../../../routes/routes.dart';
import '../../../utils/constants.dart';
import '../../../utils/share_preference.dart';
import '../../base/controllers/base_controller.dart';

class DemarcheurController extends GetxController {
  Demarcheur? demarcheur = SharePreferences.getActeur();
  DemarcheurRepository demarcheurRepository =
      DemarcheurRepository(api: Api.baseUrl);

  Future<void> updateInformation(Map<String, dynamic> data) async {
    var result = await demarcheurRepository.updateInformation(data);
    if (result != null) {
      if (result['success']) {
        result['datas']['demarcheur']['pays_id'] = result['datas']['pays'];
        SharePreferences.prefs
            .setString('acteur', jsonEncode(result['datas']['demarcheur']));
        // Changer la page une fois conneter
        BaseController baseController = Get.put(BaseController());
        baseController.currentIndex = 0;
        baseController.changePage(ConstantsValues.ADD_ANNONCE);
        Get.offAndToNamed(Routes.base);
      }
    }
    update();
  }

  Future<void> updatePassWord(Map<String, dynamic> data) async {
    var result = await demarcheurRepository.updatePassword(data);
    print(result);
    if (result != null && result['success']) {
      // Changer la page une fois conneter
      BaseController baseController = Get.put(BaseController());
      baseController.currentIndex = 0;
      baseController.changePage(ConstantsValues.ADD_ANNONCE);
      // Deconnexion
      baseController.logout();
    }
  }

  // Delete compte user
  Future<bool> deteleAcount(Map<String, dynamic> data) async {
    Demarcheur? demarcheur = await SharePreferences.getActeur();
    bool response = false;
    if (demarcheur != null) {
      data['demarcheur'] = demarcheur.id;
      var result = await demarcheurRepository.deleteAccount(data);
      if (result != null && result['success']) {
        response = true;
        demarcheur = null;
        SharePreferences.prefs.remove('acteur');
        SharePreferences.prefs.clear();
      }
    }
    return response;
  }
}
