import 'package:conforthourse/colors.dart';
import 'package:conforthourse/widgets/big_text.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  final int page;
  const AppBarWidget({super.key, this.page = 1});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      height: 55,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (page != 1)
            Container(
              padding: const EdgeInsets.only(top: 10),
              child: InkWell(
                onTap: () {},
                child: Icon(
                  Icons.arrow_back,
                  color: AppColors.textColor,
                  size: 26,
                ),
              ),
            ),
          Container(
            padding: const EdgeInsets.only(left: 5),
            child: const BigTextWidget(
              text: 'ConforthOurse',
              sizeText: 22,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 10),
            child: InkWell(
              onTap: () {},
              child: Icon(
                Icons.menu,
                color: AppColors.textColor,
                size: 30,
              ),
            ),
          )
        ],
      ),
    );
  }
}
