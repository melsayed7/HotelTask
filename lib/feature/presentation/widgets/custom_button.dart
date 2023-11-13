import 'package:flutter/material.dart';

import '../../../core/app_color.dart';
import '../../../core/app_string.dart';


class CustomButton extends StatelessWidget {
  const CustomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        width: MediaQuery
            .of(context)
            .size
            .width * .87,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: AppColors.amberColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppStrings.findHotels,
              style: TextStyle(
                fontSize: 25,
                color: AppColors.whiteColor,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Icon(
              Icons.search_rounded,
              color: AppColors.whiteColor,
              size: 30,
            ),
          ],
        ),
      ),
    );
  }
}
