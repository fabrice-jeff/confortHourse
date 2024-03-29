import 'dart:convert';

import 'package:get/get.dart';

import '../../../data/api/api.dart';
import '../../../data/models/pays.dart';
import '../../../data/repository/demarcheurRepository.dart';
import '../../../routes/routes.dart';
import '../../../utils/constants.dart';
import '../../../utils/share_preference.dart';
import '../views/login.dart';

class SecurityController extends GetxController {
  List<Pays> paysObjets = [];
  List<String> paysArray = [];
  final DemarcheurRepository demarcheurRepository =
      DemarcheurRepository(api: Api.baseUrl);

  @override
  void onInit() {
    getPays();
    super.onInit();
  }

  getPays() async {
    var result = await demarcheurRepository.getPays();
    if (result != null && result['success']) {
      var data = result['datas'];
      for (var pays in data) {
        var objet = Pays.fromJson(pays);
        paysObjets.add(objet);
        paysArray.add(objet.libelle);
      }
    }
    update();
  }

  //Register
  void register(Map<String, dynamic> data) async {
    final result = await demarcheurRepository.register(data);
    if (result != null && result['success']) {
      Get.offNamed(Routes.login);
    } else {
      print(result);
    }
  }

  //Login
  void login(Map<String, dynamic> data) async {
    final result = await demarcheurRepository.login(data);
    print(result);
    if (result != null && result['success']) {
      result['datas']['ville']['pays'] = result['datas']['pays'];
      result['datas']['demarcheur']['ville'] = result['datas']['ville'];
      result['datas']['demarcheur']['user'] = result['datas']['user'];
      SharePreferences.prefs
          .setString('acteur', jsonEncode(result['datas']['demarcheur']));
      ConstantsValues.demarcheurControllerInit = true;
      Get.offAndToNamed(Routes.base);
    } else {
      Get.offAll(() => LoginView());
    }
  }
}
