import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/app_color.dart';
import '../../../core/app_string.dart';
import '../manager/hotel_cubit.dart';
import '../manager/hotel_state.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_container.dart';
import '../widgets/custom_dropdown_button_nationality.dart';
import '../widgets/custom_dropdown_button_room.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_text_form_field.dart';


class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  static const String routeName = 'homeScreen';

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HotelCubit, HotelState>(
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Container(
              height:MediaQuery
                  .of(context)
                  .size
                  .height ,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/background.webp'), // Replace with your image asset path
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                          left: 20, bottom: 20, top: 20, right: 80),
                      decoration: BoxDecoration(
                        color: AppColors.blueColor,
                        border:
                            Border.all(color: AppColors.whiteColor, width: 2),
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.elliptical(100, 70),
                        ),
                      ),
                      child: CustomText(
                        text: AppStrings.hotelSearch,
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: AppColors.lightBlueColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          CustomTextFormField(
                            hint: AppStrings.selectCity,
                            controller: controller,
                            color: AppColors.blueColor,
                            keyboardType: TextInputType.text,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const CustomContainer(),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomDropDownButtonNationality(),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomDropDownButtonRoom(),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const CustomButton()
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
