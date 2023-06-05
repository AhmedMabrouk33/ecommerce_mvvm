import 'package:app/features/account/profile/ui/profile_bottom_sheet_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view_models/profile_edit_view_model.dart';

import '../repositories/profile_repository.dart';

class ProfileEditBottomSheet {
  final ProfileRepository profileRepository;

  const ProfileEditBottomSheet({required this.profileRepository});

  Widget build(ProfileEditViewModel profileEditViewModel) {
    return profileEditViewModel is ProfileImageEditViewModel
        ? _newImage(profileEditViewModel)
        : profileEditViewModel is ProfileNameEditViewModel
            ? _newName(profileEditViewModel)
            : profileEditViewModel is ProfileEmailEditViewModel
                ? _newEmail(profileEditViewModel)
                : _newPassword(
                    profileEditViewModel as ProfilePasswordEditViewModel,
                  );
  }

  Widget _newImage(ProfileImageEditViewModel profileEditViewModel) {
    final double containerHeight = Get.size.height * 0.375;
    return GetBuilder<ProfileImageEditViewModel>(
      init: Get.put<ProfileImageEditViewModel>(profileEditViewModel),
      dispose: (state) => Get.delete<ProfileImageEditViewModel>(),
      builder: (controller) {
        return controller.bottomSheetState == BottomSheetState.edit
            ? ProfileBottomSheetWidgets.imageWidget(
                height: containerHeight,
                imageFile: controller.readPickedImage,
                pickedMethod: controller.pickedImaged,
                uploadMethod: controller.updateElement,
              )
            : controller.bottomSheetState == BottomSheetState.updating
                ? ProfileBottomSheetWidgets.updatingBottomSheet(containerHeight)
                : ProfileBottomSheetWidgets.errorBottomSheet(
                    height: containerHeight,
                    errorMessage: controller.errorMessage,
                    tryAgainAction: controller.resetBottomSheetState,
                  );
      },
    );
  }

  Widget _newName(ProfileNameEditViewModel profileEditViewModel) {
    final double containerHeight = Get.size.height * 0.25;
    return GetBuilder<ProfileNameEditViewModel>(
      init: Get.put<ProfileNameEditViewModel>(profileEditViewModel),
      dispose: (state) => Get.delete<ProfileNameEditViewModel>(),
      builder: (controller) {
        return controller.bottomSheetState == BottomSheetState.edit
            ? ProfileBottomSheetWidgets.textWidget(
                height: containerHeight,
                label: 'Name',
                textFieldController: controller.textFieldController,
                inputType: TextInputType.name,
                uploadMethod: controller.updateElement,
              )
            : controller.bottomSheetState == BottomSheetState.updating
                ? ProfileBottomSheetWidgets.updatingBottomSheet(containerHeight)
                : ProfileBottomSheetWidgets.errorBottomSheet(
                    height: containerHeight,
                    errorMessage: controller.errorMessage,
                    tryAgainAction: controller.resetBottomSheetState,
                  );
      },
    );
  }

  Widget _newEmail(ProfileEmailEditViewModel profileEditViewModel) {
    final double containerHeight = Get.size.height * 0.25;
    return GetBuilder<ProfileEmailEditViewModel>(
      init: Get.put<ProfileEmailEditViewModel>(profileEditViewModel),
      dispose: (state) => Get.delete<ProfileEmailEditViewModel>(),
      builder: (controller) {
        return controller.bottomSheetState == BottomSheetState.edit
            ? ProfileBottomSheetWidgets.textWidget(
                height: containerHeight,
                label: 'E-mail',
                textFieldController: controller.textFieldController,
                inputType: TextInputType.emailAddress,
                uploadMethod: controller.updateElement,
              )
            : controller.bottomSheetState == BottomSheetState.updating
                ? ProfileBottomSheetWidgets.updatingBottomSheet(containerHeight)
                : ProfileBottomSheetWidgets.errorBottomSheet(
                    height: containerHeight,
                    errorMessage: controller.errorMessage,
                    tryAgainAction: controller.resetBottomSheetState,
                  );
      },
    );
  }

  Widget _newPassword(ProfilePasswordEditViewModel profileEditViewModel) {
    final double containerHeight = Get.size.height * 0.375;
    return GetBuilder<ProfilePasswordEditViewModel>(
      init: Get.put<ProfilePasswordEditViewModel>(profileEditViewModel),
      dispose: (state) => Get.delete<ProfilePasswordEditViewModel>(),
      builder: (controller) {
        return controller.bottomSheetState == BottomSheetState.edit
            ? ProfileBottomSheetWidgets.passwordWidget(
                height: containerHeight,
                oldTextFieldController: controller.oldTextFieldController,
                newTextFieldController: controller.newTextFieldController,
                uploadMethod: controller.updateElement,
              )
            : controller.bottomSheetState == BottomSheetState.updating
                ? ProfileBottomSheetWidgets.updatingBottomSheet(containerHeight)
                : ProfileBottomSheetWidgets.errorBottomSheet(
                    height: containerHeight,
                    errorMessage: controller.errorMessage,
                    tryAgainAction: controller.resetBottomSheetState,
                  );
      },
    );
  }
}
