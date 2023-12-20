import 'package:conforthourse/colors.dart';
import 'package:conforthourse/controllers/demarcheur_controller.dart';
import 'package:conforthourse/models/demarcheur.dart';
import 'package:conforthourse/screens/security/login.dart';
import 'package:conforthourse/widgets/big_text.dart';
import 'package:conforthourse/widgets/bottom_navigation.dart';
import 'package:conforthourse/widgets/header_section.dart';
import 'package:conforthourse/widgets/label_form.dart';
import 'package:conforthourse/widgets/simple_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:select_form_field/select_form_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
  late bool obscureTextPassword;
  late bool obscureTextConfirmPassword;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    obscureTextPassword = true;
    obscureTextConfirmPassword = true;
  }

  Future<void> register(context, Demarcheur demarcheur) async {
    var result = await DemarcheurController.register(demarcheur);
    print(result);
    if (result) {
      // L'inscription marche
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return LoginPage();
      }));
    } else {
      // L'inscription en marche pas
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return RegisterPage();
      }));
    }
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
                              child: const LabelFormWidget(label: "Nom"),
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
                              child: LabelFormWidget(label: "Prénoms"),
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
                              child: LabelFormWidget(label: "Pays"),
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
                              child: LabelFormWidget(label: "Ville"),
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
                              child: LabelFormWidget(label: "Sexe"),
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
                              child:
                                  LabelFormWidget(label: "Numéro de téléphone"),
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
                                child: LabelFormWidget(
                                  label: "Numéro Whatsapp",
                                )),
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
                                child: LabelFormWidget(
                                  label: "Adresse email",
                                )),
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
                                child: LabelFormWidget(
                                  label: 'Mot de passe',
                                )),
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
                                      obscureText: obscureTextPassword,
                                      decoration: const InputDecoration(
                                        hintText: "**********",
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        obscureTextPassword =
                                            !obscureTextPassword;
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.visibility,
                                      color: Colors.grey,
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
                                child: LabelFormWidget(
                                  label: "Confirmation du mot de passe",
                                )),
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
                                      obscureText: obscureTextConfirmPassword,
                                      decoration: const InputDecoration(
                                        hintText: "**********",
                                        border: InputBorder.none,
                                      ),
                                      validator: (value) {
                                        if (value != _psd.value.text) {
                                          return "Les mots de passe ne sont pas identique";
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        obscureTextConfirmPassword =
                                            !obscureTextConfirmPassword;
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.visibility,
                                      color: Colors.grey,
                                    ),
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
                                  register(context, demarcheur);
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

void messanger(context, text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: SimpleTextWidget(
        text: text,
      ),
    ),
  );
}
