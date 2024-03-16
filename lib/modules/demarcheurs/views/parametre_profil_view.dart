import 'package:conforthourse/modules/demarcheurs/controllers/demarcheur_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/demarcheur.dart';
import '../../../routes/routes.dart';
import '../../../utils/colors.dart';
import '../../../utils/constants.dart';
import '../../../widgets/big_text.dart';
import '../../../widgets/button_add_annonce.dart';
import '../../../widgets/header_section.dart';
import '../../../widgets/label_form.dart';
import '../../../widgets/text_fields.dart';
import 'user_page.dart';

class ParametreProfilView extends GetView<DemarcheurController> {
  final Demarcheur? demarcheur;
  const ParametreProfilView({super.key, this.demarcheur});
  @override
  Widget build(BuildContext context) {
    Get.put(DemarcheurController);
    return Scaffold(
      body: Container(
        child: ParametreProfilForm(
          demarcheur: demarcheur,
          controller: controller,
        ),
      ),
    );
  }
}

class ParametreProfilForm extends StatefulWidget {
  final Demarcheur? demarcheur;
  final DemarcheurController controller;
  const ParametreProfilForm(
      {super.key, this.demarcheur, required this.controller});

  @override
  State<ParametreProfilForm> createState() => _ParametreProfilFormState();
}

class _ParametreProfilFormState extends State<ParametreProfilForm> {
  // Pour la modification des informations
  late TextEditingController _nom;
  late TextEditingController _prenoms;
  late TextEditingController _whatsapp;
  late TextEditingController _telephone;
  late TextEditingController _description;
  // Pour la modification du mot de passe
  late TextEditingController _password;
  late TextEditingController _confirmPassword;

  // Pour la suppression du compte
  late TextEditingController _passwordCompte;
  @override
  void initState() {
    _nom = TextEditingController(
        text: (widget.demarcheur == null) ? "" : widget.demarcheur!.nom);
    _prenoms = TextEditingController(
        text: (widget.demarcheur == null) ? "" : widget.demarcheur!.prenoms);
    super.initState();
    _whatsapp = TextEditingController(
        text: (widget.demarcheur == null) ? "" : widget.demarcheur!.whatsapp);
    _telephone = TextEditingController(
        text: (widget.demarcheur == null) ? "" : widget.demarcheur!.telephone);
    _description = TextEditingController(
        text:
            (widget.demarcheur == null) ? "" : widget.demarcheur!.description);
    _password = TextEditingController();
    _confirmPassword = TextEditingController();
    _passwordCompte = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              HeaderSectionWidget(text: "PARAMETRES"),
              UserPage(page: ConstantsValues.PARAMETRES),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: const BigTextWidget(
                        text: "Mise à jours des informations",
                        textAlign: TextAlign.start,
                        sizeText: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const ButtonAddAnnonceWidget(),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 10,
                    ),
                    // Nom
                    TextFieldsWidget(
                      label: "Nom",
                      hintText: "Entrer votre nom",
                      textInputType: TextInputType.name,
                      controller: _nom,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // Prénoms
                    TextFieldsWidget(
                      label: "Prénoms",
                      hintText: "Entrer votre prénoms",
                      textInputType: TextInputType.name,
                      controller: _prenoms,
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    // Numero whatsapp
                    TextFieldsWidget(
                      label: "Numéro Whatsapp",
                      hintText: "Entrer un numéro",
                      textInputType: TextInputType.name,
                      controller: _whatsapp,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // Téléphone
                    TextFieldsWidget(
                      label: "Numéro Téléphone",
                      hintText: "Entrer un numéro",
                      textInputType: TextInputType.name,
                      controller: _telephone,
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    //Description
                    Container(
                      alignment: Alignment.topLeft,
                      child: const LabelFormWidget(label: "Description"),
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
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
                              controller: _description,
                              keyboardType: TextInputType.multiline,
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Entrer une description"),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () async {
                        // Mettre à jours les informations personnelles
                        Map<String, dynamic> data = {
                          'nom': _nom.text,
                          'prenoms': _prenoms.text,
                          'whatsapp': _whatsapp.text,
                          'telephone': _telephone.text,
                          'description': _description.text,
                        };
                        var result =
                            await widget.controller.updateInformation(data);
                        if (result) {
                          Get.offAndToNamed(Routes.base);
                        }
                      },
                      child: Container(
                          padding: const EdgeInsets.all(10),
                          alignment: Alignment.center,
                          height: 45,
                          decoration: BoxDecoration(
                            color: AppColors.secondColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: BigTextWidget(
                                  height: 0,
                                  text: ("Mettre à jours les informations")
                                      .toUpperCase(),
                                  sizeText: 13,
                                  textAlign: TextAlign.start,
                                  textColor: Colors.white,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.person_outline,
                                color: Colors.white,
                              )
                            ],
                          )),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: BigTextWidget(
                        text: "Changer votre mot de passe",
                        textAlign: TextAlign.start,
                        sizeText: 18,
                      ),
                    ),

                    const Divider(),
                    const SizedBox(
                      height: 10,
                    ),
                    // Nouveau mot de passe
                    TextFieldsWidget(
                      label: "Nouveau mot de passe",
                      obscureText: true,
                      hintText: "*******",
                      icon: Icons.lock,
                      textInputType: TextInputType.name,
                      controller: _password,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // Confirmation du mot de passe
                    TextFieldsWidget(
                      label: "Confirmation du mot de passe",
                      icon: Icons.lock,
                      obscureText: true,
                      hintText: "*******",
                      textInputType: TextInputType.name,
                      controller: _confirmPassword,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () async {
                        // Mise à jours du mot de passe
                        Map<String, dynamic> data = {
                          'password': _password.text,
                          'passsword_confirmed': _confirmPassword.text,
                        };
                        var result =
                            await widget.controller.updatePassWord(data);
                        if (result) {
                          Get.offAndToNamed(Routes.base);
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        alignment: Alignment.center,
                        height: 45,
                        decoration: BoxDecoration(
                          color: AppColors.secondColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: BigTextWidget(
                                height: 0,
                                text: "Changer le mot de passe".toUpperCase(),
                                sizeText: 13,
                                textAlign: TextAlign.start,
                                textColor: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.key_rounded,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: const BigTextWidget(
                        text: "Suppression de compte",
                        textAlign: TextAlign.start,
                        sizeText: 20,
                      ),
                    ),
                    // Nouveau mot de passe
                    TextFieldsWidget(
                      label: "Mot de passe",
                      icon: Icons.lock,
                      obscureText: true,
                      hintText: "*******",
                      textInputType: TextInputType.name,
                      controller: _passwordCompte,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () async {
                        // Suppression du compte utilisateur
                        Map<String, dynamic> data = {
                          'password': _passwordCompte.text
                        };
                        var result = await widget.controller.deteleAcount(data);
                        print(result);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        alignment: Alignment.center,
                        height: 45,
                        decoration: BoxDecoration(
                          color: AppColors.secondColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: BigTextWidget(
                          height: 0,
                          text: "Confirmation de la suppression".toUpperCase(),
                          sizeText: 13,
                          textAlign: TextAlign.start,
                          textColor: Colors.white,
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
