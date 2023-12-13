import 'package:conforthourse/widgets/simple_text.dart';
import 'package:flutter/material.dart';

class FieldsWidget extends StatelessWidget {
  final String label;
  final bool? important;
  final IconData? icon;
  final String? hint;
  FieldsWidget({
    super.key,
    required this.label,
    this.icon,
    this.hint = " bb",
    this.important = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Container(
          alignment: Alignment.topLeft,
          child: SimpleTextWidget(
            text: label,
            sizeText: 13,
          ),
        ),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 10),
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 0.4, color: Colors.grey),
          ),
          child: Row(
            children: [
              Icon(
                Icons.person_outline,
                color: Colors.grey,
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    hintText: "hint",
                    border: InputBorder.none,
                  ),
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
