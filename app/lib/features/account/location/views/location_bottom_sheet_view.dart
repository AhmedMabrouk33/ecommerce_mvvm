import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/widgets/text_field/custom_text_form_field.dart';

import '../view_models/location_bottom_sheet_view_model.dart';

import '../constants/location_bottom_sheet_configuration.dart';
import '../constants/location_bottom_sheet_text.dart';

import '../repositories/location_repository.dart';

class LocationBottomSheetView {
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  static Widget build({
    int? locationIndex,
    required LocationRepository locationRepository,
  }) {
    final double bottomSheetHeight = Get.size.height * 0.935;
    return SizedBox(
      height: bottomSheetHeight,
      width: double.infinity,
      child: GetBuilder<LocationBottomSheetViewModel>(
        init: Get.put<LocationBottomSheetViewModel>(
          LocationBottomSheetViewModel(
            index: locationIndex,
            locationRepository: locationRepository,
          ),
        ),
        dispose: (state) => Get.delete<LocationBottomSheetViewModel>(),
        builder: (controller) => controller.bottomSheetState ==
                LocationBottomSheetState.edit
            ? _editingWidget(controller, bottomSheetHeight)
            : controller.bottomSheetState == LocationBottomSheetState.updating
                ? _updatingWidget()
                : _errorWidget(controller.errorMessage),
      ),
    );
  }

  static Widget _editingWidget(
      LocationBottomSheetViewModel controller, double bottomSheetHeight) {
    return Form(
      key: _formKey,
      child: Container(
        decoration:
            LocationBottomSheetConfiguration.normalBottomSheetDecoration,
        padding: const EdgeInsets.only(left: 18, right: 18),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(height: 42),
              Text(
                controller.bottomSheetTitle,
                style: const TextStyle(
                  fontSize: 18,
                  color: Color(0xff53532F),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 71),
              CustomTextFormField.creteTextField(
                initialValue: controller.title,
                label: LocationBottomSheetText.titleText,
                validatorMethod: (inputText) => controller.validateTextField(
                  textInput: inputText,
                  textFieldTitle: LocationBottomSheetText.titleText,
                ),
                onSaveMethod: (inputText) => controller.saveTextField(
                  textInput: inputText,
                  textFieldTitle: LocationBottomSheetText.titleText,
                ),
                keyboardType: TextInputType.name,
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: CustomTextFormField.creteTextField(
                      initialValue: controller.buildingNo,
                      keyboardType: TextInputType.number,
                      label: LocationBottomSheetText.buildingNoText,
                      validatorMethod: (inputText) =>
                          controller.validateTextField(
                        textInput: inputText,
                        textFieldTitle: LocationBottomSheetText.buildingNoText,
                      ),
                      onSaveMethod: (inputText) => controller.saveTextField(
                        textInput: inputText,
                        textFieldTitle: LocationBottomSheetText.buildingNoText,
                      ),
                    ),
                  ),
                  const SizedBox(width: 42),
                  Expanded(
                    child: CustomTextFormField.creteTextField(
                      initialValue: controller.flatNo,
                      keyboardType: TextInputType.number,
                      label: LocationBottomSheetText.flatNoText,
                      validatorMethod: (inputText) =>
                          controller.validateTextField(
                        textInput: inputText,
                        textFieldTitle: LocationBottomSheetText.flatNoText,
                      ),
                      onSaveMethod: (inputText) => controller.saveTextField(
                        textInput: inputText,
                        textFieldTitle: LocationBottomSheetText.flatNoText,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              CustomTextFormField.creteTextField(
                initialValue: controller.street,
                label: LocationBottomSheetText.streetText,
                keyboardType: TextInputType.name,
                validatorMethod: (inputText) => controller.validateTextField(
                  textInput: inputText,
                  textFieldTitle: LocationBottomSheetText.streetText,
                ),
                onSaveMethod: (inputText) => controller.saveTextField(
                  textInput: inputText,
                  textFieldTitle: LocationBottomSheetText.streetText,
                ),
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: CustomTextFormField.creteTextField(
                      initialValue: controller.city,
                      keyboardType: TextInputType.name,
                      label: LocationBottomSheetText.cityText,
                      validatorMethod: (inputText) =>
                          controller.validateTextField(
                        textInput: inputText,
                        textFieldTitle: LocationBottomSheetText.cityText,
                      ),
                      onSaveMethod: (inputText) => controller.saveTextField(
                        textInput: inputText,
                        textFieldTitle: LocationBottomSheetText.cityText,
                      ),
                    ),
                  ),
                  const SizedBox(width: 42),
                  Expanded(
                    child: CustomTextFormField.creteTextField(
                      initialValue: controller.area,
                      keyboardType: TextInputType.name,
                      label: LocationBottomSheetText.areaText,
                      validatorMethod: (inputText) =>
                          controller.validateTextField(
                        textInput: inputText,
                        textFieldTitle: LocationBottomSheetText.areaText,
                      ),
                      onSaveMethod: (inputText) => controller.saveTextField(
                        textInput: inputText,
                        textFieldTitle: LocationBottomSheetText.areaText,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: bottomSheetHeight * 0.2299),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: Get.back,
                      style: LocationBottomSheetConfiguration
                          .sideActionElevatedButtonStyle,
                      child: const Text('Cancel'),
                    ),
                  ),
                  const SizedBox(width: 36),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => controller.updateAction(_formKey),
                      style: LocationBottomSheetConfiguration
                          .mainActionElevatedButtonStyle,
                      child: const Text('Update'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 38),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _updatingWidget() {
    return Container(
      decoration: LocationBottomSheetConfiguration.normalBottomSheetDecoration,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          LocationBottomSheetConfiguration.updatingCircleIndicator,
          Text(
            'Updating..........',
            style: TextStyle(
              fontSize: 28,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  static Widget _errorWidget(String error) {
    return Container(
      decoration: LocationBottomSheetConfiguration.errorBottomSheetDecoration,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          LocationBottomSheetConfiguration.infoErrorBottomSheetIcon,
          Text(
            error,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          ElevatedButton(
            onPressed:
                Get.find<LocationBottomSheetViewModel>().updateBottomSheetState,
            style:
                LocationBottomSheetConfiguration.sideActionElevatedButtonStyle,
            child: const Text('Try Again'),
          ),
        ],
      ),
    );
  }
}
