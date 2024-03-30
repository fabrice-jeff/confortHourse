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
    if (page == ConstantsValues.DASHBOARD) {
      // Récupérer le total de publication
      // Récuperer le total de chambres loués
      // Prix chambres loué
      // Annonces recemment publiées
      return DashboardView(
        demarcheur: demarcheur,
      );
    } else if (page == ConstantsValues.PROFIL_USER) {
      // Total de location
      // Location actifs
      // Location louée
      // Date création du compte
      return ProfilView(
        demarcheur: demarcheur,
      );
    } else if (page == ConstantsValues.ANNONCES) {
      // Liste des annonces publiés
      return AnnoncesView(
        demarcheur: demarcheur,
      );
    } else if (page == ConstantsValues.PARAMETRES) {
      return ParametreProfilView(
        demarcheur: demarcheur,
        baseController: controller,
      );
    } else {
      return AddAnnonceView(
        demarcheur: demarcheur,
        baseController: controller,
      );
    }
  }
}
