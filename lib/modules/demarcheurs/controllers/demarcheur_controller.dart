import 'dart:convert';
import 'package:get/get.dart';

import '../../../data/api/api.dart';
import '../../../data/models/demarcheur.dart';
import '../../../data/repository/demarcheurRepository.dart';
import '../../../utils/share_preference.dart';
import '../../base/controllers/base_controller.dart';

class DemarcheurController extends GetxController {
  Demarcheur? demarcheur = SharePreferences.getActeur();
  DemarcheurRepository demarcheurRepository =
      DemarcheurRepository(api: Api.baseUrl);
  @override
  void onInit() {
    super.onInit();
  }

  Future<bool> updateInformation(Map<String, dynamic> data) async {
    Demarcheur? demarcheur = await SharePreferences.getActeur();
    bool response = false;
    if (demarcheur != null) {
      data['demarcheur'] = demarcheur.id;
      var result = await demarcheurRepository.updateInformation(data);
      if (result != null && result['success']) {
        result['datas']['ville']['pays'] = result['datas']['pays'];
        result['datas']['demarcheur']['ville'] = result['datas']['ville'];
        result['datas']['demarcheur']['user'] = result['datas']['user'];
        response = true;
        SharePreferences.prefs
            .setString('acteur', jsonEncode(result['datas']['demarcheur']));
        Get.put(BaseController());
      }
    }
    return response;
  }

  Future<bool> updatePassWord(Map<String, dynamic> data) async {
    Demarcheur? demarcheur = await SharePreferences.getActeur();
    bool response = false;
    if (demarcheur != null) {
      data['demarcheur'] = demarcheur.id;
      var result = await demarcheurRepository.updatePassword(data);
      if (result != null && result['success']) {
        response = true;
      }
    }
    return response;
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
