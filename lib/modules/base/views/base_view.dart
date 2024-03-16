import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants.dart';
import '../../../widgets/big_text.dart';
import '../../../widgets/menu.dart';
import '../../demarcheurs/views/demarcheur_view.dart';
import '../../home/views/home_view.dart';
import '../controllers/base_controller.dart';

class BaseView extends GetView<BaseController> {
  const BaseView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(BaseController());
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
    return GetBuilder<BaseController>(
      builder: (_) => Scaffold(
        key: scaffoldKey,
        drawer: Drawer(
          child: MenuWidget(),
        ),
        appBar: AppBar(
          title: Expanded(
            child: Container(
              alignment: Alignment.topCenter,
              child: BigTextWidget(
                text: ConstantsValues.appName.toUpperCase(),
                sizeText: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          actions: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Icon(
                Icons.search,
                size: 25,
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: IndexedStack(
            index: controller.currentIndex,
            children: [
              HomeView(),
              DemarcheurView(
                page: controller.page,
              ),
              DemarcheurView(
                page: controller.page,
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.only(top: 10, bottom: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Colors.black38,
                spreadRadius: 0,
                blurRadius: 10,
              ),
            ],
          ),
          child: ClipRRect(
            child: BottomNavigationBar(
              currentIndex: controller.currentIndex,
              type: BottomNavigationBarType.fixed,
              elevation: 0.0,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              selectedFontSize: 0.0,
              items: [
                BottomNavigationBarItem(
                  label: "Accueil",
                  icon: Icon(Icons.home),
                ),
                BottomNavigationBarItem(
                  label: "Ajouter",
                  icon: Icon(Icons.add),
                ),
                BottomNavigationBarItem(
                  label: "Ajouter",
                  icon: Icon(Icons.person),
                )
              ],
              onTap: controller.changeScreen,
            ),
          ),
        ),
      ),
    );
  }

  // _mBottomNavItem({required String label, required String icon}) {
  //   return BottomNavigationBarItem(
  //     label: label,
  //     icon: SvgPicture.asset(
  //       icon,
  //       color: Colors.black45,
  //       width: 25,
  //       height: 25,
  //     ),
  //     activeIcon: SvgPicture.asset(
  //       icon,
  //       color: AppColors.backgroundColor,
  //       width: 25,
  //       height: 25,
  //     ),
  //   );
  // }
}
