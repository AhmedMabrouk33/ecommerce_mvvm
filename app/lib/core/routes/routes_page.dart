import 'package:get/get.dart';

import './routes_name.dart';

import '../../features/account/profile/views/profile_screen.dart';
import '../../features/account/location/views/location_screen.dart';

class RoutesPage {
  static List<GetPage<void>> pages = [
    // ********* * Account Features. ************ /
    GetPage(
      name: RoutesName.profile,
      page: () => const ProfileScreen(),
    ),
    GetPage(
      name: RoutesName.myLocation,
      page: () => const LocationScreen(),
    ),
  ];
}
