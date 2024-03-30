import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';
import '../widgets/label_form.dart';

class IntlPhoneFieldsComponent extends StatelessWidget {
  final String hintText;
  final TextInputType textInputType;
  final TextEditingController controller;
  final Color enabledBorderColor;
  final String label;
  const IntlPhoneFieldsComponent({
    super.key,
    required this.label,
    required this.hintText,
    this.textInputType = TextInputType.name,
    required this.controller,
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
          height: Dimensions.height10 * 5,
          width: double.infinity,
          child: IntlPhoneField(
            initialCountryCode: "BJ",
            controller: controller,
            focusNode: FocusNode(),
            decoration: InputDecoration(
              counter: null,
              counterText: '',
              contentPadding: EdgeInsets.symmetric(vertical: 10),
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
            languageCode: "fr",
            onChanged: (phone) {
              print(phone.completeNumber);
            },
            onCountryChanged: (country) {
              print('Country changed to: ' + country.name);
            },
            searchText: "Sélectionner un pays",
          ),
        ),
      ],
    );
  }
}
