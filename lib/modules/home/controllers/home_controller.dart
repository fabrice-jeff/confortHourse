import 'package:get/get.dart';

import '../../../data/api/api.dart';
import '../../../data/repository/annonce_repository.dart';

class HomeController extends GetxController {
  List<Map<String, dynamic>> annonceBylimite = [];
  final AnnonceRepository annonceRepository =
      AnnonceRepository(api: Api.baseUrlApi);

  // Get annonce by  limite
  getAnnonceByLimite() async {
    // var result = await annonceRepository.getAnnonceByLimite({'nombre': "5"});

    // if (result != null && result['success']) {
    //   for (var element in result['datas']) {
    //     late Map<String, dynamic> annonce;

    //     // Récuprer l'ensemble des annonces
    //     element['ville']['pays'] = element['pays'];
    //     element['annonce']['type_annonce'] = element['type_annonce'];
    //     element['annonce']['ville'] = element['ville'];
    //     element['annonce']['categorie'] = element['categorie'];
    //     Annonce annonceObjet = Annonce.fromJson(element['annonce']);
    //     annonce = {'annonce': annonceObjet, 'fichiers': "fichiers"};
    //     annonceBylimite.add(annonce);
    //   }
    // }
    // update();
  }
}
