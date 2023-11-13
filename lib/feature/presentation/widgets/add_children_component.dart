import 'package:flutter/material.dart';


import '../../../core/app_color.dart';
import '../../../core/app_string.dart';
import 'custom_text.dart';

class AddChildrenComponent extends StatelessWidget {
  AddChildrenComponent(
      {Key? key, required this.numOfChildren, required this.ageOfChild})
      : super(key: key);

  int numOfChildren;
  int ageOfChild;

  @override
  Widget build(BuildContext context) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              text: '${AppStrings.ageOfChild}$numOfChildren',
              color: AppColors.blackColor,
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
            CustomText(
              text: '$ageOfChild years',
              color: AppColors.grayColor,
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
          ],
        );
  }
}
