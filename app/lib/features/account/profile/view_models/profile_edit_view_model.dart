import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'profile_view_model.dart';

import '../repositories/profile_repository.dart';

import '../../../../core/data/universal_data.dart';
import '../constants/profile_build_id.dart';

enum BottomSheetState { edit, fail, updating }

abstract class ProfileEditViewModel extends GetxController {
  final ProfileRepository profileRepository;
  String errorMessage;
  BottomSheetState bottomSheetState;

  ProfileEditViewModel({
    required this.profileRepository,
    this.errorMessage = '',
    this.bottomSheetState = BottomSheetState.edit,
  });

  void updateElement() {}

  void _updateMainController(String controllerId) {
    Get.find<ProfileViewModel>().rebuild(controllerId);
  }

  bool _isValid();

  void resetBottomSheetState() {
    bottomSheetState = BottomSheetState.edit;
    update();
  }
}

class ProfileImageEditViewModel extends ProfileEditViewModel {
  @override
  void onInit() {
    print('This file has been called');
    super.onInit();
  }

  XFile? _pickedImage;

  ProfileImageEditViewModel({required super.profileRepository});

  @override
  void updateElement() async {
    if (_isValid()) {
      bottomSheetState = BottomSheetState.updating;
      update();

      await profileRepository
          .uploadNewImage(
        userId: userData.id.toString(),
        newImage: _pickedImage!.path,
      )
          .then(
        (imageResponse) {
          userData.userImage = imageResponse;
          _updateMainController(profileImageControllerID);
          Get.back();
        },
      ).catchError(
        (errorResponse) {
          bottomSheetState = BottomSheetState.fail;
          errorMessage = errorResponse;
          update();
        },
      );
    } else {
      errorMessage = 'Please select image to upload';
      bottomSheetState = BottomSheetState.fail;
      update();
    }
  }

  File? get readPickedImage =>
      _pickedImage != null ? File(_pickedImage!.path) : null;

  Future<void> pickedImaged() async {
    await ImagePicker().pickImage(source: ImageSource.camera).then(
      (pickedImage) {
        if (pickedImage != null) {
          _pickedImage = pickedImage;
          update();
        }
      },
    );
  }

  @override
  bool _isValid() => _pickedImage != null;
}

class ProfileEmailEditViewModel extends ProfileEditViewModel {
  final TextEditingController textFieldController = TextEditingController();
  // final String label = 'Email';

  ProfileEmailEditViewModel({required super.profileRepository});

  @override
  void updateElement() async {
    if (_isValid()) {
      bottomSheetState = BottomSheetState.updating;
      update();

      await profileRepository
          .uploadNewEmail(
        userId: userData.id.toString(),
        newEmail: _readEmail,
      )
          .then(
        (emailResponse) {
          userData.userEmail = emailResponse;
          _updateMainController(profileEmailControllerID);
          Get.back();
        },
      ).catchError(
        (errorResponse) {
          bottomSheetState = BottomSheetState.fail;
          errorMessage = errorResponse;
          update();
        },
      );
    } else {
      errorMessage = 'Please Enter your new Email';
      bottomSheetState = BottomSheetState.fail;
      update();
    }
  }

  @override
  bool _isValid() => _readEmail.isNotEmpty;

  String get _readEmail => textFieldController.text.trim();
}

class ProfileNameEditViewModel extends ProfileEditViewModel {
  final TextEditingController textFieldController = TextEditingController();
  // final String label = 'Name';

  ProfileNameEditViewModel({required super.profileRepository});

  @override
  void updateElement() async {
    if (_isValid()) {
      bottomSheetState = BottomSheetState.updating;
      update();

      await profileRepository
          .uploadNewName(
        userId: userData.id.toString(),
        newName: _readName,
      )
          .then(
        (nameResponse) {
          userData.userName = nameResponse;
          _updateMainController(profileNameControllerID);
          Get.back();
        },
      ).catchError(
        (errorResponse) {
          bottomSheetState = BottomSheetState.fail;
          errorMessage = errorResponse;
          update();
        },
      );
    } else {
      errorMessage = 'Please Enter your new Name';
      bottomSheetState = BottomSheetState.fail;
      update();
    }
  }

  @override
  bool _isValid() => _readName.isNotEmpty;

  String get _readName => textFieldController.text.trim();
}

class ProfilePasswordEditViewModel extends ProfileEditViewModel {
  final TextEditingController newTextFieldController = TextEditingController();
  final TextEditingController oldTextFieldController = TextEditingController();

  ProfilePasswordEditViewModel({required super.profileRepository});
  @override
  void updateElement() async {
    if (_isValid()) {
      bottomSheetState = BottomSheetState.updating;
      update();

      await profileRepository
          .uploadNewPassword(
        userId: userData.id.toString(),
        oldPassword: _readOldPassword,
        newPassword: _readNewPassword,
      )
          .then(
        (passwordResponse) {
          userData.userPassword = passwordResponse;
          _updateMainController(profilePasswordControllerID);
          Get.back();
        },
      ).catchError(
        (errorResponse) {
          bottomSheetState = BottomSheetState.fail;
          errorMessage = errorResponse;
          update();
        },
      );
    } else {
      errorMessage =
          'Error in your input\nPlease check your current password and new password';
      bottomSheetState = BottomSheetState.fail;
      update();
    }
  }

  @override
  bool _isValid() =>
      _readOldPassword.isNotEmpty &&
      _readNewPassword.isNotEmpty &&
      (_readOldPassword != userData.userPassword) &&
      (_readNewPassword != _readOldPassword);

  String get _readNewPassword => newTextFieldController.text.trim();
  String get _readOldPassword => oldTextFieldController.text.trim();
}
