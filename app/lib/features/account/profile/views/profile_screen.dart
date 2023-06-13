import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/widgets/app_bar/stander_app_bar.dart';

import '../constants/profile_build_id.dart';

import '../view_models/profile_edit_view_model.dart';

import '../ui/profile_change_password.dart';
import '../ui/profile_title_card.dart';
import '../ui/profile_image.dart';

import './profile_edit_bottom_sheet.dart';

import '../../../../core/ui/universal_ui.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  final ProfileEditBottomSheet _profileEditBottomSheet =
      const ProfileEditBottomSheet();

  @override
  Widget build(BuildContext context) {
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
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const StanderAppBar(title: 'Profile'),
                  const SizedBox(height: 50),
                  const ProfileImage().buildWidget(
                    () => _showBottomSheet(
                      ProfileImageEditViewModel(),
                    ),
                  ),
                  const SizedBox(height: 35),
                  const ProfileTitleCard(
                    controllerID: profileNameControllerID,
                    title: 'Name',
                    leadingIcon: Icons.account_box_outlined,
                  ).buildWidget(
                    () => _showBottomSheet(
                      ProfileNameEditViewModel(),
                    ),
                  ),
                  const SizedBox(height: 35),
                  const ProfileTitleCard(
                    controllerID: profileEmailControllerID,
                    title: 'Email',
                    leadingIcon: Icons.email,
                  ).buildWidget(
                    () => _showBottomSheet(
                      ProfileEmailEditViewModel(),
                    ),
                  ),
                  const SizedBox(height: 35),
                  const ProfileChangePassword().buildWidget(
                    () => _showBottomSheet(
                      ProfilePasswordEditViewModel(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showBottomSheet(ProfileEditViewModel profileEditViewModel) {
    Get.bottomSheet<void>(
      enableDrag: false,
      isScrollControlled: true,
      useRootNavigator: true,
      isDismissible: false,
      ignoreSafeArea: false,
      // settings: const RouteSettings(),
      _profileEditBottomSheet.build(profileEditViewModel),
    );
  }
}
