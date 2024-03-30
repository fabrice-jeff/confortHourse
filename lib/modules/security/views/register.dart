import 'package:conforthourse/modules/base/controllers/base_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/intl_phone_field.dart';
import '../../../utils/colors.dart';
import '../../../utils/constants.dart';
import '../../../utils/dimensions.dart';
import '../../../widgets/big_text.dart';
import '../../../widgets/header_section.dart';
import '../../../widgets/select_fields.dart';
import '../../../widgets/simple_text.dart';
import '../../../widgets/text_fields.dart';
import '../controllers/security_controller.dart';
import 'login.dart';

class RegisterView extends GetView<SecurityController> {
  final BaseController? baseController;
  RegisterView({super.key, BaseController? baseController})
      : baseController = baseController ?? Get.arguments?['baseController'];
  @override
  Widget build(BuildContext context) {
    Get.put(SecurityController());
    print(baseController!.paysArray);
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: RegisterForm(
            controller: controller,
            baseController: baseController,
          ),
        ),
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {
  final SecurityController controller;
  final BaseController? baseController;
  const RegisterForm(
      {super.key, required this.controller, this.baseController});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final List<String> gendersItems = ['Homme', 'Femme', 'Autre'];
  final _key = GlobalKey<FormState>();

  late TextEditingController _nom;
  late TextEditingController _prenoms;
  late TextEditingController _ville;
  late TextEditingController _numeroTelephone;
  late TextEditingController _numeroWhatsapp;
  late TextEditingController _email;
  late TextEditingController _psd;
  late TextEditingController _confirmPsd;
  String? _paysChoise;
  String? _genre;

  @override
  void initState() {
    _nom = TextEditingController();
    _prenoms = TextEditingController();
    _ville = TextEditingController();
    _numeroTelephone = TextEditingController();
    _numeroWhatsapp = TextEditingController();
    _email = TextEditingController();
    _psd = TextEditingController();
    _confirmPsd = TextEditingController();
    super.initState();
  }

  void handleSelectValuePays(String? selectedValue) {
    _paysChoise = selectedValue;
  }

  void handleSelectValueSexe(String? selectedValue) {
    _genre = selectedValue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        shadowColor: AppColors.backgroundColor,
        backgroundColor: AppColors.backgroundColor,
        title: BigTextWidget(
          text: ConstantsValues.appName.toUpperCase(),
          fontWeight: FontWeight.bold,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              HeaderSectionWidget(text: "INSCRIPTION"),
              Container(
                margin: EdgeInsets.symmetric(horizontal: Dimensions.width10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(Dimensions.radius10),
                ),
                width: double.infinity,
                child: Stack(
                  children: [
                    Form(
                      key: _key,
                      child: Container(
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(
                            horizontal: Dimensions.width10,
                            vertical: Dimensions.height10),
                        padding: EdgeInsets.symmetric(
                            horizontal: Dimensions.width10,
                            vertical: Dimensions.height10 * 2),
                        child: Column(
                          children: [
                            SimpleTextWidget(
                              text: ConstantsValues.appName,
                              sizeText: Dimensions.fontsize13,
                            ),
                            SizedBox(
                              height: Dimensions.height10,
                            ),
                            SimpleTextWidget(
                                textAlign: TextAlign.center,
                                text:
                                    'Rejoignez notre communauté en vous inscrivant dès  maintenant !'),
                            SizedBox(
                              height: Dimensions.height10 * 2,
                            ),
                            //Nom de la personne
                            TextFieldsWidget(
                              hintText: "Votre nom",
                              textInputType: TextInputType.name,
                              icon: Icons.person_outline,
                              label: "Nom",
                              controller: _nom,
                            ),

                            SizedBox(
                              height: Dimensions.height10 * 2,
                            ),
                            //Prénoms de la personne
                            TextFieldsWidget(
                              hintText: "Vos prénoms",
                              textInputType: TextInputType.name,
                              icon: Icons.person_outline,
                              label: "Prénoms",
                              controller: _prenoms,
                            ),
                            SizedBox(
                              height: Dimensions.height10 * 2,
                            ),
                            //Pays
                            SelectFieldsWidget(
                              hintText: "Votre pays",
                              icon: CupertinoIcons.globe,
                              label: "Pays",
                              items: widget.baseController!.paysArray,
                              onValueChanged: handleSelectValuePays,
                            ),
                            SizedBox(
                              height: Dimensions.height10 * 2,
                            ),
                            //Ville
                            TextFieldsWidget(
                              hintText: "Votre Ville",
                              textInputType: TextInputType.name,
                              icon: Icons.castle_outlined,
                              label: "Ville",
                              controller: _ville,
                            ),

                            SizedBox(
                              height: Dimensions.height10 * 2,
                            ),
                            //Sexe
                            SelectFieldsWidget(
                              hintText: "Votre sexe",
                              icon: Icons.nature_outlined,
                              label: "Sexe",
                              items: gendersItems,
                              onValueChanged: handleSelectValueSexe,
                            ),
                            SizedBox(
                              height: Dimensions.height10 * 2,
                            ),
                            //Numéro de téléphone

                            IntlPhoneFieldsComponent(
                              label: "Numéro de téléphone",
                              hintText: "Votre numéro de téléphone",
                              controller: _numeroTelephone,
                            ),
                            SizedBox(
                              height: Dimensions.height10 * 2,
                            ),
                            // Numéro Whatsapp

                            IntlPhoneFieldsComponent(
                              label: "Numéro Whatsapp",
                              hintText: "Votre numéro Whatsapp",
                              controller: _numeroWhatsapp,
                            ),
                            SizedBox(
                              height: Dimensions.height10 * 2,
                            ),

                            //Adresse email
                            TextFieldsWidget(
                              hintText: "Votre adresse Email",
                              textInputType: TextInputType.name,
                              icon: Icons.email_outlined,
                              label: "Adresse Email",
                              controller: _email,
                            ),
                            SizedBox(
                              height: Dimensions.height10 * 2,
                            ),
                            // Mot de passe
                            TextFieldsWidget(
                              obscureText: true,
                              label: "Mot de passe",
                              hintText: "*********",
                              icon: Icons.lock_outline,
                              textInputType: TextInputType.visiblePassword,
                              controller: _psd,
                            ),
                            SizedBox(
                              height: Dimensions.height10 * 2,
                            ),
                            // Confirmation Mot de passe
                            TextFieldsWidget(
                              obscureText: true,
                              label: "Confirmation du mot de passe",
                              hintText: "*********",
                              icon: Icons.lock_outline,
                              textInputType: TextInputType.visiblePassword,
                              controller: _confirmPsd,
                            ),
                            SizedBox(
                              height: Dimensions.height10 * 2,
                            ),

                            InkWell(
                              onTap: () {
                                if (_key.currentState!.validate()) {
                                  Map<String, dynamic> data = {
                                    'nom': _nom.text,
                                    'prenoms': _prenoms.text,
                                    'email': _email.text,
                                    'telephone': _numeroTelephone.text,
                                    'sexe': _genre,
                                    'whatsapp': _numeroWhatsapp.text,
                                    'ville': _ville.text,
                                    'password': _psd.text,
                                    'pays': _paysChoise,
                                    'password_confirmation': _confirmPsd.text
                                  };

                                  widget.controller.register(data);
                                }
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: double.infinity,
                                height: Dimensions.height10 * 5,
                                decoration: BoxDecoration(
                                  color: AppColors.secondColor,
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.radius10),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(CupertinoIcons.paperplane,
                                        color: Colors.white,
                                        size: Dimensions.height10 * 2),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: Dimensions.width10 / 2,
                                      ),
                                      child: SimpleTextWidget(
                                        text: "S'inscrire",
                                        height: 0,
                                        textColor: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: Dimensions.height10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SimpleTextWidget(
                                  text: "Vous avez un compte ?",
                                  height: 0,
                                ),
                                SizedBox(
                                  height: Dimensions.height10,
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(builder: (context) {
                                        return LoginView();
                                      }),
                                    );
                                  },
                                  child: SimpleTextWidget(
                                    text: "Se connecter",
                                    height: 0,
                                    textColor: AppColors.secondColor,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: Dimensions.height10 * 2,
                      bottom: Dimensions.height10 * 2,
                      left: 0,
                      child: Container(
                        height: double.infinity,
                        width: Dimensions.height10 / 5,
                        decoration: BoxDecoration(
                          color: AppColors.secondColor,
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius10),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Dimensions.height10 * 3,
              )
            ],
          ),
        ),
      ),
    );
  }
}

void messanger(context, text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: SimpleTextWidget(
        text: text,
      ),
    ),
  );
}
