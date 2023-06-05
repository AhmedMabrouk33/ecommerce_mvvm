import 'package:get/get.dart';

import '../../../../core/data/universal_data.dart';

class ProfileViewModel extends GetxController {
  ProfileViewModel();

  String get userEmail => userData.userEmail;
  String get userName => userData.userName;
  String get userImage =>
      userData.userImage;

  void rebuild(String controllerId) {
    update([controllerId]);
  }
}
