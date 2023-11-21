import 'package:conforthourse/colors.dart';
import 'package:conforthourse/widgets/big_text.dart';
import 'package:conforthourse/widgets/bottom_navigation.dart';
import 'package:conforthourse/widgets/header_section.dart';
import 'package:conforthourse/widgets/simple_text.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              HeaderSectionWidget(text: "Connexion"),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                padding:
                    EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    SimpleTextWidget(
                      text: 'ConfortHourse',
                      sizeText: 13,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SimpleTextWidget(text: 'Connectez-vous à votre compte'),
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
                      margin: EdgeInsets.only(top: 10),
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 0.4, color: Colors.grey),
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
                                  border: InputBorder.none),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
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
                      margin: const EdgeInsets.only(top: 10),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 0.4, color: Colors.grey),
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
                                  border: InputBorder.none),
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
                      onTap: () {},
                      child: Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        height: 40,
                        margin: const EdgeInsets.only(bottom: 5),
                        decoration: BoxDecoration(
                          color: AppColors.secondColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 7),
                              child: Icon(
                                Icons.download_sharp,
                                color: Colors.white,
                                size: 18,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 5,
                              ),
                              child: SimpleTextWidget(
                                text: "Se Connecter",
                                textColor: Colors.white,
                                fontWeight: FontWeight.w500,
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
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}
