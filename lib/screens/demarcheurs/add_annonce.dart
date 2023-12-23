import 'package:conforthourse/colors.dart';
import 'package:conforthourse/constants.dart';
import 'package:conforthourse/screens/demarcheurs/user_page.dart';
import 'package:conforthourse/widgets/big_text.dart';
import 'package:conforthourse/widgets/header_section.dart';
import 'package:conforthourse/widgets/label_form.dart';
import 'package:conforthourse/widgets/simple_text.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:images_picker/images_picker.dart';
import 'package:select_form_field/select_form_field.dart';

class AddAnnoncePage extends StatefulWidget {
  const AddAnnoncePage({super.key});

  @override
  State<AddAnnoncePage> createState() => _AddAnnoncePageState();
}

class _AddAnnoncePageState extends State<AddAnnoncePage> {
  final List<Map<String, dynamic>> _pays = [
    {
      'value': 'Benin',
      'label': 'Benin',
    },
    {
      'value': 'Madagascar',
      'label': 'Madagascar',
    },
    {
      'value': 'Congo',
      'label': 'Congo',
    },
    {
      'value': 'Lituanie',
      'label': 'Lituanie',
    },
    {
      'value': 'Senegal',
      'label': 'Bénin',
    },
    {
      'value': 'Togo',
      'label': 'Togo',
    },
  ];
  String _paysChoise = "Benin";

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
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: BigTextWidget(
                        text: "Ajouter une annonce",
                        textAlign: TextAlign.start,
                        sizeText: 22,
                      ),
                    ),
                    Divider(),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: BigTextWidget(
                        text: "Informations basiques",
                        sizeText: 17,
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
                        borderRadius: BorderRadius.circular(10),
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
                    Container(
                      alignment: Alignment.topLeft,
                      child: LabelFormWidget(label: "Type"),
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
                          Icon(
                            CupertinoIcons.globe,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: SelectFormField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Choisissez un type",
                              ),
                              type: SelectFormFieldType.dialog,
                              initialValue: 'circle',
                              items: _pays,
                              onChanged: (val) => _paysChoise = val,
                              onSaved: (val) => print(val),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.arrow_drop_down_outlined,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),

                    //Catégorie de la location
                    Container(
                      alignment: Alignment.topLeft,
                      child: LabelFormWidget(label: "Catégorie"),
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
                          Icon(
                            CupertinoIcons.globe,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: SelectFormField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Choisissez une catégorie",
                              ),
                              type: SelectFormFieldType.dialog,
                              initialValue: 'circle',
                              items: _pays,
                              onChanged: (val) => _paysChoise = val,
                              onSaved: (val) => print(val),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.arrow_drop_down_outlined,
                            color: Colors.grey,
                          ),
                        ],
                      ),
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
                    Container(
                      alignment: Alignment.topLeft,
                      child: const LabelFormWidget(label: "Localisation"),
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
                          Icon(
                            CupertinoIcons.globe,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: SelectFormField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Choisissez une catégorie",
                              ),
                              type: SelectFormFieldType.dialog,
                              initialValue: 'circle',
                              items: _pays,
                              onChanged: (val) => _paysChoise = val,
                              onSaved: (val) => print(val),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.arrow_drop_down_outlined,
                            color: Colors.grey,
                          ),
                        ],
                      ),
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
                    InkWell(
                      onTap: () async {
                        List<Media>? res = await ImagesPicker.pick(
                          count: 3,
                          pickType: PickType.all,
                          language: Language.System,
                          maxTime: 30,
                          // maxSize: 500,
                          cropOpt: CropOption(
                            // aspectRatio: CropAspectRatio.wh16x9,
                            cropType: CropType.circle,
                          ),
                        );
                      },
                      child: DottedBorder(
                        borderType: BorderType.RRect,
                        radius: Radius.circular(12),
                        color: AppColors.backgroundColor2,
                        dashPattern: [6, 3, 2, 3],
                        strokeWidth: 2,
                        child: Container(
                          height: 140,
                          alignment: Alignment.center,
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                CupertinoIcons.photo,
                                color: AppColors.textColor,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              SimpleTextWidget(
                                text: "Sélectionner vos photos",
                                textColor: AppColors.textColor,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
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
