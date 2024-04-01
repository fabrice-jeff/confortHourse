import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/colors.dart';
import '../../../utils/constants.dart';
import '../../../utils/dimensions.dart';
import '../../../components/big_text.dart';
import '../../../components/header_section.dart';
import '../../../components/simple_text.dart';

class ContactView extends GetView {
  const ContactView();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: ContactForm(),
        ),
      ),
    );
  }
}

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
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
          text: ConstantsValues.appName.toUpperCase(),
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
                          Expanded(
                            child: informationItem(
                              context: context,
                              titre: "Localisation",
                              icon: Icons.location_on_outlined,
                              value: "Cotonou, Bénin",
                            ),
                          ),
                          Expanded(
                            child: informationItem(
                              context: context,
                              titre: "Téléphone",
                              icon: Icons.phone_outlined,
                              value: "+229 98 74 14 37",
                            ),
                          ),
                          Expanded(
                            child: informationItem(
                              context: context,
                              titre: "Adresse email",
                              icon: Icons.email_outlined,
                              value: "contact@affectlac.com",
                            ),
                          ),
                          Expanded(
                            child: informationItem(
                              context: context,
                              titre: "Ouverture",
                              icon: Icons.punch_clock_sharp,
                              value: "7J/7 et 24H/24",
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

Widget informationItem(
    {required BuildContext context,
    required String titre,
    required IconData icon,
    required String value}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 30),
    alignment: Alignment.center,
    height: MediaQuery.of(context).size.height * 0.17,
    decoration: BoxDecoration(
      border: Border.all(color: Colors.white),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            color: AppColors.secondColor,
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Icon(
            icon,
            size: 38,
            color: Colors.white,
          ),
        ),
        SizedBox(
          width: Dimensions.width10 * 3,
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: BigTextWidget(
                    text: titre,
                    sizeText: 22,
                    height: 0,
                    textColor: Colors.black,
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(
                  height: Dimensions.height10,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: SimpleTextWidget(
                    text: value,
                    height: 0,
                    sizeText: 13,
                    textColor: Colors.black,
                    fontWeight: FontWeight.w400,
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
