import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/profile_build_id.dart';


import '../view_models/profile_view_model.dart';



class ProfileTitleCard {
  const ProfileTitleCard({
    required this.controllerID,
    required this.title,
    required this.leadingIcon,
  });
  final String controllerID;
  final String title;
  final IconData leadingIcon;
  Widget buildWidget(
    void Function() onTap,
    // void Function(ProfileEditViewModel profileEditViewModel) onTapAction,
  ) {
    return SizedBox(
      height: 100,
      width: 330,
      child: Card(
        surfaceTintColor: const Color.fromARGB(176, 61, 151, 108),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        color: const Color.fromARGB(176, 61, 151, 108),
        child: InkWell(
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(width: 11),
              Icon(
                leadingIcon,
                color: Colors.black,
                size: 52.31,
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const SizedBox(height: 15),
                    Text(
                      title,
                      // TODO: THis Style will change to Get.theme.textTheme
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff53532F),
                      ),
                    ),
                    const SizedBox(height: 9),
                    Expanded(
                      // width: double.infinity,
                      child: GetBuilder<ProfileViewModel>(
                        id: controllerID,
                        init: Get.find<ProfileViewModel>(),
                        builder: (controller) => Text(
                          (controllerID == profileEmailControllerID)
                              ? controller.userEmail
                              : controller.userName,
                          // TODO: This Style will change to Get.theme.textTheme
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    // const SizedBox(height: 10),
                  ],
                ),
              ),
              const Icon(
                Icons.edit,
                color: Color.fromARGB(163, 113, 132, 132),
                size: 52.31,
              ),
              const SizedBox(width: 15.69),
            ],
          ),
        ),
      ),
    );
  }
}
