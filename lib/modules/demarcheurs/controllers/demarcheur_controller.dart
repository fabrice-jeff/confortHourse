import 'dart:convert';

import 'package:get/get.dart';

import '../../../data/api/api.dart';
import '../../../data/models/demarcheur.dart';
import '../../../data/repository/demarcheurRepository.dart';
import '../../../routes/routes.dart';
import '../../../utils/share_preference.dart';

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
        Get.offAndToNamed(Routes.base);
      }
    }
    update();
  }

  Future<void> updatePassWord(Map<String, dynamic> data) async {
    var result = await demarcheurRepository.updatePassword(data);
    print(result);
    if (result != null && result['success']) {
      //Retrouner vers la page d'accueil
      print("Bonjour");
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
