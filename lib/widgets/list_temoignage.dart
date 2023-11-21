import 'package:conforthourse/colors.dart';
import 'package:conforthourse/widgets/big_text.dart';
import 'package:conforthourse/widgets/simple_text.dart';
import 'package:flutter/material.dart';

class ListTemoignage extends StatefulWidget {
  const ListTemoignage({super.key});

  @override
  State<ListTemoignage> createState() => _ListeTemoignageState();
}

class _ListeTemoignageState extends State<ListTemoignage> {
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: 4,
      physics: AlwaysScrollableScrollPhysics(),
      itemBuilder: (BuildContext, position) {
        return _pageTemoignage();
      },
    );
  }

  Widget _pageTemoignage() {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(
        left: 15,
        right: 15,
      ),
      width: double.maxFinite,
      height: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: Stack(
        children: [
          Positioned(
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 50),
              padding: EdgeInsets.only(top: 50, left: 10, right: 10),
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                children: [
                  BigTextWidget(
                    text: "Adjovi Dossou",
                  ),
                  SimpleTextWidget(
                    text: 'Client',
                    textColor: AppColors.secondColor,
                    fontWeight: FontWeight.w700,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  SimpleTextWidget(
                    text:
                        "J'ai loué un bureau via ce site et j'ai été impresionnépar le niveau de service. L'agent immobilier a été très professionnel et le bureau était exactement comme décrit",
                    textColor: AppColors.textColor,
                    fontWeight: FontWeight.w300,
                    textAlign: TextAlign.center,
                    sizeText: 16,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: (300 / 2) - 50,
            child: Container(
              height: 100,
              padding: const EdgeInsets.all(10),
              width: 100,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(width: 8, color: Colors.white),
              ),
              child: Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  image: DecorationImage(
                    image: AssetImage('images/user.webp'),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
