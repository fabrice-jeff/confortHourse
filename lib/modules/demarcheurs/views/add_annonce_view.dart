import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/colors.dart';
import '../../../utils/constants.dart';
import '../../../utils/dimensions.dart';
import '../../../components/big_text.dart';
import '../../../components/header_section.dart';
import '../../../components/label_form.dart';
import '../../../components/select_fields.dart';
import '../../../components/simple_text.dart';
import '../../../components/text_fields.dart';
import '../../base/controllers/base_controller.dart';
import '../controllers/annonce_controller.dart';
import 'user_page.dart';

class AddAnnonceView extends GetView<AnnonceController> {
  final BaseController baseController;
  const AddAnnonceView({super.key, required this.baseController});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: AddAnnonceForm(
          controller: controller,
          baseController: baseController,
        ),
      ),
    );
  }
}

class AddAnnonceForm extends StatefulWidget {
  final AnnonceController controller;
  final BaseController baseController;
  const AddAnnonceForm(
      {super.key, required this.controller, required this.baseController});

  @override
  State<AddAnnonceForm> createState() => _AddAnnonceFormState();
}

class _AddAnnonceFormState extends State<AddAnnonceForm> {
  late TextEditingController _titre;
  String? _type;
  String? _categorie;
  late TextEditingController _prix;
  late TextEditingController _localisation;
  File? _file;
  bool _fileSelected = false;
  String? _extension;
  late TextEditingController _description;

  @override
  void initState() {
    _titre = TextEditingController();
    _prix = TextEditingController();
    _description = TextEditingController();
    _localisation = TextEditingController();

    super.initState();
  }

  void handleSelectCategorie(String? selectedValue) {
    _categorie = selectedValue;
  }

  void handleSelectType(String? selectedValue) {
    _type = selectedValue;
  }

  void _openFileExplorer() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: [
        'jpg',
        'jpeg',
        'png',
      ], // Extensions autorisées
    );

    if (result != null) {
      setState(() {
        var platformFile = result.files.single;
        _file = File(platformFile.path!);
        _extension = platformFile.extension; // Récupérer l'extension du fichier
        _fileSelected = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              HeaderSectionWidget(text: "AJOUTER UNE ANNONCE"),
              UserPage(
                page: ConstantsValues.addAnnonces,
              ),
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

                    TextFieldsWidget(
                      icon: Icons.account_balance_rounded,
                      label: "Titre",
                      hintText:
                          "Entrer les quartier ou le village ou l'arrondissement",
                      textInputType: TextInputType.name,
                      controller: _titre,
                    ),

                    SizedBox(
                      height: Dimensions.height10 * 2,
                    ),

                    // Type de la location
                    SelectFieldsWidget(
                      hintText: "Selectionner un type",
                      label: "Type annonce",
                      items: widget.baseController.typeArray,
                      onValueChanged: handleSelectType,
                    ),

                    SizedBox(
                      height: Dimensions.height10 * 2,
                    ),

                    //Categorie
                    SelectFieldsWidget(
                      hintText: "Sélectionner une catégorie",
                      label: "Catégories",
                      items: widget.baseController.categoriesArray,
                      onValueChanged: handleSelectCategorie,
                    ),
                    SizedBox(
                      height: Dimensions.height10 * 2,
                    ),

                    // Prix de la location
                    TextFieldsWidget(
                      icon: Icons.bento,
                      label: "Prix",
                      hintText: "Entrer le prix",
                      textInputType: TextInputType.name,
                      controller: _prix,
                    ),

                    SizedBox(
                      height: Dimensions.height10 * 2,
                    ),

                    //Localisation
                    TextFieldsWidget(
                      label: "Localisation",
                      hintText: "Entrer une localisation",
                      textInputType: TextInputType.name,
                      icon: Icons.castle_outlined,
                      controller: _localisation,
                    ),
                    SizedBox(
                      height: Dimensions.height10 * 2,
                    ),

                    Container(
                      alignment: Alignment.topLeft,
                      child: BigTextWidget(
                        text: 'Photos',
                        sizeText: 17,
                      ),
                    ),
                    InkWell(
                      onTap: _openFileExplorer,
                      child: DottedBorder(
                        color: Colors.black38,
                        borderType: BorderType.RRect,
                        radius: Radius.circular(10),
                        padding: EdgeInsets.all(6),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          child: _fileSelected
                              ? Container(
                                  alignment: Alignment.center,
                                  height: 100,
                                  width: double.infinity,
                                  child: Text(
                                    'Fichier sélectionné',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                )
                              : Container(
                                  height: 100,
                                  width: double.infinity,
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.photo_library_outlined),
                                        SizedBox(
                                          width: Dimensions.width10 / 2,
                                        ),
                                        SimpleTextWidget(
                                          text: "Sélectionnez vos photos",
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.height10 * 4,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: BigTextWidget(
                        text: "Informations basiques",
                        sizeText: Dimensions.fontsize16,
                      ),
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
                              controller: _description,
                              maxLines: null,
                              keyboardType: TextInputType.multiline,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "Entrer une description",
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.height10 * 3,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: InkWell(
                        onTap: () {
                          // Data
                          Map<String, dynamic> data = {
                            'titre': _titre.text,
                            'type': _type,
                            'categorie': _categorie,
                            'prix': _prix.text,
                            'ville': _localisation.text,
                            'image': _file,
                            'extension': _extension,
                            'description': _description.text,
                          };
                          // print(data);
                          widget.controller.addAnnonce(data);
                        },
                        child: Container(
                          height: Dimensions.height10 * 5,
                          decoration: BoxDecoration(
                            color: AppColors.secondColor,
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.add_circle_outline_rounded,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: Dimensions.width10,
                              ),
                              SimpleTextWidget(
                                text: "Ajouter une annonce",
                                sizeText: Dimensions.fontsize15,
                                textColor: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
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
