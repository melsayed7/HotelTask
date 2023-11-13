import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_hotel/feature/presentation/widgets/show_room_bottom_sheet.dart';

import '../../../core/app_color.dart';
import '../manager/hotel_cubit.dart';
import '../manager/hotel_state.dart';
import 'custom_text.dart';

class CustomDropDownButtonRoom extends StatelessWidget {
  CustomDropDownButtonRoom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HotelCubit, HotelState>(
      builder: (context, state) {
        var cubit = BlocProvider.of<HotelCubit>(context);
        return InkWell(
          onTap: () {
            showModalBottomSheet(
              context: context,
              backgroundColor: Colors.transparent,
              isScrollControlled: true,
              builder: (context) => ShowRoomBottomSheet(),
            );
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CustomText(
                      text: '${cubit.roomCount} Room,',
                      color: AppColors.blueColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                    CustomText(
                      text: '${cubit.adultCount} Adult,',
                      color: AppColors.blueColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                    CustomText(
                      text: '${cubit.childrenCount} Children',
                      color: AppColors.blueColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),

                  ],
                ),
                const Icon(
                  Icons.expand_more_outlined,
                  size: 30,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
