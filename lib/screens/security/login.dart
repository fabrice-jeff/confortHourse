import 'package:conforthourse/colors.dart';
import 'package:conforthourse/constants.dart';
import 'package:conforthourse/controllers/demarcheur_controller.dart';
import 'package:conforthourse/widgets/big_text.dart';
import 'package:conforthourse/widgets/bottom_navigation.dart';
import 'package:conforthourse/widgets/header_section.dart';
import 'package:conforthourse/widgets/simple_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPagState();
}

class _LoginPagState extends State<LoginPage> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  Future<void> login(context, Map<String, String> data) async {
    var result = await DemarcheurController.login(data);
    print(result);
    if (result == ConstantsValues.CORRECT_PSD) {
      // LE MOT DE PASSE EST CORRECT
      print("LE MOT DE PASSE EST CORRECT");
    } else if (result == ConstantsValues.INCORRECT_PSD) {
      // LE MOT DE PASSE EST INCORRECT
      print("LE MOT DE PASSE EST INCORRECT");
    } else if (result == ConstantsValues.NO_USER) {
      // L'UTILISATEUR N'EXISTE PAS DANS LA BASE DE DONNÉE
      print(" L'UTILISATEUR N'EXISTE PAS DANS LA BASE DE DONNÉE");
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
              HeaderSectionWidget(text: "CONNEXION"),
              Container(
                height: 490,
                margin: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                width: double.infinity,
                child: Stack(
                  children: [
                    Form(
                      key: _formkey,
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
                                text: 'Connectez-vous à votre compte'),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              child: SimpleTextWidget(
                                text: "Adresse email",
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
                                    Icons.mail_outline,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: const InputDecoration(
                                        hintText: "Votre adresse email",
                                        border: InputBorder.none,
                                      ),
                                      // validator: (value) {
                                      //   if (value == null || value.isEmpty) {
                                      //     return 'Entrer un mail valide';
                                      //   }
                                      // },
                                      controller: _email,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              child: SimpleTextWidget(
                                text: "Mot de passe",
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
                                      decoration: const InputDecoration(
                                        hintText: "Votre mot de passe",
                                        border: InputBorder.none,
                                      ),
                                      controller: _password,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              alignment: Alignment.topLeft,
                              child: TextButton(
                                child: SimpleTextWidget(
                                  text: "Mot de passe oublié ?",
                                  sizeText: 13,
                                  textColor: AppColors.secondColor,
                                  fontWeight: FontWeight.w300,
                                ),
                                onPressed: () {},
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                if (_formkey.currentState!.validate()) {
                                  Map<String, String> data = {
                                    'email': _email.value.text,
                                    'password': _password.value.text
                                  };
                                  login(context, data);
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
                                      CupertinoIcons.arrow_right_to_line_alt,
                                      color: Colors.white,
                                      size: 18,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 5,
                                      ),
                                      child: SimpleTextWidget(
                                        text: "Se Connecter",
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SimpleTextWidget(
                                  text: "Pas de compte ?",
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: SimpleTextWidget(
                                    text: "S'inscrire",
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
