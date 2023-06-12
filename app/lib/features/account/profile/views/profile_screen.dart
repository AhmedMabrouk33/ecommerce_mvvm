import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/widgets/app_bar/stander_app_bar.dart';

import '../repositories/profile_test.dart';

import '../constants/profile_build_id.dart';

import '../view_models/profile_edit_view_model.dart';
import '../view_models/profile_view_model.dart';

import '../ui/profile_change_password.dart';
import '../ui/profile_title_card.dart';
import '../ui/profile_image.dart';

import './profile_edit_bottom_sheet.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  // final ProfileRepository _profileRepository = const ProfileTest();

  final ProfileEditBottomSheet _profileEditBottomSheet =
      const ProfileEditBottomSheet(profileRepository: ProfileTest());

  @override
  Widget build(BuildContext context) {
    // FIXME: Remove this line after create account screen.
    Get.put<ProfileViewModel>(ProfileViewModel());
    return Scaffold(
      body: SafeArea(
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
                    ProfileImageEditViewModel(
                      profileRepository:
                          _profileEditBottomSheet.profileRepository,
                    ),
                  ),
                ),
                const SizedBox(height: 35),
                const ProfileTitleCard(
                  controllerID: profileNameControllerID,
                  title: 'Name',
                  leadingIcon: Icons.account_box_outlined,
                ).buildWidget(
                  () => _showBottomSheet(
                    ProfileNameEditViewModel(
                      profileRepository:
                          _profileEditBottomSheet.profileRepository,
                    ),
                  ),
                ),
                const SizedBox(height: 35),
                const ProfileTitleCard(
                  controllerID: profileEmailControllerID,
                  title: 'Email',
                  leadingIcon: Icons.email,
                ).buildWidget(
                  () => _showBottomSheet(
                    ProfileEmailEditViewModel(
                      profileRepository:
                          _profileEditBottomSheet.profileRepository,
                    ),
                  ),
                ),
                const SizedBox(height: 35),
                const ProfileChangePassword().buildWidget(
                  () => _showBottomSheet(
                    ProfilePasswordEditViewModel(
                      profileRepository:
                          _profileEditBottomSheet.profileRepository,
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