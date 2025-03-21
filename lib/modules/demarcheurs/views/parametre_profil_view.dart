import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/intl_phone_field.dart';
import '../../../utils/colors.dart';
import '../../../utils/constants.dart';
import '../../../utils/dimensions.dart';
import '../../../components/big_text.dart';

import '../../../components/header_section.dart';
import '../../../components/label_form.dart';
import '../../../components/simple_text.dart';
import '../../../components/text_fields.dart';
import '../../base/controllers/base_controller.dart';
import '../controllers/demarcheur_controller.dart';
import 'user_page.dart';

class ParametreProfilView extends GetView<DemarcheurController> {
  final BaseController baseController;
  const ParametreProfilView({
    super.key,
    required this.baseController,
  });
  @override
  Widget build(BuildContext context) {
    Get.put(DemarcheurController());
    return Scaffold(
      body: Container(
        child: ParametreProfilForm(
          demarcheurController: controller,
          baseController: baseController,
        ),
      ),
    );
  }
}

class ParametreProfilForm extends StatefulWidget {
  final DemarcheurController demarcheurController;
  final BaseController baseController;

  const ParametreProfilForm(
      {super.key,
      required this.demarcheurController,
      required this.baseController});

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
    if (widget.baseController.demarcheur != null) {
      //Modification des informations personnelles
      _nom = TextEditingController(text: widget.baseController.demarcheur!.nom);
      _prenoms = TextEditingController(
          text: widget.baseController.demarcheur!.prenoms);
      _whatsapp = TextEditingController(
          text: widget.baseController.demarcheur!.whatsapp);
      _telephone = TextEditingController(
          text: widget.baseController.demarcheur!.telephone);
      _description = TextEditingController(
          text: widget.baseController.demarcheur!.description);
      //Modification du mot de passe
      _password = TextEditingController();
      _confirmPassword = TextEditingController();
      //Suppression du mot de passe
      _passwordCompte = TextEditingController();
    } else {
      //Modification des informations personnelles
      _nom = TextEditingController();
      _prenoms = TextEditingController();
      _whatsapp = TextEditingController();
      _telephone = TextEditingController();
      _description = TextEditingController();
      //Modification du mot de passe
      _password = TextEditingController();
      _confirmPassword = TextEditingController();
      //Suppression du mot de passe
      _passwordCompte = TextEditingController();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DemarcheurController>(builder: (_) {
      return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                HeaderSectionWidget(text: "PARAMETRES"),
                UserPage(page: ConstantsValues.parametres),
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
                      SizedBox(
                        height: Dimensions.height10,
                      ),

                      Align(
                        alignment: Alignment.topLeft,
                        child: InkWell(
                          onTap: () {
                            //Interface d'ajout d'une annonce
                            widget.baseController
                                .changePage(ConstantsValues.addAnnonces);
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
                      SizedBox(
                        height: Dimensions.height10,
                      ),
                      const Divider(),
                      SizedBox(
                        height: Dimensions.height10,
                      ),
                      // Nom
                      TextFieldsWidget(
                        icon: Icons.person_outline,
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
                        icon: Icons.person_outline,
                        label: "Prénoms",
                        hintText: "Entrer votre prénoms",
                        textInputType: TextInputType.name,
                        controller: _prenoms,
                      ),

                      SizedBox(
                        height: Dimensions.height10 * 2,
                      ),
                      IntlPhoneFieldsComponent(
                        label: "Numéro WhatsApp",
                        hintText: "Entrer un numéro",
                        controller: _whatsapp,
                      ),
                      SizedBox(
                        height: Dimensions.height10 * 2,
                      ),
                      // Téléphone
                      IntlPhoneFieldsComponent(
                        label: "Numéro Téléphone",
                        hintText: "Entrer un numéro",
                        controller: _telephone,
                      ),
                      SizedBox(
                        height: Dimensions.height10 * 2,
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
                        onTap: () {
                          // Mettre à jours les informations personnelles
                          Map<String, dynamic> data = {
                            'nom': _nom.text,
                            'prenoms': _prenoms.text,
                            'whatsapp': _whatsapp.text,
                            'telephone': _telephone.text,
                            'description': _description.text,
                          };
                          widget.demarcheurController.updateInformation(data);
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
                                  width: Dimensions.width10,
                                ),
                                const Icon(
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
                        onTap: () {
                          // Mise à jours du mot de passe
                          Map<String, dynamic> data = {
                            'password': _password.text,
                            'password_confirmation': _confirmPassword.text,
                          };
                          widget.demarcheurController.updatePassWord(data);
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
                                width: Dimensions.width10,
                              ),
                              const Icon(
                                Icons.key_rounded,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.height10 * 3,
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
                          // Map<String, dynamic> data = {
                          //   'password': _passwordCompte.text
                          // };
                          // var result = await widget.demarcheurController
                          //     .deteleAcount(data);
                          // print(result);
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
                            text:
                                "Confirmation de la suppression".toUpperCase(),
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
    });
  }
}
