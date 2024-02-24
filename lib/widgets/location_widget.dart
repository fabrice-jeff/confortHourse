import 'package:flutter/material.dart';

import '../data/models/location.dart';
import '../utils/colors.dart';
import 'big_text.dart';
import 'simple_text.dart';

class LocationWidget extends StatelessWidget {
  final Location location;

  LocationWidget({super.key, required this.location});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      height: 500,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage(
                        "images/03.jpg",
                      ),
                      fit: BoxFit.cover),
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  alignment: Alignment.topCenter,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  height: 35,
                  width: 120,
                  decoration: BoxDecoration(
                    color: AppColors.secondColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SimpleTextWidget(
                    text: location.type,
                    textColor: Colors.white,
                    fontWeight: FontWeight.w500,
                    sizeText: 16,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            alignment: Alignment.topLeft,
            child: BigTextWidget(
              text: location.localisation,
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Expanded(
            child: SimpleTextWidget(text: location.description),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SimpleTextWidget(
                text: "Prix",
              ),
              Spacer(),
              BigTextWidget(
                text: location.prix.toString() + "F / Mois",
                textColor: AppColors.secondColor,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            height: 1,
            color: AppColors.textColor.withOpacity(0.2),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Row(
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    color: AppColors.backgroundColor,
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                      image: AssetImage('images/user.webp'),
                    ),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                BigTextWidget(
                  text: "ConforthOurse",
                  height: 0,
                  sizeText: 17,
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  height: 18,
                  width: 18,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(9),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 0.4,
                        spreadRadius: 0.4,
                      )
                    ],
                  ),
                ),
                Spacer(),
                Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: 80,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: AppColors.secondColor,
                      width: 1,
                    ),
                  ),
                  child: TextButton(
                    onPressed: () {
                      //Récupération de la location avec un  id particulier
                      // var autreLocation = LocationController.findByCategorie(
                      //     location.code, location.idCategorie);
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) {
                      //       return DetailsLocation(
                      //           location: location, locations: autreLocation);
                      //     },
                      //   ),
                      // );
                    },
                    child: SimpleTextWidget(
                      text: 'Détails',
                      textColor: AppColors.secondColor,
                      fontWeight: FontWeight.w400,
                      sizeText: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
