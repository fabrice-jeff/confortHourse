import 'package:conforthourse/utils/colors.dart';
import 'package:conforthourse/utils/dimensions.dart';
import 'package:conforthourse/views/a_propos.dart';
import 'package:conforthourse/views/categorie.dart';
import 'package:conforthourse/views/contact.dart';
import 'package:conforthourse/modules/home/views/home_view.dart';
import 'package:conforthourse/widgets/big_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: AppColors.backgroundColor,
        elevation: 4.5,
        title: BigTextWidget(
          text: "Menu",
          fontWeight: FontWeight.w400,
        ),
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(top: Dimensions.height10 * 3),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Container(
                margin:
                    EdgeInsets.symmetric(vertical: Dimensions.height10 * 0.5),
                child: ListTile(
                  leading: Icon(Icons.home_outlined),
                  title: const BigTextWidget(
                    text: 'Accueil',
                    textAlign: TextAlign.left,
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return HomeView();
                    }));
                  },
                ),
              ),
              Container(
                margin:
                    EdgeInsets.symmetric(vertical: Dimensions.height10 * 0.5),
                child: ListTile(
                  leading: Icon(CupertinoIcons.conversation_bubble),
                  title: const BigTextWidget(
                    text: "Contact",
                    textAlign: TextAlign.left,
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ContactPage();
                    }));
                  },
                ),
              ),
              Container(
                margin:
                    EdgeInsets.symmetric(vertical: Dimensions.height10 * 0.5),
                child: ListTile(
                  leading: Icon(Icons.south_america_outlined),
                  title: const BigTextWidget(
                    text: 'A propos',
                    textAlign: TextAlign.left,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AproposPage(),
                      ),
                    );
                  },
                ),
              ),
              Container(
                margin:
                    EdgeInsets.symmetric(vertical: Dimensions.height10 * 0.5),
                child: ListTile(
                  leading: Icon(CupertinoIcons.list_bullet),
                  title: const BigTextWidget(
                    text: "Catégories",
                    textAlign: TextAlign.left,
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return CategoriePage();
                    }));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
