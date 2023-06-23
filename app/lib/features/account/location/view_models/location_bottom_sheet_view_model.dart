import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/location_bottom_sheet_text.dart';

import '../models/location_model.dart';

import '../view_models/location_view_model.dart';

import '../../../../core/data/universal_data.dart';
import '../../../../core/data/repository_configuration.dart';

enum LocationBottomSheetState { edit, updating, fail }

class LocationBottomSheetViewModel extends GetxController {
  final int? index;

  String errorMessage = '';

  late final String bottomSheetTitle;

  LocationBottomSheetViewModel({
    required this.index,
  });

  LocationBottomSheetState bottomSheetState = LocationBottomSheetState.edit;

  late String title;
  late String buildingNo;
  late String flatNo;
  late String street;
  late String city;
  late String area;
  late bool _isMainLocation;

  @override
  void onInit() {
    if (index != null) {
      bottomSheetTitle = LocationBottomSheetText.editBottomSheetText;
      title = userLocations[index!].title;
      buildingNo = userLocations[index!].buildingNo;
      flatNo = userLocations[index!].flatNo;
      street = userLocations[index!].streetAddress;
      city = userLocations[index!].city;
      area = userLocations[index!].area;
      _isMainLocation = userLocations[index!].isMainAddress;
    } else {
      bottomSheetTitle = LocationBottomSheetText.newBottomSheetText;
      title = buildingNo = flatNo = street = city = area = '';
      _isMainLocation = userLocations.isEmpty ? true : false;
    }
    super.onInit();
  }

  void updateBottomSheetState({
    LocationBottomSheetState newBottomSheetState =
        LocationBottomSheetState.edit,
  }) {
    print('New Bottom Sheet State is $newBottomSheetState');
    bottomSheetState = newBottomSheetState;
    update();
  }

  void updateAction(GlobalKey<FormState> formKey) {
    if (formKey.currentState!.validate()) {
      updateBottomSheetState(
        newBottomSheetState: LocationBottomSheetState.updating,
      );

      formKey.currentState!.save();

      var userId = userData.id.toString();

      LocationModel locationModel = LocationModel(
        id: '-1',
        title: title,
        buildingNo: buildingNo,
        flatNo: flatNo,
        streetAddress: street,
        city: city,
        area: area,
        isMainAddress: _isMainLocation,
      );

      (index == null
              ? ApplicationRepositories.locationRepository.sendNewLocation(
                  userId: userId,
                  newLocation: locationModel,
                )
              : ApplicationRepositories.locationRepository.updateLocation(
                  location: locationModel,
                ))
          .then(
        (locationResponse) {
          print('Location sent to backend');
          index == null
              ? userLocations.add(locationResponse)
              : userLocations[index!] = locationResponse;

          Get.find<LocationViewModel>().rebuild(index);

          Get.back();
        },
      ).catchError(
        (error) {
          print(
              'There is error in request\n#######################################################');
          print('Error Message is $error');
          errorMessage = error;
          updateBottomSheetState(
            newBottomSheetState: LocationBottomSheetState.fail,
          );
        },
      );
    }
  }

  String? validateTextField({
    required String? textInput,
    required String textFieldTitle,
  }) {
    switch (textFieldTitle) {
      case LocationBottomSheetText.titleText:
      case LocationBottomSheetText.streetText:
      case LocationBottomSheetText.cityText:
      case LocationBottomSheetText.areaText:
        return textInput != null
            ? (_validateTextInput(textInput) ? null : '* Invalid input')
            : '* Required field';

      case LocationBottomSheetText.buildingNoText:
      case LocationBottomSheetText.flatNoText:
        return textInput != null
            ? (_validateNumberInput(textInput) ? null : '* Invalid input')
            : '* Required field';

      default:
        return '* This field has default validation';
    }
  }

  void saveTextField({
    required String? textInput,
    required String textFieldTitle,
  }) {
    switch (textFieldTitle) {
      case LocationBottomSheetText.titleText:
        title = textInput!.trim();
      case LocationBottomSheetText.streetText:
        street = textInput!.trim();
      case LocationBottomSheetText.cityText:
        city = textInput!.trim();
      case LocationBottomSheetText.areaText:
        area = textInput!.trim();
      case LocationBottomSheetText.buildingNoText:
        buildingNo = textInput!.trim();
      case LocationBottomSheetText.flatNoText:
        flatNo = textInput!.trim();
      default:
    }
  }

  bool _validateTextInput(String textInput) {
    return textInput.trim().isNotEmpty && textInput.trim().length > 3;
  }

  bool _validateNumberInput(String numberInput) {
    final int tempNumber = int.tryParse(numberInput.trim()) ?? 0;
    return tempNumber > 0;
  }
}
