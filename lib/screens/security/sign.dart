import 'package:conforthourse/colors.dart';
import 'package:conforthourse/widgets/big_text.dart';
import 'package:conforthourse/widgets/bottom_navigation.dart';
import 'package:conforthourse/widgets/header_section.dart';
import 'package:conforthourse/widgets/simple_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignPage extends StatefulWidget {
  const SignPage({super.key});

  @override
  State<SignPage> createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {
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
                height: 1000,
                margin: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                width: double.infinity,
                child: Stack(
                  children: [
                    Form(
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
                              height: 20,
                            ),
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
                                      decoration: const InputDecoration(
                                        hintText: "Vos prénoms",
                                        border: InputBorder.none,
                                      ),
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
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: DropdownButtonFormField(
                                      onTap: () {},
                                      items: [
                                        DropdownMenuItem(
                                          child:
                                              SimpleTextWidget(text: 'Bénin'),
                                        ),
                                        DropdownMenuItem(
                                          child: SimpleTextWidget(text: 'Togo'),
                                        ),
                                        DropdownMenuItem(
                                          child:
                                              SimpleTextWidget(text: 'Ghana'),
                                        ),
                                        DropdownMenuItem(
                                          child: SimpleTextWidget(
                                              text: 'Cot d\'ivoire'),
                                        ),
                                        DropdownMenuItem(
                                          child:
                                              SimpleTextWidget(text: 'Bénin'),
                                        ),
                                      ],
                                      onChanged: null,
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
                                      validator: (value) {
                                        if (value == null) {
                                          return "Entrer un mot de passe";
                                        }
                                      },
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
