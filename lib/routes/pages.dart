import 'package:get/get.dart';

import '../modules/base/bindings/base_binding.dart';
import '../modules/base/views/base_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/security/bindings/security_binding.dart';
import '../modules/security/views/login.dart';
import 'routes.dart';

class AppPage {
  AppPage._();
  static final INITIAL = Routes.base;
  static final routes = [
    // BASE
    GetPage(
      name: Routes.base,
      page: () => const BaseView(),
      binding: BaseBinding(),
    ),
    // HOME
    GetPage(
      name: Routes.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    // LOGIN
    GetPage(
      name: Routes.login,
      page: () => const LoginView(),
      binding: SecurityBinding(),
    ),
    // REGSITER
    GetPage(
      name: Routes.login,
      page: () => const LoginView(),
      binding: SecurityBinding(),
    ),
  ];
}
