import 'package:get/get.dart';

import '../../../core/routes/routes_name.dart';

class GeneralBottomNavBarViewModel extends GetxController {
  late String currentRoute;

  GeneralBottomNavBarViewModel();

  @override
  void onInit() {
    currentRoute = RoutesName.exploreHome;
    super.onInit();
  }

  bool isSelectedItem(String itemRoute) => currentRoute.contains(itemRoute);

  void pushNewRoute(String newRoute) {
    if (newRoute != currentRoute) {
      currentRoute = newRoute;
      // FIXME: Check if selected item is explore item pop all screen until explore page,
      (currentRoute != RoutesName.exploreHome)
          ? Get.toNamed(newRoute)
          : Get.until((route) => route.isFirst);
      update();
    }
  }

  void popAction() {
    Get.back();
    currentRoute = Get.currentRoute;
    update();
  }
}
