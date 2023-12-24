import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  static double height10 = screenHeight / 64;
  static double width10 = screenWidth / 36;
  static double heightTemoignage = screenHeight / 1.83;

  // Font size
  static double fontsize15 = screenWidth / 24;
  static double fontsize16 = screenWidth / 22.5;
  static double fontsize18 = screenWidth / 20;

  static double fontsize20 = screenWidth / 18;
  static double fontsize30 = screenWidth / 12;

  // Radius
  static double radius10 = screenWidth / 36;
  static double radius30 = screenWidth / 12;

  //Icon
  static double small = screenHeight / 20;
  static double large = screenHeight / 10;
}
