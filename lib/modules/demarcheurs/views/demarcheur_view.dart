import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/demarcheur.dart';
import '../../../utils/constants.dart';
import '../../base/controllers/base_controller.dart';
import '../controllers/demarcheur_controller.dart';
import 'add_annonce_view.dart';
import 'annonces_view.dart';
import 'dashboard.dart';
import 'parametre_profil_view.dart';
import 'profil_view.dart';

class DemarcheurView extends GetView<BaseController> {
  final String? page;
  const DemarcheurView({
    super.key,
    this.page,
  });
  @override
  Widget build(BuildContext context) {
    Get.put(DemarcheurController);
    return Scaffold(
      body: SafeArea(
        child: Container(child: _buildWidget(controller.demarcheur)),
      ),
    );
  }

  Widget _buildWidget(Demarcheur? demarcheur) {
    // Dashboard
    if (page == ConstantsValues.DASHBOARD) {
      return const DashboardView();
    }
    // Profil
    else if (page == ConstantsValues.PROFIL_USER) {
      return ProfilView(baseController: controller);
    }
    // Liste des annonces publiés
    else if (page == ConstantsValues.ANNONCES) {
      return AnnoncesView(
        baseController: controller,
      );
    }
    //Parametre de profil
    else if (page == ConstantsValues.PARAMETRES) {
      return ParametreProfilView(
        baseController: controller,
      );
    }
    // Ajouter une annonce
    else {
      return AddAnnonceView(
        baseController: controller,
      );
    }
  }
}
