import 'package:get/get.dart';

import '../modules/apropos/views/a_propos.dart';
import '../modules/base/bindings/base_binding.dart';
import '../modules/base/views/base_view.dart';
import '../modules/categories/bindings/categorie_binding.dart';
import '../modules/categories/views/categorie_view.dart';
import '../modules/contacts/views/contact.dart';
import '../modules/demarcheurs/bindings/demarcheur_binding.dart';
import '../modules/demarcheurs/views/add_annonce.dart';
import '../modules/faqs/views/faqs_view.dart';
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
    // ADD ANNONCE
    GetPage(
      name: Routes.demarcheurAddAnnonce,
      page: () => const AddAnnonceView(),
      binding: DemarcheurBinding(),
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
    // REGISTER
    GetPage(
      name: Routes.login,
      page: () => const LoginView(),
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

    // CATEGORIES
    GetPage(
      name: Routes.categories,
      page: () => const CategorieView(),
      binding: CategorieBinding(),
    ),

    // FAQ'S
    GetPage(
      name: Routes.faqs,
      page: () => const FaqsView(),
    ),
  ];
}
