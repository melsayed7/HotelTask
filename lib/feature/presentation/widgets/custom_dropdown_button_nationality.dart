import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../core/app_color.dart';
import '../../../core/app_string.dart';
import '../manager/hotel_cubit.dart';
import '../manager/hotel_state.dart';

class CustomDropDownButtonNationality extends StatelessWidget {
  CustomDropDownButtonNationality({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HotelCubit, HotelState>(
      builder: (context, state) {
        var cubit = BlocProvider.of<HotelCubit>(context);
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              hint: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  BlocProvider.of<HotelCubit>(context).selectNationality == null
                      ? AppStrings.selectNationality
                      : BlocProvider.of<HotelCubit>(context).selectNationality!,
                  style: TextStyle(
                    color: AppColors.blueColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                  ),
                ),
              ),
              iconSize: 30,
              icon: const Padding(
                padding: EdgeInsets.only(right: 10),
                child:Icon(
                  Icons.expand_more_outlined,
                ),
              ),
              items: cubit.listOfNationality
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) {
                cubit.changeSelectNationality(value);
              },
            ),
          ),
        );
      },
    );
  }
}
