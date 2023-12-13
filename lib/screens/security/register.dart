import 'package:conforthourse/colors.dart';
import 'package:conforthourse/widgets/big_text.dart';
import 'package:conforthourse/widgets/bottom_navigation.dart';
import 'package:conforthourse/widgets/header_section.dart';
import 'package:conforthourse/widgets/simple_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:select_form_field/select_form_field.dart';

class SignPage extends StatefulWidget {
  const SignPage({super.key});

  @override
  State<SignPage> createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {
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
  final List<Map<String, dynamic>> _sexe = [
    {
      'value': 'Homme',
      'label': 'Homme',
    },
    {
      'value': 'Femme',
      'label': 'Femme',
    },
    {
      'value': 'Autre',
      'label': 'Autre',
    },
  ];
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
                margin: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                width: double.infinity,
                child: Stack(
                  children: [
                    Form(
                      key: _key,
                      child: Container(
                        width: double.infinity,
                        margin:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        padding: EdgeInsets.only(
                            left: 10, right: 10, top: 20, bottom: 20),
                        child: Column(
                          children: [
                            SimpleTextWidget(
                              text: 'ConfortHourse',
                              sizeText: 13,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SimpleTextWidget(
                                text:
                                    'Rejoignez notre communauté en vous inscrivant dès  maintenant !'),
                            SizedBox(
                              height: 30,
                            ),
                            //Nom
                            Container(
                              alignment: Alignment.topLeft,
                              child: SimpleTextWidget(
                                text: "Nom *",
                                sizeText: 13,
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border:
                                    Border.all(width: 0.4, color: Colors.grey),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.person_outline,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      keyboardType: TextInputType.name,
                                      decoration: const InputDecoration(
                                        hintText: "Votre nom",
                                        border: InputBorder.none,
                                      ),
                                      controller: _nom,
                                      // validator: (value) {
                                      //   if (value == null || value.isEmpty) {
                                      //     return 'Entrer un mail valide';
                                      //   }
                                      // },
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            //Prénoms
                            Container(
                              alignment: Alignment.topLeft,
                              child: SimpleTextWidget(
                                text: "Prénoms *",
                                sizeText: 13,
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border:
                                    Border.all(width: 0.4, color: Colors.grey),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.person_outline,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      keyboardType: TextInputType.name,
                                      controller: _prenoms,
                                      decoration: const InputDecoration(
                                        hintText: "Vos prénoms",
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
                            //Pays
                            Container(
                              alignment: Alignment.topLeft,
                              child: SimpleTextWidget(
                                text: "Pays *",
                                sizeText: 13,
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border:
                                    Border.all(width: 0.4, color: Colors.grey),
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
                                        hintText: "Choisissez un pays",
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
                            //Ville
                            Container(
                              alignment: Alignment.topLeft,
                              child: SimpleTextWidget(
                                text: "Ville *",
                                sizeText: 13,
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border:
                                    Border.all(width: 0.4, color: Colors.grey),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.location_city,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      controller: _ville,
                                      keyboardType: TextInputType.name,
                                      decoration: const InputDecoration(
                                        hintText: "Votre ville",
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
                            //Sexe
                            Container(
                              alignment: Alignment.topLeft,
                              child: SimpleTextWidget(
                                text: "Sexe *",
                                sizeText: 13,
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border:
                                    Border.all(width: 0.4, color: Colors.grey),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.nature_outlined,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: SelectFormField(
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Choisissez un sexe",
                                      ),
                                      type: SelectFormFieldType.dialog,
                                      initialValue: 'circle',
                                      items: _sexe,
                                      onChanged: (val) => _genre = val,
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
                              child: SimpleTextWidget(
                                text:
                                    "Numéro de téléphone (avec indicatif du pays) *",
                                sizeText: 13,
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border:
                                    Border.all(width: 0.4, color: Colors.grey),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.phone_outlined,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      controller: _numeroTelephone,
                                      decoration: const InputDecoration(
                                        hintText: "Votre numéro de téléphone",
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              child: SimpleTextWidget(
                                text:
                                    "Numéro Whatsapp (avec indicatif du pays) *",
                                sizeText: 13,
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border:
                                    Border.all(width: 0.4, color: Colors.grey),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.phone_outlined,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      controller: _numeroWhatsapp,
                                      decoration: const InputDecoration(
                                        hintText: "Votre numéro whatsapp",
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              child: SimpleTextWidget(
                                text: "Adresse email *",
                                sizeText: 13,
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border:
                                    Border.all(width: 0.4, color: Colors.grey),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.email_outlined,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      controller: _email,
                                      decoration: const InputDecoration(
                                        hintText: "Votre adresse email",
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              child: SimpleTextWidget(
                                text: "Mot de passe *",
                                sizeText: 13,
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border:
                                    Border.all(width: 0.4, color: Colors.grey),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.lock_outline,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      controller: _psd,
                                      obscureText: true,
                                      decoration: const InputDecoration(
                                        hintText: "**********",
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    Icons.visibility,
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
                              child: SimpleTextWidget(
                                text: "Confirmation du mot de passe *",
                                sizeText: 13,
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border:
                                    Border.all(width: 0.4, color: Colors.grey),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.lock_outline,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      controller: _confirmPsd,
                                      obscureText: true,
                                      decoration: const InputDecoration(
                                        hintText: "**********",
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    Icons.visibility,
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            InkWell(
                              onTap: () {
                                if (_key.currentState!.validate()) {
                                  print('Nom :  ${_nom.value.text}');
                                  print('Prénoms : ${_prenoms.value.text}');
                                  print('Pays : ${_paysChoise}');
                                  print('Sexe : ${_genre}');
                                  print(
                                      'Numero Téléphone : ${_numeroTelephone.value.text}');
                                  print(
                                      'Numéro whatsApp : ${_numeroWhatsapp.value.text}');
                                  print('Email : ${_email.value.text}');
                                  print('Mot de passe : ${_psd.value.text}');
                                  print(
                                      'Confiirmation Mot de passe : ${_confirmPsd.value.text}');
                                }
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: double.infinity,
                                height: 50,
                                margin: const EdgeInsets.only(bottom: 5),
                                decoration: BoxDecoration(
                                  color: AppColors.secondColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      CupertinoIcons.paperplane,
                                      color: Colors.white,
                                      size: 18,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 5,
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
                              height: 30,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SimpleTextWidget(
                                  text: "Vous avez un compte ?",
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: SimpleTextWidget(
                                    text: "Se connecter",
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
                      top: 20,
                      bottom: 20,
                      left: 0,
                      child: Container(
                        height: double.infinity,
                        width: 3,
                        decoration: BoxDecoration(
                          color: AppColors.secondColor,
                          borderRadius: BorderRadius.circular(10),
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
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}
