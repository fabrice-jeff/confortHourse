import 'package:conforthourse/utils/colors.dart';
import 'package:conforthourse/utils/dimensions.dart';
import 'package:conforthourse/widgets/label_form.dart';
import 'package:flutter/material.dart';

class TextFieldsWidget extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputType textInputType;
  final bool obscureText;
  final IconData icon;
  final String label;
  final bool suffixIcon;
  const TextFieldsWidget({
    super.key,
    required this.hintText,
    required this.textInputType,
    this.obscureText = false,
    required this.icon,
    required this.label,
    required this.controller,
    this.suffixIcon = false,
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
          height: Dimensions.height10 * 5,
          width: double.maxFinite,
          child: TextFormField(
            controller: controller,
            obscureText: obscureText,
            keyboardType: textInputType,
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: Dimensions.height10 * 1.5),
              prefixIcon: Icon(icon),
              suffixIcon: (suffixIcon)
                  ? const Icon(Icons.arrow_drop_down_outlined)
                  : null,
              enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: AppColors.textColor.withOpacity(0.4)),
                  borderRadius: BorderRadius.circular(Dimensions.radius10)),
              hintText: hintText,
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.secondColor),
                  borderRadius: BorderRadius.circular(Dimensions.radius10)),
            ),
          ),
        ),
      ],
    );
  }
}
