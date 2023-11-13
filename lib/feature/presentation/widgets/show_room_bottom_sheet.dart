import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch/flutter_switch.dart';

import 'package:numberpicker/numberpicker.dart';
import 'package:task_hotel/core/app_color.dart';
import 'package:task_hotel/feature/presentation/manager/hotel_cubit.dart';
import 'package:task_hotel/feature/presentation/manager/hotel_state.dart';
import 'package:task_hotel/feature/presentation/widgets/increases_decreases_container.dart';

import '../../../core/app_string.dart';
import 'add_children_component.dart';
import 'custom_text.dart';

class ShowRoomBottomSheet extends StatelessWidget {
  var currentAgeValue = 1;
  ShowRoomBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HotelCubit, HotelState>(
      builder: (context, state) {
        var cubit = BlocProvider.of<HotelCubit>(context);
        return SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height * .9,
            decoration: BoxDecoration(
              color: AppColors.grayLightColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * .09,
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: AppStrings.roomsAndGuests,
                        color: AppColors.blackColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .35,
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(
                          Icons.clear,
                          size: 25,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: AppStrings.rooms,
                              color: AppColors.blackColor,
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                cubit.roomCount == 1
                                    ? IncreasesDecreasesContainer(
                                        icon: Icons.remove,
                                        onTap: null,
                                      )
                                    : IncreasesDecreasesContainer(
                                        icon: Icons.remove,
                                        onTap: () {
                                          cubit.decreasesRoomCount();
                                        },
                                      ),
                                const SizedBox(
                                  width: 10,
                                ),
                                CustomText(
                                  text: '${cubit.roomCount}',
                                  color: AppColors.blackColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                IncreasesDecreasesContainer(
                                  icon: Icons.add,
                                  onTap: () {
                                    cubit.increasesRoomCount();
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            CustomText(
                              text: 'ROOM ${cubit.roomCount}',
                              color: AppColors.blackColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(
                                  text: AppStrings.adults,
                                  color: AppColors.blackColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    cubit.adultCount == 0
                                        ? IncreasesDecreasesContainer(
                                            icon: Icons.remove,
                                            onTap: null,
                                          )
                                        : IncreasesDecreasesContainer(
                                            icon: Icons.remove,
                                            onTap: () {
                                              cubit.decreasesAdultCount();
                                            },
                                          ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    CustomText(
                                      text: '${cubit.adultCount}',
                                      color: AppColors.blackColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    cubit.adultCount == 4
                                        ? IncreasesDecreasesContainer(
                                            icon: Icons.add,
                                            onTap: null,
                                          )
                                        : IncreasesDecreasesContainer(
                                            icon: Icons.add,
                                            onTap: () {
                                              cubit.increasesAdultCount();
                                            },
                                          ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(
                                  text: AppStrings.children,
                                  color: AppColors.blackColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    cubit.childrenCount == 0
                                        ? IncreasesDecreasesContainer(
                                            icon: Icons.remove,
                                            onTap: null,
                                          )
                                        : IncreasesDecreasesContainer(
                                            icon: Icons.remove,
                                            onTap: () {
                                              cubit.decreasesChildrenCount();
                                            },
                                          ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    CustomText(
                                      text: '${cubit.childrenCount}',
                                      color: AppColors.blackColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    cubit.childList.length > 7
                                        ? IncreasesDecreasesContainer(
                                            icon: Icons.add,
                                            onTap: null,
                                          )
                                        : IncreasesDecreasesContainer(
                                            icon: Icons.add,
                                            onTap: () {
                                              cubit.increasesChildrenCount();
                                            },
                                          ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                              SizedBox(
                                height: 100,
                                child: buildListView(cubit),
                              ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    CustomText(
                                      text: AppStrings.petFriendly,
                                      color: AppColors.blackColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    const Icon(Icons.info_outline_rounded),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                CustomText(
                                  text: AppStrings.onlyShowStays,
                                  color: AppColors.blackColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w300,
                                ),
                              ],
                            ),
                            FlutterSwitch(
                              value: cubit.status,
                              width: 60,
                              onToggle: (value) {
                                cubit.changeSwitch();
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height *.08,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          backgroundColor: AppColors.blueColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: CustomText(
                          text: AppStrings.apply,
                          color: AppColors.whiteColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  ListView buildListView(HotelCubit cubit) {
    return ListView.separated(
      itemCount: cubit.childList.length,
      separatorBuilder: (context, index) => const SizedBox(
        height: 5,
      ),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            openDialog(context, index, cubit);
          },
          child: AddChildrenComponent(
            ageOfChild: cubit.childList[index],
            numOfChildren: index + 1,
          ),
        );
      },
    );
  }

  void openDialog(BuildContext context, int index, HotelCubit cubit) {
    showDialog<int>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("chose child age"),
            content: StatefulBuilder(builder: (context, SBsetState) {
              return NumberPicker(
                  selectedTextStyle: const TextStyle(color: Colors.red),
                  value: currentAgeValue,
                  minValue: 0,
                  maxValue: 20,
                  onChanged: (value) {
                    currentAgeValue = value;
                    SBsetState(() => currentAgeValue = value);
                  });
            }),
            actions: [
              TextButton(
                child: const Text(
                  "OK",
                ),
                onPressed: () {
                  cubit.updateChildrenCount(index, currentAgeValue);
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
}
