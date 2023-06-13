import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/ui/universal_ui.dart';
import '../constants/location_bottom_sheet_configuration.dart';

import '../../../../utils/widgets/app_bar/stander_app_bar.dart';

import '../view_models/location_view_model.dart';

import '../ui/location_title_ui.dart';
import '../ui/location_dialog_ui.dart';

import './location_bottom_sheet_view.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LocationTitleUi _locationTitleUi = LocationTitleUi(
      editMethod: _showBottomSheet,
      deleteMethod: _showAlertDialog,
      onTap: _selectedMethodAction,
    );
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          bottomNavBarController.popAction();
          return true;
        },
        child: SafeArea(
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const StanderAppBar(title: 'Location'),
                const SizedBox(height: 30),
                Expanded(
                  child: GetBuilder<LocationViewModel>(
                    init: Get.put<LocationViewModel>(
                      LocationViewModel(),
                    ),
                    builder: (controller) => controller.userLocationLength > 0
                        ? ListView.builder(
                            itemCount: controller.userLocationLength,
                            itemBuilder: (context, index) =>
                                GetBuilder<LocationViewModel>(
                              id: controller.locationControllerId(index),
                              builder: (controller) =>
                                  _locationTitleUi.buildWidget(
                                locationIndex: index,
                                title: controller.title(index),
                                details: controller.addressDetails(index),
                                isMainLocation: controller.isSelected(index),
                              ),
                            ),
                          )
                        : const Center(
                            child: Text(
                              'No location added',
                              style: TextStyle(
                                fontSize: 28,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(right: 15, bottom: 24),
                  child: ElevatedButton.icon(
                    onPressed: () => _showBottomSheet(null),
                    icon: LocationBottomSheetConfiguration.addIcon,
                    label: const Text('ADD'),
                    style: LocationBottomSheetConfiguration
                        .mainActionElevatedButtonStyle
                        .copyWith(
                      fixedSize: const MaterialStatePropertyAll<Size>(
                        Size(140, 70),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _selectedMethodAction(int locationIndex) =>
      Get.find<LocationViewModel>().selectAction(locationIndex);

  void _showBottomSheet(int? locationIndex) {
    Get.bottomSheet(
      isScrollControlled: true,
      useRootNavigator: true,
      isDismissible: true,
      LocationBottomSheetView.build(
        locationIndex: locationIndex,
        
      ),
    );
  }

  void _showAlertDialog(int locationIndex) {
    final LocationViewModel locationMainController =
        Get.find<LocationViewModel>();

    if (locationMainController.userLocationLength > 1) {
      locationMainController.isInDeleteAction = false;

      Get.dialog(
        barrierDismissible: false,
        useSafeArea: true,
        // routeSettings: const RouteSettings(),
        Dialog(
          backgroundColor: const Color(0xFFBCC5BC),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
          insetPadding: const EdgeInsets.only(top: 15, left: 25, right: 29),
          child: WillPopScope(
            onWillPop: () async => locationMainController.isInDeleteAction,
            child: LocationDialogUi.createDialog(
              locationTitle: locationMainController.title(locationIndex),
              cancelAction: () =>
                  !locationMainController.isInDeleteAction ? Get.back() : null,
              confirmAction: () async {
                // if (!locationMainController.isInDeleteAction) {
                final bool canPop =
                    await locationMainController.deleteAction(locationIndex);

                print('Return method is $canPop');
                // Get.dialo
                canPop ? Get.back(closeOverlays: true) : null;
              },
              // },
            ),
          ),
        ),
      );
    } else {
      Get.closeCurrentSnackbar();

      Get.snackbar(
        'Warning',
        'You must have at least 1-location saved',
        duration: const Duration(seconds: 3),
        colorText: Colors.black,
        borderRadius: 25,
        // backgroundColor: Colors.red,
        isDismissible: false,
        borderColor: Colors.black,
        maxWidth: double.infinity,
        borderWidth: 2,
        showProgressIndicator: false,
        // overlayBlur: 2,
        // overlayColor: Colors.grey,
      );
    }
  }
}
