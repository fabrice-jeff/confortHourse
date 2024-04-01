import 'package:flutter/material.dart';

import '../../../utils/colors.dart';
import '../../../utils/constants.dart';
import '../../../components/big_text.dart';
import '../../../components/header_section.dart';
import '../../../components/question_faqs.dart';

class FaqsView extends StatefulWidget {
  const FaqsView({super.key});

  @override
  State<FaqsView> createState() => _FaqsViewState();
}

class _FaqsViewState extends State<FaqsView> {
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
              HeaderSectionWidget(text: "FAQ'S"),
              SizedBox(
                height: 20,
              ),
              Container(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 5,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return const QuestionFaqWidget(
                        titre:
                            "Comment puis-je trouver des chambres disponible sur votre application ?",
                        content: "Bonjour le monde de codeur",
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
