import 'package:flutter/material.dart';

import '../../../utils/colors.dart';
import '../../../widgets/header_section.dart';
import '../../../widgets/question_faqs.dart';

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
                height: 400 * 6,
                child: ListView.builder(
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
