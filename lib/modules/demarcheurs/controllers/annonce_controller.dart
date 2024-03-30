import 'dart:convert';

import 'package:get/get.dart';
import '../../../data/api/api.dart';

import '../../../data/repository/annonce_repository.dart';
import '../../../routes/routes.dart';
import '../../../services/generate_random_file_name.dart';

class AnnonceController extends GetxController {
  final AnnonceRepository annonceRepository =
      AnnonceRepository(api: Api.baseUrl);

  addAnnonce(data) async {
    data['filename'] = generateRandomFileName('annonce');
    data['image'] = base64Encode(data['image'].readAsBytesSync());
    var result = await annonceRepository.addAnnonce(data);
    print(result);
    if (result != null && result['success']) {
      Get.offAllNamed(Routes.base);
    } else {
      print(result);
    }
  }
}
