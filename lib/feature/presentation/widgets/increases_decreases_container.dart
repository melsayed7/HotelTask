import 'package:flutter/material.dart';

import '../../../core/app_color.dart';


class IncreasesDecreasesContainer extends StatelessWidget {
  IconData icon;

  void Function()? onTap;

  IncreasesDecreasesContainer({
    Key? key,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(
            color: AppColors.blueColor,
            width: 1,
          ),
        ),
      ),
      child: Icon(
        icon,
        color: AppColors.blueColor,
        size: 30,
      ),
    );
  }
}

// GestureDetector(
// onTap: onTap,
// child: Container(
// alignment: Alignment.center,
// padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(18),
// border: Border.all(width: 1, color: AppColors.blueColor),
// ),
// child: Icon(
// icon,
// color: AppColors.blueColor,
// size: 30,
// ),
// ),
// )
