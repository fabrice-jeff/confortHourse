import 'package:conforthourse/screens/a_propos.dart';
import 'package:conforthourse/widgets/big_text.dart';
import 'package:conforthourse/widgets/simple_text.dart';
import 'package:flutter/material.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Container(
          height: 100,
          decoration: BoxDecoration(
            color: Color(0xFFC82333),
          ),
          child: Container(
            padding: EdgeInsets.only(top: 10, left: 10),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: BigTextWidget(
                    text: 'ConfortHourse',
                    textColor: Colors.white,
                    textAlign: TextAlign.left,
                  ),
                ),
                Expanded(
                  child: SimpleTextWidget(
                    text:
                        'Votre destination ultime pour trouver la location immobilière idéale',
                    textColor: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
        ListTile(
          title: const BigTextWidget(
            text: 'Accueil',
            textAlign: TextAlign.left,
          ),
          onTap: () {
            Navigator.pushNamed(context, '/');
          },
        ),
        ListTile(
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
        ListTile(
          title: const BigTextWidget(
            text: "Catégories",
            textAlign: TextAlign.left,
          ),
          onTap: () {
            Navigator.pushNamed(context, '/categorie');
          },
        ),
        ListTile(
          title: const BigTextWidget(
            text: "Colocation",
            textAlign: TextAlign.left,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: const BigTextWidget(
            text: "Contact",
            textAlign: TextAlign.left,
          ),
          onTap: () {
            Navigator.pushNamed(context, "/contact");
          },
        ),
      ],
    );
  }
}
