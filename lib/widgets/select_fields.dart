import 'package:conforthourse/utils/colors.dart';
import 'package:conforthourse/utils/dimensions.dart';
import 'package:conforthourse/widgets/label_form.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

String? selectedValue;

class SelectFieldsWidget extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final String label;
  final List<String> items;
  final void Function(String?) onValueChanged;
  const SelectFieldsWidget({
    super.key,
    required this.hintText,
    required this.icon,
    required this.label,
    required this.items,
    required this.onValueChanged,
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
          height: 50,
          child: DropdownButtonFormField2<String>(
            isExpanded: true,
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: Dimensions.height10),
              enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: AppColors.textColor.withOpacity(0.4)),
                  borderRadius: BorderRadius.circular(Dimensions.radius10)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.secondColor),
                  borderRadius: BorderRadius.circular(Dimensions.radius10)),
              prefixIcon: Icon(icon),
            ),
            hint: Text(
              hintText,
              style: TextStyle(fontSize: Dimensions.fontsize16),
            ),
            items: items
                .map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: TextStyle(
                          fontSize: Dimensions.fontsize16,
                        ),
                      ),
                    ))
                .toList(),
            validator: (value) {
              if (value == null) {
                return 'Please select gender.';
              }
              return null;
            },
            onChanged: (value) {
              onValueChanged(value);
            },
            onSaved: (value) {
              selectedValue = value.toString();
            },
            buttonStyleData: ButtonStyleData(
              padding: EdgeInsets.only(right: Dimensions.width10),
            ),
            iconStyleData: IconStyleData(
              icon: Icon(
                Icons.arrow_drop_down,
                color: Colors.black45,
              ),
              iconSize: Dimensions.height10 * 5 / 2,
            ),
            dropdownStyleData: DropdownStyleData(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius10),
              ),
            ),
            menuItemStyleData: MenuItemStyleData(
              padding:
                  EdgeInsets.symmetric(horizontal: Dimensions.height10 * 2),
            ),
          ),
        ),
      ],
    );
  }
}
