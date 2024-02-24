import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/colors.dart';
import '../../../utils/dimensions.dart';
import '../../../widgets/big_text.dart';
import '../../../widgets/header_section.dart';
import '../../../widgets/simple_text.dart';
import '../../../widgets/text_fields.dart';
import '../controllers/security_controller.dart';
import 'register.dart';

class LoginView extends GetView<SecurityController> {
  const LoginView();
  @override
  Widget build(BuildContext context) {
    Get.put(SecurityController());
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: LoginForm(
            controller: controller,
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  final SecurityController controller;
  const LoginForm({super.key, required this.controller});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _key = GlobalKey<FormState>();
  TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
                                  widget.controller.login(data);
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
                                        return RegisterView();
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
    );
  }
}
