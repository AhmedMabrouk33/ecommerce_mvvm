import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/location_bottom_sheet_configuration.dart';

class LocationDialogUi {
  static Widget createDialog({
    required String locationTitle,
    required void Function() confirmAction,
    required void Function() cancelAction,
  }) {
    var dialogHeight = Get.size.height * 0.32875;
    var dialogWidth = Get.size.width * 0.9;
    return SizedBox(
      height: dialogHeight,
      width: dialogWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          LocationBottomSheetConfiguration.infoErrorIcon,
          const SizedBox(height: 20),
          const Text(
            'Do you want to Delete',
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            '$locationTitle?',
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(width: dialogWidth * 0.0895),
                ElevatedButton(
                  onPressed: cancelAction,
                  style: LocationBottomSheetConfiguration
                      .mainActionElevatedButtonStyle
                      .copyWith(
                    fixedSize: MaterialStatePropertyAll<Size>(
                      Size(
                        // Get.size.width * 0.27777777777777777777777777777778,
                        dialogWidth * 0.30864,
                        50,
                      ),
                    ),
                  ),
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: confirmAction,
                  style: LocationBottomSheetConfiguration
                      .sideActionElevatedButtonStyle
                      .copyWith(
                    fixedSize: MaterialStatePropertyAll<Size>(
                      Size(
                        // Get.size.width * 0.27777777777777777777777777777778,
                        dialogWidth * 0.30864,
                        50,
                      ),
                    ),
                  ),
                  child: const Text('Confirm'),
                ),
                SizedBox(width: dialogWidth * 0.0771),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
