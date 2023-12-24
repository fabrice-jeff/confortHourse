import 'package:conforthourse/colors.dart';
import 'package:conforthourse/dimensions.dart';
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
      itemBuilder: (BuildContext context, position) {
        return _pageTemoignage();
      },
    );
  }

  Widget _pageTemoignage() {
    var widthTemoignage = Dimensions.screenWidth - Dimensions.width10 * 2;
    return Stack(
      children: [
        Positioned(
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(
                top: Dimensions.height10 * 5,
                left: Dimensions.width10,
                right: Dimensions.width10),
            padding: EdgeInsets.only(
                top: Dimensions.height10 * 5.5,
                left: Dimensions.width10 * 1.3,
                right: Dimensions.width10 * 1.3),
            height: Dimensions.heightTemoignage,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(Dimensions.radius30),
            ),
            child: Column(
              children: [
                BigTextWidget(
                  text: "Adjovi Dossou",
                  sizeText: Dimensions.fontsize20,
                ),
                SimpleTextWidget(
                  text: 'Client',
                  textColor: AppColors.secondColor,
                  fontWeight: FontWeight.w700,
                  sizeText: Dimensions.fontsize16,
                ),
                SizedBox(
                  height: Dimensions.height10,
                ),
                SimpleTextWidget(
                  text:
                      "J'ai loué un bureau via ce site et j'ai été impresionnépar le niveau de service. L'agent immobilier a été très professionnel et le bureau était exactement comme décrit",
                  textColor: AppColors.textColor,
                  fontWeight: FontWeight.w300,
                  textAlign: TextAlign.center,
                  sizeText: Dimensions.fontsize15,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          left: (widthTemoignage / 2) - Dimensions.width10 * 5,
          child: Container(
            height: Dimensions.width10 * 10,
            padding: EdgeInsets.symmetric(
                horizontal: Dimensions.width10, vertical: Dimensions.height10),
            width: Dimensions.width10 * 10,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(Dimensions.screenWidth),
              border:
                  Border.all(width: Dimensions.width10, color: Colors.white),
            ),
            child: Container(
              height: Dimensions.width10 * 9,
              width: Dimensions.width10 * 9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.screenWidth),
                image: DecorationImage(
                  image: AssetImage('images/user.webp'),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
