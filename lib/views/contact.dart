import 'package:conforthourse/utils/colors.dart';
import 'package:conforthourse/widgets/big_text.dart';
import 'package:conforthourse/widgets/header_section.dart';
import 'package:conforthourse/widgets/simple_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nom = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _subject = TextEditingController();
  final TextEditingController _message = TextEditingController();
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
              HeaderSectionWidget(text: "CONTACTEZ NOUS"),
              Container(
                height: 500,
                width: double.infinity,
                child: Stack(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      height: 500,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.17,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 70,
                                  height: 70,
                                  decoration: BoxDecoration(
                                    color: AppColors.secondColor,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Icon(
                                    Icons.location_on_outlined,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        height: 50,
                                        alignment: Alignment.topLeft,
                                        child: BigTextWidget(
                                          text: "Localisation",
                                          sizeText: 30,
                                          height: 0,
                                          textColor: AppColors.textColor,
                                          textAlign: TextAlign.end,
                                        ),
                                      ),
                                      Container(
                                        height: 20,
                                        alignment: Alignment.topLeft,
                                        child: SimpleTextWidget(
                                          text: "Cotonou, Bénin",
                                          height: 0,
                                          textColor: AppColors.textColor,
                                          fontWeight: FontWeight.w400,
                                          textAlign: TextAlign.start,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.17,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 70,
                                  height: 70,
                                  decoration: BoxDecoration(
                                    color: AppColors.secondColor,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Icon(
                                    Icons.phone_outlined,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        height: 50,
                                        alignment: Alignment.topLeft,
                                        child: BigTextWidget(
                                          text: "Téléphone",
                                          sizeText: 30,
                                          height: 0,
                                          textColor: AppColors.textColor,
                                          textAlign: TextAlign.end,
                                        ),
                                      ),
                                      Container(
                                        height: 20,
                                        alignment: Alignment.topLeft,
                                        child: SimpleTextWidget(
                                          text: "+229 98 74 14 37",
                                          height: 0,
                                          textColor: AppColors.textColor,
                                          fontWeight: FontWeight.w400,
                                          textAlign: TextAlign.start,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.17,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 70,
                                  height: 70,
                                  decoration: BoxDecoration(
                                    color: AppColors.secondColor,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Icon(
                                    Icons.email_outlined,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        height: 50,
                                        alignment: Alignment.topLeft,
                                        child: BigTextWidget(
                                          text: "Adresse email",
                                          sizeText: 30,
                                          height: 0,
                                          textColor: AppColors.textColor,
                                          textAlign: TextAlign.end,
                                        ),
                                      ),
                                      Container(
                                        height: 20,
                                        alignment: Alignment.topLeft,
                                        child: SimpleTextWidget(
                                          text: "contact@affectlac.com ",
                                          height: 0,
                                          textColor: AppColors.textColor,
                                          fontWeight: FontWeight.w400,
                                          textAlign: TextAlign.start,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.17,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 70,
                                  height: 70,
                                  decoration: BoxDecoration(
                                    color: AppColors.secondColor,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Icon(
                                    Icons.punch_clock_sharp,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        height: 50,
                                        alignment: Alignment.topLeft,
                                        child: BigTextWidget(
                                          text: "Ouverture",
                                          sizeText: 35,
                                          height: 0,
                                          textColor: AppColors.textColor,
                                          textAlign: TextAlign.end,
                                        ),
                                      ),
                                      Container(
                                        height: 20,
                                        alignment: Alignment.topLeft,
                                        child: SimpleTextWidget(
                                          text: "7J/7 et 24H/24",
                                          height: 0,
                                          textColor: AppColors.textColor,
                                          fontWeight: FontWeight.w400,
                                          textAlign: TextAlign.start,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 0,
                      bottom: 0,
                      left: 10,
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
              SizedBox(
                height: 40,
              ),
              Container(
                width: double.maxFinite,
                height: 800,
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        child: BigTextWidget(
                          text: "Contactez-nous",
                          textAlign: TextAlign.start,
                          sizeText: 28,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: SimpleTextWidget(
                          text:
                              "Nous sommes là pour répondre à tous vos besoins. N'hésitez pas à nous contacter en utilisant le formulaire ci-dessous. Nous serons ravis de vous aider et de vous fournir les informations nécessaires.",
                          textAlign: TextAlign.start,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: double.maxFinite,
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Votre nom",
                            labelText: "Votre nom",
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Entrer un  nom valide";
                            }
                            return null;
                          },
                          controller: _nom,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: double.maxFinite,
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Votre adresses email",
                            labelText: "Votre adresses email",
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Entrer un email valide";
                            }
                            return null;
                          },
                          controller: _email,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: double.maxFinite,
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Votre sujet",
                            labelText: "Votre sujet",
                            border: OutlineInputBorder(),
                          ),
                          controller: _subject,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Entrer un sujet valide";
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Entrer votre message",
                            labelText: "Entrer votre message",
                            border: OutlineInputBorder(),
                          ),
                          maxLines: null,
                          minLines: 5,
                          maxLength: 1000,
                          controller: _message,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Entrer un message valide";
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          color: AppColors.secondColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              print(_nom.value.text);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: SimpleTextWidget(
                                    text: "Enregistrement en cours",
                                    textColor: Colors.white,
                                  ),
                                ),
                              );
                            }
                          },
                          child: Row(children: [
                            BigTextWidget(
                              text: "Envoyez votre message",
                              textColor: Colors.white,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              CupertinoIcons.paperplane,
                              color: Colors.white,
                            )
                          ]),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
