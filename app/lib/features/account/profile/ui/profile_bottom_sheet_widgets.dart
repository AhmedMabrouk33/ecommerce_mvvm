import 'dart:io';

import 'package:flutter/material.dart';

import '../constants/profile_bottom_sheet_configuration.dart';

class ProfileBottomSheetWidgets {
  static Widget updatingBottomSheet(double height) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: ProfileBottomSheetConfiguration.normalBottomSheetDecoration,
      child: const Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ProfileBottomSheetConfiguration.updatingCircleIndicator,
          Text(
            'Updating.....',
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }

  static Widget errorBottomSheet({
    required double height,
    required String errorMessage,
    required void Function() tryAgainAction,
  }) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: ProfileBottomSheetConfiguration.errorBottomSheetDecoration,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            errorMessage,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          ElevatedButton(
            onPressed: tryAgainAction,
            style:
                ProfileBottomSheetConfiguration.sideActionElevatedButtonStyle,
            child: const Text('Try Again'),
          ),
        ],
      ),
    );
  }

  static Widget imageWidget({
    required double height,
    required File? imageFile,
    required void Function() pickedMethod,
    required void Function() uploadMethod,
  }) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: ProfileBottomSheetConfiguration.normalBottomSheetDecoration,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
              color: const Color(0xffD9D9D9),
              shape: BoxShape.circle,
              image: imageFile == null
                  ? null
                  : DecorationImage(
                      image: FileImage(imageFile),
                      fit: BoxFit.cover,
                    ),
            ),
          ),
          ElevatedButton.icon(
            onPressed: pickedMethod,
            icon: const Icon(
              Icons.camera,
              size: 25,
              color: Color.fromARGB(214, 113, 132, 132),
            ),
            label: const Text('Pick Image'),
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(239, 50),
              foregroundColor: Colors.black,
              backgroundColor: const Color(0xffD9D9D9),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                side: BorderSide(
                  width: 2,
                  color: Color.fromARGB(214, 61, 151, 108),
                ),
              ),
              textStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          ElevatedButton.icon(
            onPressed: uploadMethod,
            icon: ProfileBottomSheetConfiguration.uploadIcon,
            label: const Text('Upload Image'),
            style:
                ProfileBottomSheetConfiguration.mainActionElevatedButtonStyle,
          ),
        ],
      ),
    );
  }

  static Widget textWidget({
    required double height,
    required String label,
    required TextEditingController textFieldController,
    required TextInputType inputType,
    required void Function() uploadMethod,
  }) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: ProfileBottomSheetConfiguration.normalBottomSheetDecoration,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            width: 273,
            child: TextField(
              controller: textFieldController,
              keyboardType: inputType,
              decoration: InputDecoration(labelText: label),
            ),
          ),
          ElevatedButton.icon(
            onPressed: uploadMethod,
            icon: ProfileBottomSheetConfiguration.uploadIcon,
            label: Text('Upload $label'),
            style:
                ProfileBottomSheetConfiguration.mainActionElevatedButtonStyle,
          ),
        ],
      ),
    );
  }

  static Widget passwordWidget({
    required double height,
    required TextEditingController oldTextFieldController,
    required TextEditingController newTextFieldController,
    required void Function() uploadMethod,
  }) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: ProfileBottomSheetConfiguration.normalBottomSheetDecoration,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            width: 273,
            child: TextField(
              controller: oldTextFieldController,
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              decoration: const InputDecoration(labelText: 'Old Password'),
            ),
          ),
          SizedBox(
            width: 273,
            child: TextField(
              controller: newTextFieldController,
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              decoration: const InputDecoration(labelText: 'New Password'),
            ),
          ),
          ElevatedButton.icon(
            onPressed: uploadMethod,
            icon: ProfileBottomSheetConfiguration.uploadIcon,
            label: const Text('Upload password'),
            style:
                ProfileBottomSheetConfiguration.mainActionElevatedButtonStyle,
          ),
        ],
      ),
    );
  }
}
