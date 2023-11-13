import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numberpicker/numberpicker.dart';

import 'hotel_state.dart';

class HotelCubit extends Cubit<HotelState> {
  HotelCubit() : super(InitialState());

  DateTime start = DateTime.now();
  DateTime end = DateTime.now().add(const Duration(days: 30));
  String? selectNationality;
  List<String> listOfNationality = ['Egyptian', 'Palestinian', 'Saudi'];
  bool status = false;
  int roomCount = 1;

  int adultCount = 1;

  int childrenCount = 0;

  List<int> childList = [];
  int? selectedIndex;
  int currentAgeValue = 10;

  int? newUpdateAge;

  Future<DateTimeRange?> getRangeDate(BuildContext context) async {
    var pickRangeDate = await showDateRangePicker(
      context: context,
      firstDate: start,
      lastDate: end,
    );
    if (pickRangeDate != null) {
      start = pickRangeDate.start;
      end = pickRangeDate.end;
    }
    emit(UpdateRangeDateState());
    return pickRangeDate;
  }

  void changeSelectNationality(String? value) {
    selectNationality = value;
    emit(SuccessChangeSelectNationality());
  }

  void changeSwitch() {
    status = !status;
    emit(SuccessChangeSwitch());
  }

  void decreasesRoomCount() {
    roomCount--;
    emit(SuccessDecreasesCount());
  }

  void increasesRoomCount() {
    roomCount++;
    emit(SuccessIncreasesCount());
  }

  void decreasesAdultCount() {
    adultCount--;
    emit(SuccessDecreasesCount());
  }

  void increasesAdultCount() {
    adultCount++;
    emit(SuccessIncreasesCount());
  }

  void decreasesChildrenCount() {
    childrenCount--;
    childList.removeLast();
    emit(SuccessDecreasesCount());
  }

  void increasesChildrenCount() {
    childrenCount++;
    childList.add(0);
    emit(SuccessChangeAgeOfChildren());
  }

  void updateChildrenCount(int index, int newUpdateAge) {
    childList[index] = newUpdateAge;
    emit(SuccessChangeAgeOfChildren());
  }


}
