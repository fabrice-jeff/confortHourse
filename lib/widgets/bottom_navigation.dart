import 'package:conforthourse/colors.dart';
import 'package:flutter/material.dart';

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {},
            child: Icon(
              Icons.search,
              color: AppColors.secondColor,
              size: 30,
            ),
          ),
          InkWell(
            onTap: () {},
            child: Icon(
              Icons.add,
              color: AppColors.secondColor,
              size: 30,
            ),
          ),
          InkWell(
            onTap: () {},
            child: Icon(
              Icons.person_2_outlined,
              color: AppColors.secondColor,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
