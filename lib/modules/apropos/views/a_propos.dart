import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../utils/colors.dart';
import '../../../utils/constants.dart';
import '../../../utils/dimensions.dart';
import '../../../widgets/big_text.dart';
import '../../../widgets/header_section.dart';
import '../../../widgets/simple_text.dart';

class AproposView extends GetView {
  const AproposView({super.key});

  Widget _listCheck({required String text}) {
    return Container(
      margin: EdgeInsets.only(top: Dimensions.height10),
      padding: EdgeInsets.symmetric(horizontal: Dimensions.width10),
      child: Row(
        children: [
          Icon(
            Icons.check_circle,
            color: AppColors.secondColor,
          ),
          SizedBox(
            width: Dimensions.width10,
          ),
          Expanded(
            child: SimpleTextWidget(
              text: text,
              height: 1.38,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: AppColors.backgroundColor,
        elevation: 4.5,
        title: BigTextWidget(
          text: ConstantsValues.appName.toUpperCase(),
          fontWeight: FontWeight.w400,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              HeaderSectionWidget(text: "A PROPOS"),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.width10,
                    vertical: Dimensions.height10),
                height: 350,
                child: Stack(
                  children: [
                    ClipPath(
                      clipper: _Triangle(),
                      child: Container(
                        height: 350,
                        decoration: BoxDecoration(
                          color: AppColors.secondColor,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(Dimensions.radius30),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: SvgPicture.asset('images/01.svg'),
                    ),
                    Positioned(
                      top: 0,
                      left: 15,
                      right: 20,
                      bottom: 15,
                      child: Container(
                        height: 300,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: AssetImage(
                                "images/apropos.jpeg",
                              ),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 15 + 65,
                      bottom: 0,
                      child: Container(
                        padding: EdgeInsets.only(bottom: 20),
                        height: 130,
                        width: 140,
                        decoration: BoxDecoration(
                          color: AppColors.secondColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 10, top: 5),
                              alignment: Alignment.topLeft,
                              child: BigTextWidget(
                                text: "5 +",
                                textColor: Colors.white,
                                sizeText: 50,
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.only(left: 10),
                                child: BigTextWidget(
                                  text: "ans d'expérience",
                                  textColor: Colors.white,
                                  sizeText: 13,
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                alignment: Alignment.topLeft,
                child: BigTextWidget(
                  text: "A PROPOS DE NOUS",
                  textColor: AppColors.secondColor,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.topLeft,
                child: BigTextWidget(
                  text: "Notre Engagement Envers Votre Satisfaction Et Confort",
                  textColor: AppColors.primaryColor,
                  textAlign: TextAlign.start,
                  sizeText: 32,
                  height: 1.5,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.topLeft,
                child: SimpleTextWidget(
                  text:
                      "La liberté, le confort et le plaisir de se loger formidablement reste l'une des priorités de notre existence et pour lesquelles nous nous battons. Vous trouverez à coup sûr la chambre ou la boutique ou l'appartement ou le bureau ou autres locations immobilières que vous cherchez sur notre plateforme communautaire.",
                  textAlign: TextAlign.start,
                  height: 1.5,
                ),
              ),
              _listCheck(
                  text:
                      "Large choix de location répondant à vos besoins spécifiques."),
              _listCheck(
                  text:
                      'Assistance professionnelle pour vous accompagner à chaque étape de la location.'),
              _listCheck(
                  text:
                      "Engagement envers la qualité, le confort et la tranquillité d'esprit de nos clients."),
              SizedBox(
                height: Dimensions.height10 * 2,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                padding: EdgeInsets.symmetric(horizontal: Dimensions.width10),
                alignment: Alignment.topLeft,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: BigTextWidget(
                          text: "CONTACT",
                          fontWeight: FontWeight.w500,
                          textColor: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: Dimensions.width10,
                      ),
                      Icon(
                        CupertinoIcons.arrow_right,
                        color: Colors.white,
                      )
                    ],
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.resolveWith((states) {
                      if (states.contains(MaterialState.pressed)) {
                        return AppColors.primaryColor;
                      }
                      return AppColors.secondColor;
                    }),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.topLeft,
                child: Row(
                  children: [
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(35),
                      ),
                      child: Icon(
                        CupertinoIcons.personalhotspot,
                        color: Colors.white,
                        size: 37,
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: double.maxFinite,
                            alignment: Alignment.topLeft,
                            child: SimpleTextWidget(
                              text: "Appelez-nous",
                              textAlign: TextAlign.start,
                              textColor: AppColors.primaryColor,
                            ),
                          ),
                          Container(
                            width: double.maxFinite,
                            alignment: Alignment.topLeft,
                            child: BigTextWidget(
                              text: "+229 98 74 14 37",
                              textAlign: TextAlign.start,
                              sizeText: 25,
                              textColor: AppColors.secondColor,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 10),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                height: 500,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: statistiqueItem(
                          context: context,
                          number: "1983",
                          titre: "Location",
                          icon: Icons.home_outlined),
                    ),
                    statistiqueItem(
                        context: context,
                        number: "500",
                        titre: "Clients heureux",
                        icon: Icons.emoji_emotions_outlined),
                    statistiqueItem(
                        context: context,
                        number: "270",
                        titre: "Agents Experts",
                        icon: Icons.supervised_user_circle_outlined),
                    statistiqueItem(
                        context: context,
                        number: "50",
                        titre: "Certificats",
                        icon: Icons.celebration_outlined),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget statistiqueItem({
  required BuildContext context,
  required String number,
  required String titre,
  required IconData icon,
}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 30),
    alignment: Alignment.center,
    height: MediaQuery.of(context).size.height * 0.17,
    decoration: BoxDecoration(
        // border: Border.all(color: Colors.white),
        ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            color: AppColors.secondColor,
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Icon(
            icon,
            size: 38,
            color: Colors.white,
          ),
        ),
        SizedBox(
          width: Dimensions.width10 * 3,
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                // color: AppColors.secondColor,
                // border: Border.all(color: Colors.white),
                // borderRadius: BorderRadius.circular(20),
                ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: BigTextWidget(
                    text: number,
                    sizeText: 30,
                    height: 0,
                    textColor: Colors.white,
                    textAlign: TextAlign.start,
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: SimpleTextWidget(
                    text: "+${titre}",
                    height: 0,
                    textColor: Colors.white,
                    fontWeight: FontWeight.w400,
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

class _Triangle extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    final path = Path();
    path.lineTo(size.width * 0.60, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, size.height / 2);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) => false;
}
