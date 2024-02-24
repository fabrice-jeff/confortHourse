import 'dart:convert';

import 'package:get/get.dart';

import '../../../data/api/api.dart';
import '../../../data/repository/demarcheurRepository.dart';
import '../../../routes/routes.dart';
import '../../../utils/constants.dart';
import '../../../utils/share_preference.dart';
import '../views/login.dart';

class SecurityController extends GetxController {
  final DemarcheurRepository demarcheurRepository =
      DemarcheurRepository(api: Api.baseUrl);
  // //Register
  // void register(Map<String, dynamic> data) async {
  //   // Demande de paiement
  //   int amount = int.parse(data['amount']);
  //   if (amount >= 100) {
  //     var paiement = Paiement(
  //       amount: amount,
  //       name: data['name'] + " " + data['prenoms'],
  //       email: data['email'],
  //       onStatutPaiementsChanged: handleStatutPaiement,
  //     );
  //     await Get.to(paiement.initPaiement());
  //     if (statutPaiement != null &&
  //         statutPaiement!['code'] == Constants.SUCCESS) {
  //       print(statutPaiement);
  //       // Ajout des informations pour la transactions
  //       data['amount'] = amount.toString();
  //       data['transaction_id'] = statutPaiement!['transactionId'];
  //       // data['transaction_id'] = "kbsdjjks";

  //       final result = await acteurRepository.register(data);
  //       if (result!['code'] == Constants.SUCCESS) {
  //         Get.offNamed(Routes.LOGIN);
  //       }
  //     }
  //   }
  // }

  //Login
  void login(Map<String, dynamic> data) async {
    final result = await demarcheurRepository.login(data);
    // print(result['datas']);
    if (result != null && result['success']) {
      result['datas']['ville']['pays'] = result['datas']['pays'];
      result['datas']['demarcheur']['ville'] = result['datas']['ville'];
      result['datas']['demarcheur']['user'] = result['datas']['user'];
      print(result['datas']['demarcheur']['ville']);
      SharePreferences.prefs
          .setString('acteur', jsonEncode(result['datas']['demarcheur']));
      ConstantsValues.demarcheurControllerInit = true;

      Get.offAndToNamed(
        Routes.demarcheurAddAnnonce,
      );
    } else {
      Get.offAll(() => LoginView());
    }
  }
}
