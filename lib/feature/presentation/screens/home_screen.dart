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
import '../widgets/trap.dart';


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
                    Row(
                      children: [
                        ClipPath(
                          clipper: TrapezoidClipper(),
                          child: Container(
                            width: MediaQuery.of(context).size.width / 2,
                            height: MediaQuery.of(context).size.height / 15,
                            decoration: BoxDecoration(
                                border: Border.all(color: AppColors.blueColor),
                                color: AppColors.blueColor),
                            child:  Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: CustomText(
                                text: AppStrings.hotelSearch,
                                color: AppColors.whiteColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                              ),
                            ),
                          ),
                        ),
                      ],
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
