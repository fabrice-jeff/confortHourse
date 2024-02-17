import 'package:conforthourse/modules/security/views/login.dart';
import 'package:conforthourse/utils/colors.dart';
import 'package:conforthourse/controllers/demarcheur_controller.dart';
import 'package:conforthourse/utils/dimensions.dart';
import 'package:conforthourse/data/models/demarcheur.dart';
import 'package:conforthourse/widgets/big_text.dart';
import 'package:conforthourse/widgets/bottom_navigation.dart';
import 'package:conforthourse/widgets/header_section.dart';
import 'package:conforthourse/widgets/select_fields.dart';
import 'package:conforthourse/widgets/simple_text.dart';
import 'package:conforthourse/widgets/text_fields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/security_controller.dart';

class RegisterView extends GetView<SecurityController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: RegisterForm(),
        ),
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final List<String> paysItems = [
    'Benin',
    'Mali',
    'Nigeria',
    'Niger',
  ];
  final List<String> gendersItems = ['Homme', 'Femme', 'Autre'];
  final _key = GlobalKey<FormState>();
  TextEditingController _nom = TextEditingController();
  TextEditingController _prenoms = TextEditingController();
  String _paysChoise = "Benin";
  TextEditingController _ville = TextEditingController();
  String _genre = "Homme";
  TextEditingController _numeroTelephone = TextEditingController();
  TextEditingController _numeroWhatsapp = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _psd = TextEditingController();
  TextEditingController _confirmPsd = TextEditingController();
  late bool obscureTextPassword;
  late bool obscureTextConfirmPassword;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    obscureTextPassword = true;
    obscureTextConfirmPassword = true;
  }

  @override
  Widget build(BuildContext context) {
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
                              text: 'ConfortHourse',
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
                              items: paysItems,
                            ),
                            SizedBox(
                              height: Dimensions.height10 * 2,
                            ),
                            //Ville
                            TextFieldsWidget(
                              hintText: "Votre ville",
                              textInputType: TextInputType.name,
                              icon: Icons.location_city_outlined,
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
                            ),
                            SizedBox(
                              height: Dimensions.height10 * 2,
                            ),
                            //Numéro de téléphone
                            TextFieldsWidget(
                              hintText: "Votre numéro de téléphone",
                              textInputType: TextInputType.name,
                              icon: Icons.phone_outlined,
                              label: "Numéro de téléphone",
                              controller: _numeroTelephone,
                            ),
                            SizedBox(
                              height: Dimensions.height10 * 2,
                            ),
                            // Numéro Whatsapp

                            TextFieldsWidget(
                              hintText: "Votre numéro Whatsapp",
                              textInputType: TextInputType.name,
                              icon: Icons.phone_outlined,
                              label: "Numéro Whatsapp",
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
                                  // Création d'un objet de marcheur
                                  var demarcheur = Demarcheur(
                                    nom: _nom.value.text,
                                    prenoms: _prenoms.value.text,
                                    ville: _ville.value.text,
                                    pays: _paysChoise,
                                    sexe: _genre,
                                    telephone: _numeroTelephone.value.text,
                                    email: _email.value.text,
                                    whatsapp: _numeroWhatsapp.value.text,
                                    password: _psd.value.text,
                                  );
                                  //Faire l'enregistrement  du demarcheur dans la base de donnée
                                  // register(context, demarcheur);
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
