import 'package:conforthourse/modules/base/controllers/base_controller.dart';
import 'package:get/get.dart';

import '../modules/apropos/views/a_propos.dart';
import '../modules/base/bindings/base_binding.dart';
import '../modules/base/views/base_view.dart';
import '../modules/categories/views/categorie_view.dart';
import '../modules/contacts/views/contact_view.dart';
import '../modules/faqs/views/faqs_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/security/bindings/security_binding.dart';
import '../modules/security/views/login.dart';
import '../modules/security/views/register.dart';
import 'routes.dart';

class AppPage {
  AppPage._();
  static const initial = Routes.base;
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
      page: () => LoginView(),
      binding: SecurityBinding(),
    ),
    // Register
    GetPage(
      name: Routes.register,
      page: () => RegisterView(),
      binding: SecurityBinding(),
    ),

    // A propos
    GetPage(
      name: Routes.aPropos,
      page: () => const AproposView(),
    ),

    // CONTACT
    GetPage(
      name: Routes.contact,
      page: () => const ContactView(),
    ),

    // FAQ'S
    GetPage(
      name: Routes.faqs,
      page: () => const FaqsView(),
    ),
    GetPage(
      name: Routes.categories,
      page: () => const CategorieView(),
    ),
  ];
}
