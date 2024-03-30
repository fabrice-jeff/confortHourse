import 'package:flutter/material.dart';
import '../modules/base/controllers/base_controller.dart';
import '../utils/colors.dart';
import '../utils/constants.dart';
import 'simple_text.dart';

class ButtonAddAnnonceWidget extends StatelessWidget {
  final BaseController baseController;
  const ButtonAddAnnonceWidget({
    super.key,
    required this.baseController,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: InkWell(
        onTap: () {
          baseController.changePage(ConstantsValues.ADD_ANNONCE);
        },
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 5,
          ),
          height: 47,
          width: MediaQuery.of(context).size.width * 0.65,
          decoration: BoxDecoration(
            color: AppColors.secondColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add_circle_outline_rounded,
                color: Colors.white,
              ),
              SizedBox(
                width: 5,
              ),
              SimpleTextWidget(
                text: "Ajouter une annonce",
                textColor: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
