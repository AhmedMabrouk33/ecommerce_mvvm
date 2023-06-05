import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view_models/profile_view_model.dart';

import '../constants/profile_build_id.dart';

class ProfileImage {
  const ProfileImage();

  Widget buildWidget(
    void Function() onTap,
  ) {
    final double mainContainerHeight = Get.size.height * 0.34965;
    final double editContainerHeight = mainContainerHeight * 0.1567;
    return GetBuilder<ProfileViewModel>(
      id: profileImageControllerID,
      init: Get.find<ProfileViewModel>(),
      builder: (controller) {
        return InkWell(
          onTap: onTap,
          child: Container(
            height: mainContainerHeight,
            width: 330,
            decoration: BoxDecoration(
              color: const Color(0xffD9D9D9),
              borderRadius: BorderRadius.circular(25),
              image: DecorationImage(
                image: NetworkImage(controller.userImage),
                fit: BoxFit.cover,
                onError: (exception, stackTrace) => Container(
                  color: Colors.transparent,
                ),
              ),
            ),
            alignment: Alignment.bottomCenter,
            child: Container(
              height: editContainerHeight,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color.fromARGB(150, 66, 94, 7),
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(25)),
              ),
              alignment: Alignment.center,
              // color: const Color.fromRGBO(66, 94, 7, 0.25),
              child: const Text(
                'Edit',
                textAlign: TextAlign.center,
                // TODO: This style will replace to Get.theme.textTheme
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
