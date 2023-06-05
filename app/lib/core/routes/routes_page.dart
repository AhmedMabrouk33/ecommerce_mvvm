import 'package:get/get.dart';

import './routes_name.dart';

import '../../features/account/profile/views/profile_screen.dart';

class RoutesPage {
  static List<GetPage<void>> pages = [
     GetPage(
      name: RoutesName.profile,
      page: () => const ProfileScreen(),
    ),
  ];
}
