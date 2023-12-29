import 'package:conforthourse/colors.dart';
import 'package:conforthourse/constants.dart';
import 'package:conforthourse/controllers/demarcheur_controller.dart';
import 'package:conforthourse/dimensions.dart';
import 'package:conforthourse/providers/user_login.dart';
import 'package:conforthourse/screens/demarcheurs/dashboard.dart';
import 'package:conforthourse/screens/security/register.dart';
import 'package:conforthourse/widgets/big_text.dart';
import 'package:conforthourse/widgets/bottom_navigation.dart';
import 'package:conforthourse/widgets/header_section.dart';
import 'package:conforthourse/widgets/simple_text.dart';
import 'package:conforthourse/widgets/text_fields.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPagState();
}

class _LoginPagState extends State<LoginPage> {
  final _key = GlobalKey<FormState>();
  TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  Future<bool> login(BuildContext context, Map<String, String> data) async {
    var result = await DemarcheurController.login(data);
    var email = data['email'] as String;

    if (result == ConstantsValues.CORRECT_PSD) {
      // LE MOT DE PASSE EST CORRECT
      print("LE MOT DE PASSE EST CORRECT");
      context.read<UserLogin>().connect(email);
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return DashboardPage();
      }));
    } else if (result == ConstantsValues.INCORRECT_PSD) {
      // LE MOT DE PASSE EST INCORRECT
      print("LE MOT DE PASSE EST INCORRECT");
    } else if (result == ConstantsValues.NO_USER) {
      // L'UTILISATEUR N'EXISTE PAS DANS LA BASE DE DONNÉE
      print(" L'UTILISATEUR N'EXISTE PAS DANS LA BASE DE DONNÉE");
    }
    return false;
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
                                text: 'Connectez-vous à votre compte'),
                            SizedBox(
                              height: Dimensions.height10 * 2,
                            ),
                            //Nom de la personne
                            TextFieldsWidget(
                              label: "Adresse email",
                              hintText: "Votre adresse email",
                              icon: Icons.email_outlined,
                              textInputType: TextInputType.emailAddress,
                              controller: _email,
                            ),
                            SizedBox(
                              height: Dimensions.height10 * 2,
                            ),
                            TextFieldsWidget(
                              obscureText: true,
                              label: "Mot de passe",
                              hintText: "Votre mot de passe",
                              icon: Icons.lock_outline,
                              textInputType: TextInputType.visiblePassword,
                              controller: _password,
                            ),

                            SizedBox(
                              height: Dimensions.height10 * 3,
                            ),
                            InkWell(
                              onTap: () {
                                if (_key.currentState!.validate()) {
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
                                height: Dimensions.height10 * 5,
                                decoration: BoxDecoration(
                                  color: AppColors.secondColor,
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.radius10),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.login,
                                      color: Colors.white,
                                      size: Dimensions.height10 * 2,
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
                                        sizeText: Dimensions.fontsize16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            SizedBox(
                              height: Dimensions.height10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SimpleTextWidget(
                                  text: "Pas de compte ?",
                                ),
                                SizedBox(
                                  width: Dimensions.width10,
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(builder: (context) {
                                        return RegisterPage();
                                      }),
                                    );
                                  },
                                  child: SimpleTextWidget(
                                    text: "S'inscrire",
                                    textColor: AppColors.secondColor,
                                  ),
                                )
                              ],
                            ),
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
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}
