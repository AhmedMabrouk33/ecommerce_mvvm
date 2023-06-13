import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view_models/profile_view_model.dart';

import '../constants/profile_build_id.dart';

class ProfileAccountCard {
  static Widget createUi() {
    return SizedBox(
      height: 120,
      width: double.infinity,
      child: Card(
        margin: const EdgeInsets.only(left: 15, right: 15),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.horizontal(
            left: Radius.circular(75),
            right: Radius.circular(25),
          ),
          side: BorderSide(width: 1, color: Color(0xffD9D9D9)),
        ),
        shadowColor: const Color(0xffD9D9D9),
        elevation: 15,
        surfaceTintColor: Colors.red,
        color: const Color.fromARGB(189, 217, 217, 217),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            GetBuilder<ProfileViewModel>(
              id: profileImageControllerID,
              builder: (profileController) {
                return Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle,
                    image: profileController.userImage.isNotEmpty
                        ? DecorationImage(
                            image: NetworkImage(profileController.userImage),
                            fit: BoxFit.cover,
                            onError: (exception, stackTrace) => Container(
                              height: 120,
                              width: 120,
                              decoration: const BoxDecoration(
                                color: Colors.grey,
                                shape: BoxShape.circle,
                              ),
                            ),
                          )
                        : null,
                  ),
                );
              },
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const SizedBox(height: 20),
                  GetBuilder<ProfileViewModel>(
                    id: profileNameControllerID,
                    builder: (controller) => Text(
                      controller.userName,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  GetBuilder<ProfileViewModel>(
                    id: profileEmailControllerID,
                    builder: (controller) => Expanded(
                      child: Text(
                        controller.userEmail,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                ],
              ),
            ),
            const SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}
