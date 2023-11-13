import 'package:flutter/material.dart';

import '../../../core/app_color.dart';

typedef Validator = String? Function(String?)?;
typedef OnChanged = void Function(String)?;

class CustomTextFormField extends StatelessWidget {
  String hint;
  TextEditingController controller;
  Color color;
  TextInputType? keyboardType;

  CustomTextFormField({
    super.key,
    required this.hint,
    required this.controller,
    required this.color,
    required this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(7),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: TextFormField(
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColors.blueColor,
          fontWeight: FontWeight.w500,
          fontSize: 20,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.whiteColor,
          border: InputBorder.none,
          hintText: hint,
          hintStyle: TextStyle(
            color: AppColors.blueColor,
            fontWeight: FontWeight.w500,
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.blueColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.blueColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.blueColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.blueColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
