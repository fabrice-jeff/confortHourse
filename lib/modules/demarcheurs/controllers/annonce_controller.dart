import 'dart:convert';

import 'package:get/get.dart';
import '../../../data/api/api.dart';

import '../../../data/repository/annonce_repository.dart';
import '../../../routes/routes.dart';
import '../../../services/generate_random_file_name.dart';

class AnnonceController extends GetxController {
  final AnnonceRepository annonceRepository =
      AnnonceRepository(api: Api.baseUrl);
  int totalPublicationByDemarcheur = 0;
  int totalChambresLouees = 0;
  int prixChambreLouees = 0;

  @override
  void onInit() {
    getTotalPublicationByDemarcheur();
    super.onInit();
  }

  addAnnonce(data) async {
    data['filename'] = generateRandomFileName('annonce');
    data['image'] = base64Encode(data['image'].readAsBytesSync());
    var result = await annonceRepository.addAnnonce(data);

    if (result != null && result['success']) {
      Get.offAllNamed(Routes.base);
    } else {
      // A faire Echec lors de l'ajout d'une annonce
      print(result);
    }
    getTotalPublicationByDemarcheur();
    update();
  }

  getTotalPublicationByDemarcheur() async {
    var result = await annonceRepository.totalPublication();
    if (result != null) {
      print(result['datas']);
      totalPublicationByDemarcheur = result['datas']['total_publication'];
      totalChambresLouees = result['datas']['total_chambres_louees'];
      prixChambreLouees = result['datas']['prix_chambres_louees'];
    }
    update();
  }

  // getRecentsPublicationByDemarcheur() async {
  //   var result = await annonceRepository.recentsPublication();
  //   print(result);
  //   // if (result != null) {
  //   //   totalPublicationByDemarcheur = result['datas']['total_publication'];
  //   //   totalChambresLouees = result['datas']['total_chambres_louees'];
  //   //   prixChambreLouees = result['datas']['prix_chambres_louees'];
  //   // }
  //   update();
  // }
}
