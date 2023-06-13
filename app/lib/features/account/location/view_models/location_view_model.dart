import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/data/universal_data.dart';

import '../../../../core/data/repository_configuration.dart';

class _DialogTitle {
  static const String updateTitle = 'Requesting';
  static const String errorTitle = 'Error';
  static const String completedTitle = 'Completed';
}

class LocationViewModel extends GetxController {
  bool isInDeleteAction = false;

  late int _selectedMainIndex;

  LocationViewModel();

  String locationControllerId(int index) => 'Location-$userLocations[index].id';

  int get userLocationLength => userLocations.length;

  String title(int index) => userLocations[index].title;

  String addressDetails(int index) =>
      '${userLocations[index].flatNo}, ${userLocations[index].buildingNo}, ${userLocations[index].streetAddress}, ${userLocations[index].area}, ${userLocations[index].city}';

  bool isSelected(int index) {
    if (!userLocations[index].isMainAddress) {
      return false;
    } else {
      _selectedMainIndex = index;
      return true;
    }
  }

  Future<bool> deleteAction(int index) async {
    isInDeleteAction = true;

    _showSnackBar(_DialogTitle.updateTitle, null);

    return await ApplicationRepositories.locationRepository
        .deleteLocation(userLocations[index].id)
        .then(
      (value) async {
        isInDeleteAction = false;

        await _showSnackBar(_DialogTitle.completedTitle, 'Location is deleted');

        userLocations.removeAt(index);

        index == _selectedMainIndex
            ? userLocations.first.isMainAddress = true
            : null;

        rebuild(null);

        return true;
      },
    ).catchError(
      (errorMessage) {
        print('Error message is $errorMessage');

        isInDeleteAction = false;

        _showSnackBar(_DialogTitle.errorTitle, errorMessage);

        return false;
      },
    );
  }

  void selectAction(int index) {
    if (_selectedMainIndex != index) {
      userLocations[_selectedMainIndex].isMainAddress = false;
      rebuild(_selectedMainIndex);
      userLocations[index].isMainAddress = true;
      rebuild(index);
    }
  }

  void rebuild(int? index) {
    update(index != null ? [locationControllerId(index)] : null);
  }

  Future<void> _showSnackBar(
    String snackbarTitle,
    String? snackbarMessage,
  ) async {
    Get.closeCurrentSnackbar();

    await Get.snackbar(
      snackbarTitle,
      snackbarMessage ?? 'Waiting to delete selected location',
      duration: snackbarTitle == _DialogTitle.updateTitle
          ? const Duration(seconds: 60)
          : snackbarTitle == _DialogTitle.errorTitle
              ? const Duration(seconds: 5)
              : const Duration(seconds: 3),
      colorText: snackbarTitle != _DialogTitle.errorTitle
          ? Colors.black
          : Colors.white,
      borderRadius: 25,
      backgroundColor: snackbarTitle != _DialogTitle.errorTitle
          ? const Color(0xffAECAB1)
          : Colors.red,
      isDismissible: false,
      borderColor: Colors.black,
      maxWidth: double.infinity,
      borderWidth: 2,
      showProgressIndicator:
          snackbarTitle == _DialogTitle.updateTitle ? true : false,
      overlayBlur: 2,
      overlayColor: Colors.grey,
    );
  }
}
