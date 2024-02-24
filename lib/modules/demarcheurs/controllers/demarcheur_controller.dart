import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/demarcheur.dart';
import '../../../routes/routes.dart';
import '../../../utils/share_preference.dart';

class DemarcheurController extends GetxController {
  Demarcheur? demarcheur = SharePreferences.getActeur();
  @override
  void onInit() {
    if (demarcheur == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Get.offAllNamed(Routes.login);
      });
    }
    super.onInit();
  }
}
