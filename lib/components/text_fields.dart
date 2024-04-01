import 'package:flutter/material.dart';

import '../utils/colors.dart';
import 'label_form.dart';

class TextFieldsWidget extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputType textInputType;
  final bool obscureText;
  final IconData? icon;
  final String label;
  final Color enabledBorderColor;
  final bool suffixIcon;
  const TextFieldsWidget({
    super.key,
    required this.hintText,
    required this.textInputType,
    this.obscureText = false,
    this.icon = null,
    required this.label,
    required this.controller,
    this.suffixIcon = false,
    this.enabledBorderColor = Colors.black38,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          child: LabelFormWidget(label: label),
        ),
        Container(
          width: double.infinity,
          child: TextFormField(
            controller: controller,
            keyboardType: textInputType,
            obscureText: obscureText,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 10),
              prefixIcon: Icon(
                icon,
                color: AppColors.textColor,
              ),
              hintText: hintText,
              hintStyle: TextStyle(color: AppColors.textColor),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: enabledBorderColor,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.backgroundColor,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
