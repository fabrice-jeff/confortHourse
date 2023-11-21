import 'package:conforthourse/colors.dart';
import 'package:conforthourse/widgets/simple_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuestionFaqWidget extends StatefulWidget {
  final String titre;
  final String content;
  const QuestionFaqWidget({
    super.key,
    required this.titre,
    required this.content,
  });

  @override
  State<QuestionFaqWidget> createState() => _QuestionFaqWidgetState();
}

class _QuestionFaqWidgetState extends State<QuestionFaqWidget> {
  late double _heigth;
  late IconData _icon;
  final content =
      "Pour trouver des chambres disponibles, il vous suffit d'utiliser notre fonction de recherche en spécifiant vos critères tels que la localisation, ainsi que d'autres préférences. Les résultats afficheront les chambres correspondants à vos critères de recherche.";
  bool open = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _heigth = 100;
    _icon = CupertinoIcons.chevron_down;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: open ? Alignment.topCenter : Alignment.center,
      height: _heigth,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
            child: Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: AppColors.secondColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(
                    Icons.question_mark,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: SimpleTextWidget(
                      text:
                          "Comment puis-je trouver une location sur votre application"),
                ),
                InkWell(
                  child: Icon(_icon),
                  onTap: () {
                    setState(
                      () {
                        open = !open;
                        if (open) {
                          _icon = CupertinoIcons.chevron_up;
                          _heigth = 350;
                        } else {
                          _icon = CupertinoIcons.chevron_down;
                          _heigth = 100;
                        }
                      },
                    );
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          if (open)
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Divider(
                      color: AppColors.secondColor,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: SimpleTextWidget(
                        text: content,
                        textAlign: TextAlign.justify,
                        fontWeight: FontWeight.w300,
                        sizeText: 15,
                      ),
                    )
                  ],
                ),
              ),
            )
        ],
      ),
    );
  }
}
