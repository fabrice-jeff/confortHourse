import 'package:conforthourse/colors.dart';
import 'package:conforthourse/constants.dart';
import 'package:conforthourse/dimensions.dart';
import 'package:conforthourse/screens/demarcheurs/user_page.dart';
import 'package:conforthourse/widgets/big_text.dart';
import 'package:conforthourse/widgets/header_section.dart';
import 'package:conforthourse/widgets/label_form.dart';
import 'package:conforthourse/widgets/select_fields.dart';
import 'package:conforthourse/widgets/simple_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddAnnoncePage extends StatefulWidget {
  const AddAnnoncePage({super.key});

  @override
  State<AddAnnoncePage> createState() => _AddAnnoncePageState();
}

class _AddAnnoncePageState extends State<AddAnnoncePage> {
  final List<String> paysItems = [
    'Benin',
    'Mali',
    'Nigeria',
    'Niger',
  ];

  Path customPath = Path()
    ..moveTo(20, 20)
    ..lineTo(50, 100)
    ..lineTo(20, 200)
    ..lineTo(100, 100)
    ..lineTo(20, 20);
  @override
  Widget build(BuildContext context) {
    Widget _infoUser({required String libelle, required String value}) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 7, vertical: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              alignment: Alignment.topLeft,
              child: BigTextWidget(
                text: libelle,
                sizeText: 15,
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Expanded(
              child: Container(
                alignment: Alignment.topRight,
                child: SimpleTextWidget(
                  textAlign: TextAlign.start,
                  text: value,
                  sizeText: 14,
                ),
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        shadowColor: AppColors.backgroundColor,
        backgroundColor: AppColors.backgroundColor,
        title: BigTextWidget(
          text: "ConforthOurse",
          fontWeight: FontWeight.w400,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              HeaderSectionWidget(text: "AJOUTER UNE ANNONCE"),
              UserPage(page: ConstantsValues.ADD_ANNONCE),
              SizedBox(
                height: Dimensions.height10 * 2,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(Dimensions.radius10),
                ),
                margin: EdgeInsets.symmetric(
                    horizontal: Dimensions.width10,
                    vertical: Dimensions.height10),
                padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.width10 * 2,
                    vertical: Dimensions.height10 * 2),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: BigTextWidget(
                        text: "Ajouter une annonce",
                        textAlign: TextAlign.start,
                        sizeText: Dimensions.fontsize20,
                      ),
                    ),
                    Divider(),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: BigTextWidget(
                        text: "Informations basiques",
                        sizeText: Dimensions.fontsize16,
                      ),
                    ),
                    // Titre
                    Container(
                      alignment: Alignment.topLeft,
                      child: const LabelFormWidget(label: "Titre"),
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius10),
                        border: Border.all(width: 0.4, color: Colors.grey),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              keyboardType: TextInputType.name,
                              decoration: const InputDecoration(
                                hintText:
                                    "Entrer le quartier ou le village ou l'arrondissement",
                                border: InputBorder.none,
                              ),
                              // controller: _nom,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    // Type de la location
                    //Pays
                    SelectFieldsWidget(
                      hintText: "Votre pays",
                      icon: CupertinoIcons.globe,
                      label: "Pays",
                      items: paysItems,
                    ),
                    SizedBox(
                      height: 30,
                    ),

                    //Catégorie de la location
                    SelectFieldsWidget(
                      hintText: "Votre pays",
                      icon: CupertinoIcons.globe,
                      label: "Pays",
                      items: paysItems,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    // Prix de la location
                    Container(
                      alignment: Alignment.topLeft,
                      child: const LabelFormWidget(label: "Prix"),
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 0.4, color: Colors.grey),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              keyboardType: TextInputType.name,
                              decoration: const InputDecoration(
                                hintText: "Entrez le prix",
                                border: InputBorder.none,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    //Localisation
                    Container(
                      alignment: Alignment.topLeft,
                      child: const LabelFormWidget(label: "Prix"),
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 0.4, color: Colors.grey),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              keyboardType: TextInputType.name,
                              decoration: const InputDecoration(
                                hintText: "Entrez le prix",
                                border: InputBorder.none,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    //Localisation
                    SelectFieldsWidget(
                      hintText: "Votre pays",
                      icon: CupertinoIcons.globe,
                      label: "Pays",
                      items: paysItems,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: BigTextWidget(
                        text: 'Photos',
                        sizeText: 17,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    // Choisir des images
                    // InkWell(
                    //   onTap: () async {
                    //     List<Media>? res = await ImagesPicker.pick(
                    //       count: 3,
                    //       pickType: PickType.all,
                    //       language: Language.System,
                    //       maxTime: 30,
                    //       // maxSize: 500,
                    //       cropOpt: CropOption(
                    //         // aspectRatio: CropAspectRatio.wh16x9,
                    //         cropType: CropType.circle,
                    //       ),
                    //     );
                    //   },
                    //   child: DottedBorder(
                    //     borderType: BorderType.RRect,
                    //     radius: Radius.circular(12),
                    //     color: AppColors.backgroundColor2,
                    //     dashPattern: [6, 3, 2, 3],
                    //     strokeWidth: 2,
                    //     child: Container(
                    //       height: 140,
                    //       alignment: Alignment.center,
                    //       width: double.infinity,
                    //       child: Row(
                    //         mainAxisAlignment: MainAxisAlignment.center,
                    //         children: [
                    //           Icon(
                    //             CupertinoIcons.photo,
                    //             color: AppColors.textColor,
                    //           ),
                    //           SizedBox(
                    //             width: 5,
                    //           ),
                    //           SimpleTextWidget(
                    //             text: "Sélectionner vos photos",
                    //             textColor: AppColors.textColor,
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: const LabelFormWidget(label: "Description"),
                    ),

                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 0.4, color: Colors.grey),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              minLines: 150,
                              maxLines: null,
                              keyboardType: TextInputType.multiline,
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Entrer une description"),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width * 0.67,
                          height: 45,
                          decoration: BoxDecoration(
                            color: AppColors.secondColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: BigTextWidget(
                            height: 0,
                            text: "Publier l'annonce",
                            textColor: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
