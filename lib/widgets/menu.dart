import 'package:conforthourse/utils/colors.dart';
import 'package:conforthourse/widgets/big_text.dart';
import 'package:conforthourse/widgets/simple_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../routes/routes.dart';
import '../utils/constants.dart';

List<Map<String, dynamic>> menuItemList = [
  {"name": "Faq's", 'route': Routes.faqs},
  {"name": "A propos", 'route': Routes.aPropos},
  {'name': "Contact", "route": Routes.contact},
  // {'name': 'Colocation', "route": Routes.colocation},
  {'name': 'Catégories', "route": Routes.categories},
  {'name': "Connexion", "route": Routes.login},
  {'name': "Inscription", "route": Routes.register},
];

class MenuWidget extends StatelessWidget {
  const MenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          height: 200,
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.all(5),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: BigTextWidget(
                    text: 'ConfortHourse'.toUpperCase(),
                    sizeText: 25,
                  ),
                ),
                Container(
                  child: SimpleTextWidget(
                    text:
                        'Votre destination ultime pour trouver la location immobilière idéale',
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
        Divider(),
        Container(
          child: Column(
            children: [
              for (int i = 0; i < menuItemList.length; i++)
                ListTile(
                  onTap: () {
                    if (menuItemList[i]['route'] == Routes.login ||
                        menuItemList[i]['route'] == Routes.register) {
                      Get.offAllNamed(menuItemList[i]['route']);
                    } else {
                      Get.toNamed(menuItemList[i]['route']);
                    }
                  },
                  title: Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: _menuItem(libelle: menuItemList[i]['name']),
                  ),
                  trailing: SvgPicture.asset(
                    ConstantsValues.forwardArrowIcon,
                    color: AppColors.primaryColor,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _menuItem({required String libelle}) {
    return BigTextWidget(
      text: libelle,
      textAlign: TextAlign.left,
      sizeText: 20,
    );
  }
}
