import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/demarcheur.dart';
import '../../../utils/colors.dart';
import '../../../utils/constants.dart';
import '../../../utils/dimensions.dart';
import '../../../widgets/big_text.dart';
import '../../../widgets/header_section.dart';
import '../../../widgets/label_form.dart';
import '../../../widgets/select_fields.dart';
import '../../../widgets/simple_text.dart';
import '../../../widgets/text_fields.dart';
import '../controllers/annonce_controller.dart';
import 'user_page.dart';

class AddAnnonceView extends GetView<AnnonceController> {
  final Demarcheur? demarcheur;
  const AddAnnonceView({super.key, this.demarcheur});
  @override
  Widget build(BuildContext context) {
    Get.put(AnnonceController);
    return Scaffold(
      body: Container(
        child: AddAnnonceForm(
          demarcheur: demarcheur,
          controller: controller,
        ),
      ),
    );
  }
}

class AddAnnonceForm extends StatefulWidget {
  final AnnonceController controller;
  final Demarcheur? demarcheur;
  const AddAnnonceForm({
    super.key,
    required this.controller,
    this.demarcheur,
  });

  @override
  State<AddAnnonceForm> createState() => _AddAnnonceFormState();
}

class _AddAnnonceFormState extends State<AddAnnonceForm> {
  TextEditingController _titre = TextEditingController();
  String? _type;
  String? _categorie;
  String? _localisation;
  TextEditingController _prix = TextEditingController();
  TextEditingController _description = TextEditingController();
  File? _file;
  bool _fileSelected = false;
  String? _extension;

  void handleSelectCategorie(String? selectedValue) {
    for (var categorie in widget.controller.categoriesObjet) {
      if (selectedValue == categorie.libelle) {
        _categorie = categorie.code;
        break;
      }
    }
  }

  void handleSelectType(String? selectedValue) {
    for (var type in widget.controller.typeObjet) {
      if (selectedValue == type.libelle) {
        _type = type.code;
        break;
      }
    }
  }

  void handleSelectLocalisation(String? selectedValue) {
    for (var localisation in widget.controller.localisatioObjet) {
      if (selectedValue == localisation.libelle) {
        _localisation = localisation.code;
        break;
      }
    }
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
                page: ConstantsValues.ADD_ANNONCE,
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
                      label: "Type",
                      items: widget.controller.typeArray,
                      onValueChanged: handleSelectType,
                    ),

                    SizedBox(
                      height: Dimensions.height10 * 2,
                    ),

                    //Categorie
                    SelectFieldsWidget(
                      hintText: "Sélectionner une catégorie",
                      label: "Catégories",
                      items: widget.controller.categoriesArray,
                      onValueChanged: handleSelectCategorie,
                    ),
                    SizedBox(
                      height: Dimensions.height10 * 2,
                    ),

                    // Prix de la location
                    TextFieldsWidget(
                      label: "Prix",
                      hintText: "Entrer le prix",
                      textInputType: TextInputType.name,
                      controller: _prix,
                    ),

                    SizedBox(
                      height: Dimensions.height10 * 2,
                    ),

                    //Localisation
                    SelectFieldsWidget(
                      hintText: "Sélectionner une localisation",
                      label: "Localisation",
                      items: widget.controller.localisationArray,
                      onValueChanged: handleSelectLocalisation,
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
                      height: 30,
                    ),
                    InkWell(
                      onTap: () {
                        // Data
                        Map<String, dynamic> data = {
                          'titre': _titre.text,
                          'type': _type,
                          'categorie': _categorie,
                          'prix': _prix.text,
                          'ville': _localisation,
                          'image': _file,
                          'extension': _extension,
                          'description': _description.text,
                        };
                        widget.controller.addAnnonce(data);
                      },
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
